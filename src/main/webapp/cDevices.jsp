<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/24 0024
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="jquery.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div align="center">
    <div>
    设备编号或名称:<input style="width: 90px" class="layui-form" type="text" id="device" value="${device}">
        设备状态:<select id="state1">
        <option value="0">无</option>
        <option value="1">可用</option>
        <option value="2">不可用</option>
    </select>
        <input class="layui-btn layui-btn-xs"  type="button" onclick="search()" value="搜索">
    </div>
    <table style="width: 50%" class="layui-table">
        <tr>
            <td>设备编号</td>
            <td>设备名称</td>
            <td>设备状态</td>
            <td>状态更改</td>
        </tr>
        <c:forEach items="${ipage.records}" var="d">
        <tr>
            <td id="device_id">${d.device_id}</td>
            <td>${d.device_name}</td>
            <td>${d.state}</td>
            <c:if test="${d.state=='可用'}">
            <td><button  disabled>上架</button><button onclick="changes(${d.device_id})" style="margin-left: 20px">下架</button></td>
            </c:if>
            <c:if test="${d.state=='不可用'}">
                <td><button onclick="changes1(${d.device_id})">上架</button><button disabled style="margin-left: 20px">下架</button></td>
            </c:if>
        </tr>
        </c:forEach>
    </table >
    <div>
        <button class="layui-btn layui-btn-xs"   onclick="go(1)">首页</button>
        <c:if test="${ipage.current>1}">
        <button class="layui-btn layui-btn-xs"  onclick="go(${ipage.current-1})" >上一页</button>
        </c:if>
        <c:if test="${ipage.current<count}">
        <button class="layui-btn layui-btn-xs"   onclick="go(${ipage.current+1})">下一页</button>
        </c:if>
        <button class="layui-btn layui-btn-xs"   onclick="go(${count})">末页</button>
    </div>
</div>
<script>
    $(function () {
        $("#state1").val(${state1});
    })
    function go(page) {
    window.location="cdevices?page="+page+"";
    }
    function changes(device_id) {
        var state="不可用";
        var message=confirm("确定要酱紫么？")
        if (message==true) {
            window.location="cdevices?page=${page}&state="+state+"&device_id="+device_id+"";
        }else{

        }

    }
    function changes1(device_id) {
        var state="可用";
        var message=confirm("确定要酱紫么？")
        if (message==true) {
            window.location="cdevices?page=${page}&state="+state+"&device_id="+device_id+"";
        }else{

        }
    }
    function search() {
        var page=1;
        var device=document.getElementById('device').value;
        var state1=document.getElementById('state1').value;
        alert(device+state1);
        window.location="cdevices?page="+page+"&device="+device+"&state1="+state1+"";
    }
</script>
</body>
</html>
