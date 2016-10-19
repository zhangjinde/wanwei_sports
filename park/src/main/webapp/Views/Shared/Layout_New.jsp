<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="layout" uri="http://www.wanwei.com/tags/tag"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <base href="<%= basePath %>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${param.title == null || param.title eq "" ? "万维体育 wanwei.com - 智能场馆管理系统" : param.title}</title>

    <meta name="keywords" content="${param.keyword == null || param.keyword eq "" ? "万维体育, 智能体育场馆, 体育场馆, 预订, 收银, 万维, wanwei.com" : param.keyword}"/>
    <meta name="description" content="${param.desc == null || param.desc eq "" ? "万维体育 wanwei.com - 提供智能化的体育场馆运营服务。" : param.desc}"/>
    <meta name="author" content="北体高科技术有限公司" />

    <meta name="renderer" content="webkit|ie-comp|ie-stand">

    <link href="/Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon" />
    <link href="/Content/lib/bootstrap/bootstrap.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/base_new.css?v=${static_resource_version}" rel="stylesheet" type="text/css">

    <layout:block name="<%=Blocks.BLOCK_HEADER_CSS%>"/>

    <script src="/Content/lib/html5shiv/html5.min.js?v=${static_resource_version}"></script>
</head>
<body>
    <%@ include file="../Shared/Top_New.jsp"%>

    <div class="container-wrapper">
        <table class="wrapper">
            <tr>
                <td class="wrapper-td">
                    <table style="table-layout: fixed; width: 100%; height: 100%; border: 0;">
                        <tr>
                            <td nowrap style="width: 162px; vertical-align: top; text-align: center;">
                                <%@ include file="../Shared/Left_New.jsp"%>
                            </td>
                            <td style="width: 2px; background: #004C7E; vertical-align: middle;">&nbsp;</td>
                            <!--<td style="width: 2px;">&nbsp;</td>-->
                            <td style="text-align: center; vertical-align: top;">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <table style="margin-top: 0; width: 100%; height: 100%;">
                                                <tr>
                                                    <td style="vertical-align: top;">
                                                        <table style="background: url('/Content/images/new/right_table_bg.jpg?v=${static_resource_version}') repeat-x; height:26px; border-bottom:1px solid #5BA8DE; width: 100%;">
                                                            <tr>
                                                                <td style="text-align: left; color: #004C7E; padding-left: 12px;">当前位置:&nbsp;<span>会员管理</span>&nbsp;&gt;&gt;&nbsp;<span>新会员办理</span></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><layout:block name="<%=Blocks.BLOCK_BODY%>"/></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <script src="/Content/lib/jquery/jquery-1.12.3.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/bootstrap/bootstrap.min.js?v=${static_resource_version}"></script>
    <script src="/Content/app/common/base_new.js?v=${static_resource_version}"></script>

    <layout:block name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>"/>
    <layout:block name="<%=Blocks.BLOCK_TRACE_SCRIPTS%>"/>
</body>
</html>