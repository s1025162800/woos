<%--
  Created by IntelliJ IDEA.
  User: lgh-pc
  Date: 2019/5/18
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="0" align="center" width="80%"  class="table table-border table-bordered table-bg" >
         <thead>
            <tr class="text-c">
                <th>姓名</th>
                <th>性别</th>
                <th>出生</th>
                <th>操作</th>
            </tr>
         </thead>

        <tbody id="t">
            <c:forEach items="${ipage.records}" var="s">
                <tr align="center" class="text-c">
                      <td>${s.sname}</td>
                      <td>${s.xb}</td>
                      <td>${s.cs}</td>
                      <td></td>
                </tr>
            </c:forEach>

            <tr align="center" class="text-c">
                <td colspan="4">
                    当前${ipage.current}/${count}页共${ipage.total}条

                    <button onclick="go(1)">首页</button>

                    <c:if test="${ipage.current>1}">
                    <button onclick="go(${ipage.current-1})">上一页</button>
                    </c:if>

                       <c:set var="left" value="${ipage.current-5<1 ? 1 : ipage.current-5}"></c:set>
                       <c:set var="right" value="${left+9>count ? count :left+9}"></c:set>
                       <c:forEach begin="${left}" end="${right}" var="x">
                           <button onclick="go(${x})" style='color: ${x==ipage.current ? "red":""}'>${x}</button>
                       </c:forEach>


                    <c:if test="${ipage.current<count}">
                        <button onclick="go(${ipage.current+1})">下一页</button>
                    </c:if>
                    <button onclick="go(${count})">尾页</button>

                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>

<script>
    function  go(page) {
       $("#page").val(page);
        search();
    }
</script>
