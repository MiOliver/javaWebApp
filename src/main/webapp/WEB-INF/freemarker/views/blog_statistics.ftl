<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
<#--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">-->
<head>
    <title>Twitter Bootstrap Tutorial </title>
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
        body {
            background-color: #CCC;
        }
    </style>
    <!-- ECharts单文件引入 -->
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        <#--console.log(${idList});-->
        <#--console.log(${countList});-->

        // 使用
        require(
                [
                    'echarts',
                    'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart = ec.init(document.getElementById('main'));

                    var option = {
                        tooltip: {
                            show: true
                        },
                        legend: {
                            data:['访问量']
                        },
                        xAxis : [
                            {
                                type : 'category',
                                data : ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
                                <#--data : ${idList}-->
                            }
                        ],
                        yAxis : [
                            {
                                type : 'value'
                            }
                        ],
                        series : [
                            {
                                "name":"访问量",
                                "type":"bar",
                                "data":[5, 20, 40, 10, 10, 20]
                                <#--"data":${countList}-->
                            }
                        ]
                    };

                    // 为echarts对象加载数据
                    myChart.setOption(option);
                }
        );
    </script>
</head>
<body>
<div class="container">
    <h1>享受技术和生活中的快乐</h1>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header" >
                <a class="navbar-brand" href="#">
                    <img alt="Brand" src="/resources/img/Dolphin.png" width="25" height="25">
                </a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">Link</a></li>
                <li><a href="#">About</a></li>
            </ul>
        </div>

    </nav>

    <div class="row" style="background-color: white;border-radius:5px;line-height: 30px;padding: 20px;  ">
        <div class=".col-xs-6 col-md-12">
            <h3>博客阅读统计</h3><hr>
            <div id="main" style="height: 400px" >
            </div>

        </div>
    </div>
</div>
</body>
</html>