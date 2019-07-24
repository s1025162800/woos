
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="jquery.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="layui-form-item">
    <label class="layui-form-label">会议室名称</label>
    <div class="layui-input-block">
        <input type="text " style="width: 250px;"  id="room_name" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
    </div>
</div>
<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
    <div id="uploadImg" class="layui-upload">
        <button type="button" class="layui-btn" id="upload">
            <i class="layui-icon">&#xe67c;</i>上传主页图片<span style="color: red;font-size: 20px;">*</span>
        </button>
        <div class="layui-upload-list">
            <table class="layui-table" style="text-align: center;">
                <thead>
                <tr>
                    <th style="text-align: center;">图片预览</th>
                    <th style="text-align: center;">操作</th>
                </tr>
                </thead>
                <tbody id="imgList"></tbody>
            </table>
        </div>
        <button type="button" class="layui-btn" id="startUpload">开始上传</button>
        <div style="color: #c2c2c2;margin:10px 0;">温馨提示: 每次最多上传六张图片, 单张图片的大小不超过5MB, 长宽比例推荐1.5:1,
            推荐上传图片长675px,宽450px
        </div>
    </div>
    <input type="text" name="face_img" id="imgInput" style="display: none;" lay-verify="required">
</blockquote>
<div class="layui-form-item">
    <div class="layui-input-block">
        <button class="layui-btn" type="button" id="addroom">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</div>
<script>
    layui.use(['table', 'form', 'element', 'upload',], function () {
        var table = layui.table;
        var form = layui.form;
        var element = layui.element;
        var $ = layui.jquery;
        var upload = layui.upload;

        //多文件列表示例
        var demoListView = $('#imgList');
        var totalArray = new Array();
        var uploadInst = upload.render({
            elem: '#upload' //绑定元素
            , url: 'add' //上传接口
            , accept: 'images'  // 允许上传的文件类型
            // , acceptMime: 'image/jpg,image/png'   // (只支持jpg和png格式，多个用逗号隔开),
            , size: 100000        // 最大允许上传的文件大小  单位 KB
            , auto: false //选择文件后不自动上传
            , bindAction: '#startUpload' //指向一个按钮触发上传
            , multiple: true   // 开启多文件上传
            , number: 20    //  同时上传文件的最大个数
            , choose: function (obj) {
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                var arr = Object.keys(files);
                totalArray = totalArray.concat(arr);
                // 检查上传文件的个数
                if (totalArray.length <= 6) {
                    //读取本地文件
                    obj.preview(function (index, file, result) {
                        var tr = $(['<tr id="upload-' + index + '">'
                            , '<td><img src="' + result + '" alt="' + file.name + '" class="layui-upload-img" style="height: 66px;width:100px;"></td>'
                            , '<td>'
                            , '<button class="layui-btn demo-reload layui-hide">重传</button>'
                            , '<button class="layui-btn layui-btn-danger demo-delete">删除</button>'
                            , '</td>'
                            , '</tr>'].join(''));

                        //单个重传
                        tr.find('.demo-reload').on('click', function () {
                            obj.upload(index, file);
                        });

                        //删除
                        tr.find('.demo-delete').on('click', function () {
                            delete files[index]; //删除对应的文件
                            tr.remove();
                            uploadInst.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
                        });

                        demoListView.append(tr);
                    });
                } else {
                    // 超出上传最大文件
                    layer.msg("上传文件最大不超过6个")
                }

            }
            , done: function (res, index, upload) {
                console.log("res", res);
                if (res.code == 0) { //上传成功
                    // 上传成功后将图片路径拼接到input中，多个路径用","分割
                    var inputVal = document.getElementById("imgInput").value;
                    var valData = "";
                    if (inputVal) {
                        valData = inputVal + "," + res.data[0].fp_relative;
                    } else {
                        valData = res.data[0].fp_relative;
                    }
                    document.getElementById("imgInput").value = valData;
                    var tr = demoListView.find('tr#upload-' + index)
                        , tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
            }
            , error: function (index, upload) {
                var tr = demoListView.find('tr#upload-' + index)
                    , tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            }
        });
    });
    $('#addroom').click(function(){
        var room_name=document.getElementById('room_name').value;
        var room={"room_name":room_name};
        var jsonData = JSON.stringify(room);
        $.ajax({
            type:"post",
            url: "add",
            data:jsonData,
            dataType:"json",
            contentType : "application/json;charset=UTF-8",
            success: function(result){
            }
        });
        alert("提交成功去控制台查看吧");
    });
</script>
</body>
</html>
