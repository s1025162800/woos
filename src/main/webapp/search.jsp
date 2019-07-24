<%--
  Created by IntelliJ IDEA.
  User: lgh-pc
  Date: 2019/5/18
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

</head>
<body>

    <%@include file="head.jsp"%>

    <form id="f">
     姓名:<input type="text" name="sname" class="input-text" style="width: 200px"> <br>
     性别:<input type="radio" name="xb" value="1">男
          <input type="radio" name="xb" value="0">女 <br>
          <input type="hidden" name="page" id="page">
     学历:<select name="xl">
             <option value="">不限</option>
             <option value="大学">大学</option>
             <option value="中学">中学</option>
             <option value="小学">小学</option>
         </select>
     <br>
     出生:<input type="text" name="minCS" class="input-text" style="width: 200px">-
          <input type="text" name="maxCS" class="input-text" style="width: 200px"> <br>

    <button style="width: 80px;height: 30px"  class="btn btn-success" onclick="search()" type="button">搜索</button>
    </form>

     <div id="search_body">

     </div>
</body>
</html>





<script>
    function  search() {
        var data= $("#f").serialize();
        var url = "${pageContext.request.contextPath}/search?"+data;
        $("#search_body").load(url);
    }
    
</script>










