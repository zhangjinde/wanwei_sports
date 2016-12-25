<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/business/data/data_income.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/echarts/echarts.min.js?v=${static_resource_version}"></script>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('data_echarts1'));

        var data = [{
            value: 3660,
            name: '场地预订'
        }, {
            value: 1243,
            name: '商品销售'
        }, {
            value: 9930,
            name: '会员储值'
        }];
        var option = {
            backgroundColor: "#faf6f3",
            title: {
                text: '营业收入',
                subtext: '',
                x: 'center',
                y: 'center',
                textStyle: {
                    fontWeight: 'normal',
                    fontSize: 16
                }
            },
            tooltip: {
                show: false,
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            legend: {
                show: true,
                orient: 'horizontal',
                top: '0%',
                data: ['场地预订', '商品销售', '会员储值']
            },
            series: [{
                type: 'pie',
                radius: ['25%', '60%'],
                color: ['#59ADF3', '#AF89D6', '#EC7D31'],
                label: {
                    normal: {
                        position: 'inner',
                        formatter: '{d}%',

                        textStyle: {
                            color: '#fff',
                            fontWeight: 'bold',
                            fontSize: 16
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: data
            }, {
                type: 'pie',
                radius: ['60%', '90%'],
                itemStyle: {
                    normal: {
                        color: '#EEEEEE'
                    },
                    emphasis: {
                        color: '#ADADAD'
                    }
                },
                label: {
                    normal: {
                        position: 'inner',
                        formatter: '{c}元',
                        textStyle: {
                            color: '#333333',
                            fontWeight: 'bold',
                            fontSize: 16
                        }
                    }
                },
                data: data
            }]
        };

        myChart.setOption(option);
    </script>

    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart2 = echarts.init(document.getElementById('data_echarts2'));

        var data2 = [{
            value: 3966,
            name: '现金'
        }, {
            value: 1966,
            name: '支付宝'
        }, {
            value: 966,
            name: '微信'
        }, {
            value: 4966,
            name: '银联'
        }, {
            value: 2966,
            name: '支票'
        }];
        var option2 = {
            backgroundColor: "#faf6f3",
            title: {
                text: '营业收入',
                subtext: '',
                x: 'center',
                y: 'center',
                textStyle: {
                    fontWeight: 'normal',
                    fontSize: 16
                }
            },
            tooltip: {
                show: false,
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            legend: {
                show: true,
                orient: 'horizontal',
                top: '0%',
                data: ['现金', '支付宝', '微信', '银联', '支票']
            },
            series: [{
                type: 'pie',
                radius: ['25%', '60%'],
                color: ['#86D560', '#AF89D6', '#59ADF3', '#FF999A', '#EC7D31'],
                label: {
                    normal: {
                        position: 'inner',
                        formatter: '{d}%',

                        textStyle: {
                            color: '#fff',
                            fontWeight: 'bold',
                            fontSize: 16
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: data2
            }, {
                type: 'pie',
                radius: ['60%', '90%'],
                itemStyle: {
                    normal: {
                        color: '#EEEEEE'
                    },
                    emphasis: {
                        color: '#ADADAD'
                    }
                },
                label: {
                    normal: {
                        position: 'inner',
                        formatter: '{c}元',
                        textStyle: {
                            color: '#333333',
                            fontWeight: 'bold',
                            fontSize: 16
                        }
                    }
                },
                data: data2
            }]
        };

        myChart2.setOption(option2);
    </script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div id="main" class="container">
        <div class="weui-form-preview">
            <div class="weui-form-preview__bd">
                <table>
                    <thead>
                    <tr>
                        <th>场地预订</th>
                        <th>会员储值</th>
                        <th>商品销售</th>
                        <th>总收入</th>
                        <th>财务核对</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>￥3660元</td>
                        <td>￥9930元</td>
                        <td>￥1243元</td>
                        <td>￥14833元</td>
                        <td>￥14833元</td>
                    </tr>
                    </tbody>
                </table>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div id="data_echarts1" style="width: 100%;height:360px;"></div>
                    </div>
                </div>
                <table>
                    <thead>
                    <tr>
                        <th>现金</th>
                        <th>支付宝</th>
                        <th>微信</th>
                        <th>银联</th>
                        <th>支票</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>￥3966元</td>
                        <td>￥1966元</td>
                        <td>￥966元</td>
                        <td>￥4966元</td>
                        <td>￥2966元</td>
                    </tr>
                    </tbody>
                </table>
                <div class="weui-flex">
                    <div class="weui-flex__item">
                        <div id="data_echarts2" style="width: 100%;height:360px;"></div>
                    </div>
                </div>
            </div>
            <div class="weui-form-preview__ft">
                <a class="weui-form-preview__btn weui-form-preview__btn_default" href="javascript:">今日营业数据</a>
                <a class="weui-form-preview__btn weui-form-preview__btn_primary" href="/business/data/incomeCompare">历史数据对比</a>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="title" value="场地收支"/>
</c:import>
