<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.min.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/lib/jquery/jquery-steps/jquery.steps.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
    <link href="/Content/style/reservations/reservations_sequence.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/lib/jquery/jquery-datetimepicker/jquery.datetimepicker.full.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/jquery/jquery-steps/jquery.steps.min.js?v=${static_resource_version}"></script>
    <script src="/Content/lib/moment/moment.min.js?v=${static_resource_version}"></script>
    <script src="/Content/app/reservations/reservations_sequence.js?v=${static_resource_version}"></script>
</layout:override>
<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div style="display: none">
        <input type="hidden" value="${curDate}" id="current_date">
        <input type="hidden" value="${curSportId}" id="current_sport">
    </div>
    <div class="ww-wrapper">
        <div class="wrapper">
            <ol class="breadcrumb">
                <li><a href="/">工作平台</a></li>
                <li class="active">现场预订</li>
            </ol>
            <div class="panel panel-default sequence-filter">
                <div class="panel-body">
                    <div class="col-sm-12">
                        <div class="btn-group btn-group-justified">
                            <div class="btn-group">
                                <button type="button" class="btn btn-warning">羽毛球</button>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary">篮球</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse">
                                <ul class="nav navbar-nav sequence-date">
                                    <li class="other-date-select">
                                        <a href="javascript:;" class="other-date">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                            <span class="icon-text">选择日期</span>
                                        </a>
                                        <div class="other-date-calendar"
                                             style="position: absolute; display: none; z-index: 1;">
                                            <input type="text" class="form-control" id="other_date" name="otherDate"
                                                   autocomplete="off">
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                    <form class="form-inline">
                        <div class="form-group" style="display: none;">
                            <label>场地状态</label>

                            <label class="checkbox-inline">
                                <input type="checkbox" name="venue_state" value="1" checked>
                                未付款
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="venue_state" value="2" checked>
                                已付款
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="venue_state" value="3" checked>
                                已锁定
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="venue_state" value="4" checked>
                                不可预订
                            </label>
                        </div>
                        <div class="form-group" style="display: none;">
                            <label>用户类型</label>

                            <label class="checkbox-inline">
                                <input type="checkbox" name="user_state" value="1" checked>
                                会员
                            </label>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="user_state" value="2" checked>
                                散客
                            </label>
                        </div>
                        <div class="form-group pull-right">
                            <button type="button" class="btn btn-default sequence-lock">
                                <span class="glyphicon glyphicon-lock"></span> 锁场
                            </button>
                            <button type="button" class="btn btn-primary sequence-order">
                                <span class="glyphicon glyphicon-ok"></span> 预订
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="sequence-show">
                <table class="table table-bordered venue-large" id="timing_table">
                    <tr class="timing-header">
                        <td></td>
                        <c:forEach var="site" items="${sites}">
                            <td data-id="${site.siteId}">${site.siteName}</td>
                        </c:forEach>
                    </tr>
                    <c:forEach var="time" items="${timePeriod}">
                        <tr class="timing-body" data-start="${time.startTime}" data-end="${time.endTime}">
                            <td class="time">${time.startTime} ~ ${time.endTime}</td>
                            <c:forEach var="site" items="${sites}">
                                <td class="null" data-id="${site.siteId}" data-start="${time.startTime}"
                                    data-end="${time.endTime}"></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="panel panel-default sequence-tips">
                <div class="panel-body">
                    <span class="unpaid">未付款</span>
                    <span class="ordered">已付款</span>
                    <span class="locked">已锁定</span>
                    <span class="disabled">不可预订</span>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="zhifuModal" tabindex="-1" role="dialog" aria-labelledby="zhifuModalLabel">
        <div class="modal-dialog" style="width: 800px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="zhifuModalLabel">预订支付</h4>
                </div>
                <div class="modal-body">
                    <div class="reservations-steps">
                        <h1>谁预订场地</h1>
                        <div class="reservations-steps-user">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form id="reservations_user_form" class="form-horizontal" novalidate onsubmit="return false;">
                                        <input type="hidden" id="reservations_op_type" name="opType" value="2">
                                        <div class="form-group">
                                            <label for="reservations_user_name" class="col-sm-3 control-label">姓名</label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" id="reservations_user_name"
                                                       name="name" placeholder="姓名" value="散客" autocomplete="off"
                                                       data-val="true" data-val-required="姓名不能为空">
                                                <div data-valmsg-for="name" data-valmsg-replace="true"></div>
                                            </div>
                                            <div class="col-sm-3">
                                                <a class="btn btn-primary reservations-user-search" href="javascript:void(0);">
                                                    <span class="glyphicon glyphicon-search"></span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="reservations_user_mobile" class="col-sm-3 control-label">手机号</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="reservations_user_mobile" name="mobile"
                                                       placeholder="手机号码" autocomplete="off"
                                                       data-val="true" data-val-required="手机号码不能为空"
                                                       data-val-regex-pattern="^1\d{10}$"
                                                       data-val-regex="手机号码格式错误">
                                                <div data-valmsg-for="mobile" data-valmsg-replace="true"></div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="pay_goods_amount" class="col-sm-3 control-label">预计(元)</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="pay_goods_amount" name="amount"
                                                       placeholder="预计价格" value="" autocomplete="off" readonly>
                                            </div>
                                        </div>
                                        <p class="sc-submit-tips"></p>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <button class="btn btn-primary pull-right reservations-pay" data-val="1">
                                                    <span class="glyphicon glyphicon-arrow-right"></span> 去支付
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <h1>预订支付</h1>
                        <div class="reservations-steps-pay">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <form id="reservations_paid_form" class="form-horizontal" novalidate onsubmit="return false;">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_order_no" class="col-sm-2 control-label">订单号</label>

                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="reservations_order_no"
                                                           name="orderno" placeholder="订单号" value="" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="reservations_ex_money" class="col-sm-4 control-label">附加费用(元)</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_ex_money" name="addcharges"
                                                           placeholder="附加费用" value="" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reservations_money_type" class="col-sm-4 control-label">付款方式</label>

                                                <div class="col-sm-8">
                                                    <select class="form-control" id="reservations_money_type" name="paymentmethod">
                                                        <option value="0">现金</option>
                                                        <option value="1">微信</option>
                                                        <option value="2">支付宝</option>
                                                        <option value="3">支票</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="reservations_se_money" class="col-sm-4 control-label">优惠金额(元)</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_se_money" name="preamount"
                                                           placeholder="优惠金额" value="" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="reservations_money_no" class="col-sm-4 control-label">支票号</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_money_no" name="checknumber"
                                                           placeholder="支票号" value="" autocomplete="off">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_pay_remark" class="col-sm-2 control-label">备注</label>

                                                <div class="col-sm-10">
                                                        <textarea class="form-control" rows="3" id="reservations_pay_remark"
                                                                  name="remarks" placeholder="备注" autocomplete="off"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="reservations_real_money" class="col-sm-2 control-label">实收金额(元)</label>

                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="reservations_real_money" name="paidamount"
                                                           placeholder="实收金额" value="" readonly>
                                                </div>
                                                <div class="col-sm-2">
                                                    <button class="btn btn-primary reservations-pay-confirm">
                                                        <span class="glyphicon glyphicon-ok"></span> 确定
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <p class="sc-submit-tips"></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade tips-modal" tabindex="-1" role="dialog" aria-labelledby="tipsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="alert alert-info text-message" role="alert">您确定要锁定这些场地?</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="sequence"/>
</c:import>
