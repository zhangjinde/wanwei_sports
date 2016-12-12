<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="com.park.layout.Blocks" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>
<%@ taglib uri="http://www.wanwei.com/tags/tag" prefix="layout" %>

<layout:override name="<%=Blocks.BLOCK_HEADER_CSS%>">
    <link href="/Content/style/reservations/reservations_orders.css?v=${static_resource_version}" rel="stylesheet" type="text/css">
</layout:override>

<layout:override name="<%=Blocks.BLOCK_HEADER_SCRIPTS%>">
    <script src="/Content/app/reservations/reservations_orders.js?v=${static_resource_version}"></script>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_NAV_PATH%>">
    当前位置: <span>预订管理</span> &gt;&gt; <span>预订订单</span>
</layout:override>

<layout:override name="<%=Blocks.BLOCK_BODY%>">
    <div class="container-fluid" style="text-align: left">
        <div class="panel panel-default">
            <div class="panel-heading">预订订单查询</div>
            <div class="panel-body">
                <form id="orders_filter_form" class="form-inline" onsubmit="return false;">
                    <div class="form-group">
                        <select class="form-control" name="payStatus" style="width:160px;">
                            <option value="">全部订单</option>
                            <option value="2" <c:if test='${payStatus==2}'>selected</c:if>>未支付</option>
                            <option value="1" <c:if test='${payStatus==1}'>selected</c:if>>已支付</option>
                            <!-- <option value="10">已完成</option> -->
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="订单号" name="orderNo" value="${orderNo}">
                    </div>
                    <div class="form-group">
                        <a href="javascript:;" class="btn btn-primary orders-filter">
                            <span class="glyphicon glyphicon-search"></span> 筛选 & 显示
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel-group" role="tablist">
            <c:forEach var="order" items="${list}" varStatus="loop">
            <div class="panel panel-default">
                <div class="panel-heading" id="order_header_${loop.index}">
                    <h5 class="panel-title" style="font-size: 14px;">
                        <a data-toggle="collapse" href="#order_body_${loop.index}" aria-expanded="true"
                           aria-controls="#order_body_${loop.index}">
                            订单号：<span class="text-primary">${order.orderNo}</span>
                        </a>

                        <div class="pull-right">
                            <small class="text-muted">${order.createTime} </small>
                        <c:if test="${order.orderStatus == 1}">
                            <span class="text-success">已完成</span>
                        </c:if>
                        <c:if test="${order.orderStatus == 2}">
                            <c:if test="${order.payStatus == 1}">
                                <span class="text-success">已支付</span>
                            </c:if>
                            <c:if test="${order.payStatus == 2}">
                                <span class="text-danger">未支付</span>
                            </c:if>
                            <c:if test="${order.payStatus == 3}">
                                <span class="text-danger">部分支付</span>
                            </c:if>
                        </c:if>
                        <c:if test="${order.orderStatus == 3}">
                            <span class="text-muted">已取消</span>
                        </c:if>
                        </div>
                    </h5>
                </div>
                <div id="#order_body_${loop.index}" class="panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="order_header_${loop.index}" aria-expanded="true">
                    <div class="table-responsive">
                        <table class="table orders-list">
                            <thead>
                            <tr>
                                <th>预订项</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>预订状态</th>
                            </tr>
                            </thead>
                            <c:forEach var="item" items="${order.orderDetailList}">
                            <tr>
                                <td>${item.itemName}</td>
                                <td>${item.itemStartTime}</td>
                                <td>${item.itemEndTime}</td>
                                <c:if test="${item.orderDetailStatus == 1}">
                                    <td>已完成</td>
                                </c:if>
                                <c:if test="${item.orderDetailStatus == 2}">
                                    <td class="text-danger">未完成</td>
                                </c:if>
                                <c:if test="${item.orderDetailStatus == 3}">
                                    <td class="text-success">进行中</td>
                                </c:if>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="panel-footer">
                        合计金额: <strong class="text-danger">${order.orderSumPrice}</strong> 元
                        <div class="pull-right">
                            <c:if test="${order.orderStatus == 1}">
                                <button class="btn btn-warning btn-sm order-delete" data-id="${order.orderId}">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </button>
                            </c:if>
                            <c:if test="${order.orderStatus == 2}">
                                <c:if test="${order.payStatus == 1}">
                                    <button class="btn btn-danger btn-sm order-cancel" data-id="${order.orderId}" style="display: none;">
                                        <span class="glyphicon glyphicon-remove"></span> 取消
                                    </button>
                                </c:if>
                                <c:if test="${order.payStatus == 2}">
                                    <button class="btn btn-primary btn-sm order-pay" data-id="${order.orderId}">
                                        <span class="glyphicon glyphicon-usd"></span> 支付
                                    </button>
                                    <button class="btn btn-danger btn-sm order-cancel" data-id="${order.orderId}">
                                        <span class="glyphicon glyphicon-remove"></span> 取消
                                    </button>
                                </c:if>
                            </c:if>
                            <c:if test="${order.orderStatus == 3}">
                                <button class="btn btn-warning order-delete" data-id="${order.orderId}">
                                    <span class="glyphicon glyphicon-trash"></span> 删除
                                </button>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            <nav class="pull-right" <c:if test="${count <= pageSize}">style="display: none;"</c:if> >
                <p class="pull-left" style="margin: 12px 14px;">
                    <span>${pageSize}条/页</span>
                    <span>总${count}条</span>
                </p>
                <ul class="pagination pull-right">
                    <c:if test="${currentPage == 1}">
                        <li class="disabled">
                            <a href="javascript:;" data-index="1">
                                <span>首页</span>
                            </a>
                        </li>
                        <li class="disabled">
                            <a href="javascript:;" data-index="1">
                                <span>上一页</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${currentPage != 1}">
                        <li>
                            <a class="page-first" href="javascript:;" data-index="1">
                                <span>首页</span>
                            </a>
                        </li>
                        <li>
                            <a class="page-prev" href="javascript:;" data-index="${currentPage - 1}">
                                <span>上一页</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${lastPage}">
                        <c:if test="${i == currentPage}">
                            <li class="active"><a href="javascript:;" data-index="${i}">${i}</a></li>
                        </c:if>
                        <c:if test="${i != currentPage}">
                            <li><a class="page-index" href="javascript:;" data-index="${i}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${currentPage == lastPage}">
                        <li class="disabled">
                            <a href="javascript:;" data-index="1">
                                <span>下一页</span>
                            </a>
                        </li>
                        <li class="disabled">
                            <a href="javascript:;" data-index="1">
                                <span>末页</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${currentPage != lastPage}">
                        <li>
                            <a class="page-next" href="javascript:;" data-index="${currentPage + 1}">
                                <span>下一页</span>
                            </a>
                        </li>
                        <li>
                            <a class="page-last" href="javascript:;" data-index="${lastPage}">
                                <span>末页</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>

    <div class="modal fade" id="zhifuModal" tabindex="-1" role="dialog" aria-labelledby="zhifuModalLabel">
        <div class="modal-dialog" style="width: 640px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="zhifuModalLabel">订单支付</h5>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form id="reservations_paid_form" class="form-horizontal" novalidate onsubmit="return false;">
                                <input type="hidden" id="reservations_paid_order" name="orderId">
                                <input type="hidden" id="reservations_paid_subAmount" name="subAmount" value="0">
                                <input type="hidden" id="reservations_paid_additionalPrice" name="additionalPrice" value="0">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="reservations_paid_orderSumCount" class="col-sm-6 control-label">
                                            <span class="text-danger">*</span> 总场次(时)
                                        </label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="reservations_paid_orderSumCount"
                                                   name="orderSumCount" autocomplete="off" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="reservations_paid_orderSumPrice" class="col-sm-6 control-label">
                                            <span class="text-danger">*</span> 总金额(元)
                                        </label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="reservations_paid_orderSumPrice"
                                                   name="orderSumPrice" placeholder="总金额(元)" autocomplete="off"
                                                   data-val="true" data-val-required="总金额不能为空"
                                                   data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                   data-val-regex="总金额格式错误">
                                            <div data-valmsg-for="orderSumPrice" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="reservations_paid_payCount" class="col-sm-6 control-label">
                                            <span class="text-danger">*</span> 支付场次(时)
                                        </label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="reservations_paid_payCount" name="payCount"
                                                   placeholder="支付场次" autocomplete="off"
                                                   data-val="true" data-val-required="支付场次不能为空"
                                                   data-val-regex-pattern="^[1-9]\d*$"
                                                   data-val-regex="支付场次格式错误">
                                            <div data-valmsg-for="payCount" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="reservations_paid_paySumPrice" class="col-sm-6 control-label">
                                            <span class="text-danger">*</span> 支付金额(元)
                                        </label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="reservations_paid_paySumPrice" name="paySumPrice"
                                                   placeholder="支付金额(元)" autocomplete="off"
                                                   data-val="true" data-val-required="支付金额不能为空"
                                                   data-val-regex-pattern="^[+-]?(0(\.[0-9]{1,2})?|[1-9][0-9]*(\.[0-9]{1,2})?)$"
                                                   data-val-regex="支付金额格式错误">
                                            <div data-valmsg-for="paySumPrice" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <label for="reservations_money_type" class="col-sm-3 control-label">
                                            <span class="text-danger">*</span> 支付方式
                                        </label>

                                        <div class="col-sm-9">
                                            <select class="form-control" id="reservations_money_type" name="payType"
                                                    data-val="true" data-val-required="请选择支付方式">
                                                <option value="">请选择</option>
                                                <option value="1">现金</option>
                                                <option value="2">支付宝</option>
                                                <option value="3">微信</option>
                                            </select>
                                            <div data-valmsg-for="payType" data-valmsg-replace="true"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="reservations_paid_remark" class="col-sm-3 control-label">备注</label>

                                        <div class="col-sm-9">
                                    <textarea class="form-control" rows="3" id="reservations_paid_remark"
                                              name="orderRemark" placeholder="备注"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="reservations_paid_balance" class="col-sm-3 control-label">
                                            <span class="text-danger">*</span> 余额(元)
                                        </label>

                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" id="reservations_paid_balance"
                                                   name="balance" autocomplete="off" value="0.00" disabled>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="reservations_paid_money" class="col-sm-3 control-label">
                                            <span class="text-danger">*</span> 实收金额(元)
                                        </label>

                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" id="reservations_paid_money" name="paySumPrice"
                                                   placeholder="实收金额(元)" autocomplete="off" value="0.00" disabled>
                                        </div>
                                        <div class="col-sm-3">
                                            <button class="btn btn-primary" id="reservations_paid_confirm">
                                                <span class="glyphicon glyphicon-ok"></span> 确 定
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</layout:override>

<c:import url="../Shared/Layout_New.jsp">
    <c:param name="nav" value="site"/>
    <c:param name="subNav" value="order"/>
</c:import>