<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/18 0018
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="layui/layui.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<%--<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;text-align: center">--%>
    <div style="margin-left: 150px;margin-top: 50px">
    <div class="layui-form-item" style="text-align: center">
        <label class="layui-form-label">会议室名称</label>
        <div class="layui-input-block">
            <input type="text "  id="room_name" style="width: 120px;"      lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item"  style="text-align: center">
        <label class="layui-form-label">面积</label>
        <div class="layui-input-block">
            <input type="text " id="area" style="width: 120px;"   lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">
            <input type="text "  id="price" style="width: 120px;"   lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="margin-left:-2px">房间状态</label>
                <select   id="state" style="width: 100px;height:35px;margin-right: 800px" >
                    <option >可用</option>
                    <option >已下架</option>
                </select>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="margin-left:-2px">房间类型</label>
            <select name="city" id="type_name" style="width: 100px;height:35px;margin-right: 800px" >
         <c:forEach items="${list}" var="type" varStatus="st"  >
                <option>${type.type_name}</option>
         </c:forEach>
            </select>
        </div>
        <div class="layui-form-item"  style="text-align: center">
        <label class="layui-form-label">最小容纳</label>
        <div class="layui-input-block">
            <input type="text " id="min_scale" style="width: 80px;"   lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
        <div class="layui-form-item"  style="text-align: center">
            <label class="layui-form-label">最大容纳</label>
            <div class="layui-input-block">
                <input type="text " id="max_scale" style="width: 80px;"   lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文本域</label>
            <div class="layui-input-block">
                <textarea id="description" style="width: 400px" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
    </div>

    <div id="uploadQRcode" class="layui-upload" style="margin-top:  -550px ;margin-left:500px">
        <button type="button" class="layui-btn" id="uploadQR">
            <i class="layui-icon">&#xe67c;</i>上传会议室主照片<span style="color: red;font-size: 20px;">*</span>
        </button>
        <div class="layui-upload-list">
            <img id="qrshow" src="" alt="" class="layui-upload-img"
                 style="height: 300px;width:300px;border:1px solid black;">
        </div>
        <div id="startDiv">
            <button type="button" class="layui-btn" id="startUploadQR">新增</button>
        </div>
        <%--<div style="color: #c2c2c2;margin:10px 0;">温馨提示: 每次最多上传一张图片, 单张图片的大小不超过2MB</div>--%>
    </div>
    <%--<input type="text" name="cli_qrcode" id="qrInput" style="display: none;" lay-verify="required">--%>
<%--</blockquote>--%>
<script>
    layui.use(['form', 'element', 'upload'], function () {
        var form = layui.form;
        var element = layui.element;
        var $ = layui.jquery;
        var upload = layui.upload;
        //单文件示例  选完文件后不自动上传
        var uploadSingle = upload.render({
            elem: '#uploadQR'
            , url: 'ttst'
            , accept: 'images'  // 允许上传的文件类型
            , size: 20000       // 最大允许上传的文件大小  单位 KB
            , auto: false
            , bindAction: '#startUploadQR'
            ,data: {room_name: function(){return $('#room_name').val()},
                price: function(){return $('#price').val()},
                state: function(){return $('#state').val()},
                type_name: function(){return $('#type_name').val()},
                min_scale: function(){return $('#min_scale').val()},
                max_scale: function(){return $('#max_scale').val()},
                description: function(){return $('#description').val()},
                area: function(){return $('#area').val()}
            } //可选项。额外的参数，如：{id: 123, abc: 'xxx'}
            , choose: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#qrshow').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res, index, upload) {
                console.log("res", res);
                if (res.code == 0) {
                    layer.alert(layer.msg())
                    setTimeout(function () {
                        window.location.href="${pageContext.request.contextPath}/RocketsUp.jsp"
                    },200);//上传成功
                    $("#qrInput").val(res.data[0].fp_relative);
                    var startDiv = $('#startDiv');
                    startDiv.html('<span style="color: #5FB878;">上传成功</span>');
                } else {
                    this.error(index, upload);
                }
            }
            , error: function (index, upload) {
                //演示失败状态，并实现重传
                var startDiv = $('#startDiv');
                startDiv.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload" style="width:50px;height:30px;text-align:center;line-height:30px;">重试</a>');
                startDiv.find('.demo-reload').on('click', function () {
                    uploadSingle.upload();
                });
            }
        });
    });
</script>
</body>
</html>
