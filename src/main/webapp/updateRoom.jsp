<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房间设置</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/updateRoom.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery.min.js"></script>
</head>
<body style="overflow: hidden">
<div id="roomset">房间设置</div>
<div id="room1">
    <ul>
        <li style="margin-top: 10px;">房间号或名称:<input type="text" name="" id="room" value="${room}" /></li>
        <li style="margin-top: 10px;width: 180px;">房间类型：
            <select id="type" style="width: 80px;">
                <option value="">不清楚</option>
                <c:forEach items="${map.listType}" var="t">
                    <option value="${t.type_id}">${t.type_name}</option>
                </c:forEach>
            </select>
        </li>
        <li><button id="ss" type="button" class="layui-btn layui-btn-normal" style="height: 38px;">搜索</button></li>
    </ul>
</div>
<div id="room2" style="width: 1000px;height: 500px;">
    <ul id="room2_ul1">
        <li>房间号</li>
        <li>房间名</li>
        <li>图片</li>
        <li>操作</li>
    </ul>
    <c:forEach items="${ipage.records}" var="r">
    <ul id="room2_ul2" style="margin-top: 50px;">
        <li style="height: 60px;padding-top: 40px;">${r.room_id}</li>
        <li style="height: 60px;padding-top: 40px;">${r.room_name}</li>
        <li><img src="${r.img}" style="height: 100px;width: 180px;"></li>
        <li style="height: 60px;padding-top: 40px;"><a href="findRoomById?room_id=${r.room_id}">修改</a></li>
    </ul>
    </c:forEach>
</div>
<div id="room3" style="width: 600px;height: 20px;margin-left: 200px;font-size: 15px;">
    <ul style="display: flex;flex-direction: row;">
        <li style="width: 50px;text-align: center"><a href="search?page=1&room=${room}&type=${type}">首页</a></li>
        <c:if test="${ipage.current>1}">
            <li><a href="search?page=${ipage.current-1}&room=${room}&type=${type}">上一页</a></li>
        </c:if>

        <c:set var="left" value="${ipage.current-2<1? 1:ipage.current-2}"></c:set>
        <c:set var="right" value="${left+3>count ? count:left+3}"></c:set>

        <c:forEach begin="${left}" end="${right}" var="p">
            <li style="width: 50px;text-align: center;"><a href="search?page=${p}&room=${room}&type=${type}">${p}</a></li>
        </c:forEach>

        <c:if test="${ipage.current<count}">
            <li><a href="search?page=${ipage.current+1}&room=${room}&type=${type}">下一页</a></li>
        </c:if>

        <li style="width: 50px;text-align: center"><a href="search?page=${count}&room=${room}&type=${type}">尾页</a></li>
        <li style="width: 35px;"><input type="text" id="page" value="${ipage.current }" style="width:30px;"></li>
        <li><input type="button" value="跳转" onclick="go()" style="height:20px;border:none;font-size:12px;background:rgb(228, 57, 60);color:white;"></li>
    </ul>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#type").val(${type});
    })

    $("#ss").click(function () {
        var room = $("#room").val();
        var type = $("#type").val();
        window.location = "search?room="+room+"&type="+type;
    })

    function go() {
        var page = $("#page").val();
        if(page<=0){
            page = 1;
        }
        if(page>${count}){
            page = ${count};
        }
        window.location = "search?page="+page+"&room=${room}&type=${type}";
    }
</script>
</html>
