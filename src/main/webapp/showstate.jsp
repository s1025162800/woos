
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <script src="jquery.min.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div align="center" style="padding-top: 5px">
    <div align="center" style="margin-left: -80px">
        房间号或名称:<input  id="room" type="text" value="${room}" id="id" style="width: 60px;margin-right: 30px" >
        房间类型:<select  id="type" style="width: 80px"  >
        <option value="0">不清楚</option>
        <c:forEach items="${type}" var="r">
        <option value="${r.type_id}">${r.type_name}</option>
        </c:forEach>
       </select>
        <label style="margin-left: 40px">房间状态:</label><select id="state1" style="width: 80px" >
           <option value="0">无</option>
           <option value="1">可用</option>
           <option value="2">不可用</option>
        </select>
        <button id="search" class="layui-btn layui-btn-xs" onclick="search()">搜索</button>
    </div>
    <table align="center" class="layui-table" lay-size="sm" style="width: 60%">
        <tr><td>
            房间号
        </td>
            <td>
                房间名
            </td>
            <td>
                房间的类型
            </td>
            <td>
                主页图片
            </td>
            <td>
                状态
            </td>
            <td>
                房间状态修改
            </td>
        </tr>
        <c:forEach items="${ipage.records}" var="s">
        <tr>
        <td style="width: 70px">${s.room_id}</td>
        <td  style="width: 100px">${s.room_name}</td>
            <td style="width: 90px">${s.type_name}</td>
        <td style="width: 60px"><img width="60px" height="60px" src="${pageContext.request.contextPath}/image/${s.img}"></td>
        <td style="width: 30px">${s.state}</td>
            <c:if test="${s.state=='可用'}">
        <td style="width: 30px"><input   style="color: white;margin-left: 70px; background-color:lightslategray;border: none;width: 60px;height: 30px" disabled="true" type="button" value="上架"><input style="background-color: #00FF00; border: none;width: 60px;height: 30px;margin-left: -130px" onclick="notuse(${s.room_id})" type="button" value="下架"></td>
        <%--<td style=""><input style="background-color: #00FF00; border: none;width: 60px;height: 30px;margin-left: -100px" onclick="notuse(${s.room_id})" type="button" value="下架"></td>--%>
            </c:if>
            <c:if test="${s.state=='不可用'}">
                <td style="width: 30px"><input style="margin-left: 70px;background-color: #4eee19; border: none;width: 60px;height: 30px" type="button" onclick="canuse(${s.room_id})" value="上架"><input style=" color:white;background-color:lightslategray; border: none;width: 60px;height: 30px;margin-left: -130px" type="button" disabled="disabled" value="下架"></td>
                <%--<td style="margin-left: 60px"><input style="background-color: red; border: none;width: 60px;height: 30px;margin-left: -100px" type="button" disabled="disabled"  value="下架"></td>--%>
            </c:if>
        </c:forEach>
        </tr>
    </table><div style="text-align:center">
    <button class="layui-btn layui-btn-xs" onclick="go(1)">首  页</button>
    <c:if test="${ipage.current>1}" >
        <button class="layui-btn layui-btn-xs"onclick="go(${ipage.current-1})" >上一页</button>
    </c:if>
    <c:if test="${ipage.current<count}">
        <button class="layui-btn layui-btn-xs" onclick="go(${ipage.current+1})">下一页</button>
    </c:if>
    <button class="layui-btn layui-btn-xs" onclick="go(${count})">末  页</button>
</div>
</div>
<script >
    $(function () {
        $("#type").val(${types});
        $("#state1").val(${state1});
        $("#room").val(${room});
    })
    function go(page) {
        var room=$("#room").val();
        var state1=$("#state1").val();
        var types=$("#type").val();
        alert(types+state1+room);
      window.location="showit?page="+page+"&types="+types+"&room="+room+"&state1="+state1+"";

    }
    function search() {
        var page=1;
        var room=$("#room").val();
        var state1=$("#state1").val();
        var types=$("#type").val();
        alert(types+state1+room);
        window.location="showit?page="+page+"&types="+types+"&room="+room+"&state1="+state1+"";
    }
    function canuse(room_id) {
            var state='可用';
            var room=$("#room").val();
            var state1=$("#state1").val();
            var types=$("#type").val();
            // alert(room_id+state);
            var message=confirm("确定要上架么？")
            if (message==true) {
                window.location= "showit?room_id="+room_id+"&state="+state+"&types="+types+"&room="+room+"&state1="+state1+"&page=${page}";
            }else{

            }}
        function notuse(room_id) {
            var state='不可用';
            var room=$("#room").val();
            var state1=$("#state1").val();
            var types=$("#type").val();
            // alert(room_id+state);
            var message=confirm("确定要下架么？")
            if (message==true) {
                window.location="showit?room_id="+room_id+"&state="+state+"&types="+types+"&room="+room+"&state1="+state1+"&page=${page}";
            }else{

            }
    }
</script>
</body>
</html>
