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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">

    <title>${param.title == null || param.title eq "" ? "万维体育 wanwei.com - 智能场馆管理系统" : param.title}</title>

    <meta name="keywords" content="${param.keyword == null || param.keyword eq "" ? "万维体育, 智能体育场馆, 体育场馆, 预订, 收银, 万维, wanwei.com" : param.keyword}"/>
    <meta name="description" content="${param.desc == null || param.desc eq "" ? "万维体育 wanwei.com - 提供智能化的体育场馆运营服务。" : param.desc}"/>
    <meta name="author" content="北体高科技术有限公司" />

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link href="Content/favicon.ico?v=${static_resource_version}" rel="shortcut icon" type="image/x-icon">

    <link href="Content/lib/bootstrap/bootstrap.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/font-awesome/font-awesome.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/animate/animate.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">

    <!-- Morris -->
    <link href="Content/style/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

    <link href="Content/lib/animate/animate.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/lib/style.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="Content/style/home/index.css?v=${static_resource_version}" rel="stylesheet" type="text/css">

    <layout:block name="<%=Blocks.BLOCK_HEADER_CSS%>"/>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <layout:block name="<%=Blocks.BLOCK_BODY%>"/>
    </div>

    <div class="modal fade" id="tips_failure_modal" tabindex="-1" role="dialog" aria-labelledby="tips_failure_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_failure_modal_label">警告提示</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger tips-content" role="alert"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 我知道了
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_success_modal" tabindex="-1" role="dialog" aria-labelledby="tips_success_modal_label">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_success_modal_label">成功提示</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-success tips-content" role="alert"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 我知道了
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="tips_confirm_modal" tabindex="-1" role="dialog" aria-labelledby="tips_confirm_modal_label" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="tips_confirm_modal_label">确认提示</h5>
                </div>
                <div class="modal-body">
                    <div class="alert alert-warning tips-content" role="alert"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                        <span class="glyphicon glyphicon-ok"></span> 确 定
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="Content/lib/jquery/jquery-1.12.3.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/bootstrap/bootstrap.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/pluginsContent.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/moment/moment.min.js?v=${static_resource_version}"></script>
    <script src="Content/lib/jquery/jquery.cookie/jquery.cookie-1.4.1.min.js?v=${static_resource_version}"></script>
    <script src="Content/app/common/text_magnifier.js?v=${static_resource_version}"></script>
    <script src="Content/app/common/base_new.js?v=${static_resource_version}"></script>

    <layout:block name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>"/>
    <layout:block name="<%=Blocks.BLOCK_TRACE_SCRIPTS%>"/>

    <div class="gohome">
        <a class="animated bounceInUp" href="/" title="工作面板">
            <i class="fa fa-home"></i>
        </a>
    </div>

</body>
</html>
