<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="js/echarts.min.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>

<div style="padding: 15px;">
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
</div>

</body>
<script src="layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '近一个月会议室预订情况'
        },
        tooltip: {},
        legend: {
            data:['次数']
        },
        xAxis: {
            data: ["大型会议室","中型会议室","小型会议室","宴会","酒会","新闻发布会"]
        },
        yAxis: {},
        series: [{
            name: '次数',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</html>
