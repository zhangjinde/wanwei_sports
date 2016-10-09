<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- JSTL表达式（判断，循环，输出） --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- 方法表达式（字符串截取，替换） --%>

<jsp:include page="/Views/Shared/Header.jsp" />

<div class="ww-wrapper">
    <div class="wrapper">
        <ol class="breadcrumb">
            <li><a href="/">工作平台</a></li>
            <li class="active">通知设置</li>
        </ol>
        <div class="settings-filter">
            <form class="form-horizontal">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="member_mobile" class="col-sm-4 control-label">手机号码</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="member_mobile" name="member_mobile"
                                   placeholder="请输入手机号码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="card_no" class="col-sm-4 control-label">会员卡号</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="card_no" name="card_no"
                                   placeholder="请输入会员卡号">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="member_idcard" class="col-sm-4 control-label">身份证号</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="member_idcard" name="member_idcard"
                                   placeholder="请输入身份证号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="member_type" class="col-sm-4 control-label">会员类型</label>

                        <div class="col-sm-8">
                            <select class="form-control" id="member_type" name="member_type">
                                <option value="">全部类型</option>
                                <option value="1">金卡会员</option>
                                <option value="2">银卡会员</option>
                                <option value="3">普卡会员</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="payment_type" class="col-sm-4 control-label">支付类型</label>

                        <div class="col-sm-8">
                            <select class="form-control" id="payment_type" name="payment_type">
                                <option value="">全部类型</option>
                                <option value="1">预付类型</option>
                                <option value="2">记账类型</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <a href="javascript:;" class="btn btn-primary">
                                <span class="glyphicon glyphicon-search"></span> 检索会员
                            </a>
                            <a href="#fasongModal" class="btn btn-primary pull-right" data-toggle="modal">
                                <span class="glyphicon glyphicon-send"></span> 发送消息
                            </a>
                        </div>
                    </div>
                </div>
            </form>
            <div class="settings-list">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr class="">
                        <th><label><input type="checkbox" name="message_status" value="0"></label></th>
                        <th>#</th>
                        <th>姓名</th>
                        <th>手机号码</th>
                        <th>身份证号</th>
                        <th>会员卡号</th>
                        <th>会员类型</th>
                        <th>有效期至</th>
                        <th>余额(元)</th>
                        <th>状态</th>
                        <th>操作人</th>
                        <th>注册时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="member" items="${members}">
                    <tr>
                        <td><label><input type="checkbox" name="message_status" value="${loop.index}"></label></td>
                        <td>${loop.index}</td>
                        <td>${member.member_name}</td>
                        <td>${member.member_mobile}</td>
                        <td>${member.member_idcard}</td>
                        <td>${member.card_id}</td>
                        <td>白金卡</td>
                        <td>2016-12-31</td>
                        <td>10000</td>
                        <c:if test="${member.member_status == 1}">
                            <td class="text-success">有效</td>
                        </c:if>
                        <c:if test="${member.member_status == 2}">
                            <td class="text-danger">锁定</td>
                        </c:if>
                        <td>李晓丹</td>
                        <td>2016-09-03</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <nav class="pull-right">
                    <p class="pull-left" style="margin: 24px 14px;">
                        <span>${pageSize }条/页</span>
                        <span>总${count}条</span>
                    </p>
                    <ul class="pagination pull-right">
                        <c:if test="${isFirstPage}">
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
                        <c:if test="${!isFirstPage}">
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
                        <c:if test="${isLastPage}">
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
                        <c:if test="${!isLastPage}">
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
    </div>
</div>

<div class="modal fade" id="fasongModal" tabindex="-1" role="dialog" aria-labelledby="fasongModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="fasongModalLabel">发送消息</h4>
            </div>
            <div class="modal-body">
                <textarea class="form-control" rows="3"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <span class="glyphicon glyphicon-ok"></span> 确 定
                </button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/Views/Shared/Common.jsp" />
<jsp:include page="/Views/Shared/Footer.jsp" />