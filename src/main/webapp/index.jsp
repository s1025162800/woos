<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>酒店管理系统</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/echarts.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">XXX酒店后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">个人中心</a></dd>
                    <dd><a href="">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">会议室设置</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${pageContext.request.contextPath}/upload1" target="main">新增会议室</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/showit" target="main">修改状态</a></dd>
                        <dd><a href="javascript:;" target="main">预订情况</a></dd>
                        <dd><a href="javascript:;" target="main">已预订详情</a></dd>
                        <dd><a href="javascript:;" target="main">添加设备</a></dd>
                        <dd><a href="javascript:;" target="main">修改图片</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">订单操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" target="main">酒店预订</a></dd>
                        <dd><a href="javascript:;" target="main">查询订单</a></dd>
                        <dd><a href="javascript:;" target="main">取消订单</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="data.jsp" target="main">数据报表</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe width="100%" height="1270px" name="main" frameborder="0" >
        </iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
</body>
</html>
