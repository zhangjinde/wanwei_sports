(function ($, moment) {
    var Venue_Bookings = {
        tpl: {
            BlockBooking: function () {
                return '<tr data-date="#BOOKING_START_DATE#" data-site="#BOOKING_SITE#">' +
                    '<td>#BOOKING_SPORT#</td><td>#BOOKING_START_DATE#</td>' +
                    '<td>#BOOKING_START_TIME# ~ #BOOKING_END_TIME#</td><td>#BOOKING_AREA#</td>' +
                    '<td><a href="javascript:;" class="btn btn-danger reservations-delete">' +
                    '<span class="glyphicon glyphicon-trash"></span></a></td>' +
                    '</tr>';
            }
        },
        opts: {
            data: {
                name: "散客",
                mobile: "",
                memberId: "0",
                opType: "2",
                reserveType: "1",
                reserveModel: "2",
                siteReserveDateList: []
            }
        },
        init: function () {
            $.datetimepicker.setLocale('zh');

            // 表单时间控件设置
            $('#reservations_fixed_date').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                minDate: 0,
                value: moment().format('YYYY-MM-DD')
            });

            $(".start-date-select").on("click", function (e) {
                e.preventDefault();

                $('#reservations_fixed_date').datetimepicker("show");
            });

            $('#reservations_fixed_start').datetimepicker({
                datepicker: false,
                format: 'H:i',
                step: 60,
                value: '06:00'
            });

            $('#reservations_fixed_end').datetimepicker({
                datepicker: false,
                format: 'H:i',
                step: 60,
                value: '22:00'
            });

            this.initEvents();
            this.searchMembers();
        },
        // 查询会员
        searchMembers: function () {
            $("#reservations_fixed_mobile").autosuggest({
                url: '/member/searchMember',
                method: 'post',
                queryParamName: 'search',
                dataCallback:function(res) {
                    var data = res.data;
                    var json = [];

                    if (res.code == 1) {
                        if (data && data.members && data.members.length > 0) {
                            for (var i = 0; i < data.members.length; i++) {
                                json.push({
                                    id: data.members[i].memberId,
                                    label: data.members[i].memberMobile,
                                    value: data.members[i].memberName + '(' + data.members[i].memberMobile + ')'
                                });
                            }
                            return json;
                        } else {
                            $('#reservations_fixed_member').val("0");
                            $('#reservations_fixed_opType').val("2");
                            $('#reservations_fixed_name').val("散客");
                            return [];
                        }
                    } else {
                        alert('搜索会员失败, 请稍后重试');
                        return [];
                    }
                },
                onSelect:function(elm) {
                    var memberMobile = elm.data('label');
                    var memberId = elm.data('id');
                    var memberName = elm.data('value');

                    $('#reservations_fixed_mobile').val(memberMobile);
                    $('#reservations_fixed_member').val(memberId);
                    $('#reservations_fixed_opType').val("1");
                    $('#reservations_fixed_name').val(memberName.replace('(' + memberMobile + ')', ""));
                }
            });
        },
        // 计算
        calculateSiteMoney: function () {
            var content = this;

            $.post('/site/calculateSiteMoney', {
                siteOperationJson: JSON.stringify(content.opts.data)
            }, function (res) {
                var data = res.data;

                if (res.code == 1) {
                    $(".reservations-fixed-totalMoney").text(data.originalPrice);
                    $(".reservations-fixed-totalNum").text(data.sumNums);

                    $("#reservations_paid_orderSumCount").val(data.sumNums);
                    $("#reservations_paid_orderSumPrice").val(data.originalPrice);
                    $("#reservations_paid_payCount").val(data.sumNums);
                    $("#reservations_paid_paySumPrice").val(data.originalPrice);
                    $("#reservations_paid_money").val(data.originalPrice);
                } else {
                    alert(res.message || "计算金额失败, 请稍后重试");
                }
            });
        },
        initEvents: function () {
            var content = this;

            // 场地类型改变
            $("#reservations_fixed_site").on("change", function (e) {
                e.preventDefault();

                var $this = $(this);
                var tmp = '<option value="#SITEID#">#SITENAME#</option>';

                $.post('site/getSiteNames', {sportId: $this.val(), siteStatus: "1"}, function (res) {
                    var data = res.data;
                    var html = '';

                    if (res.code == 1) {
                        html += '<option value="">请选择</option>';

                        for (var i = 0; i < data.siteNames.length; i++) {
                            html += tmp.replace('#SITENAME#', data.siteNames[i].siteName)
                                .replace('#SITEID#', data.siteNames[i].siteId);
                        }

                        $("#reservations_fixed_siteId").html(html);
                    } else {
                        console.log(res.message || "查询场地失败, 请稍后重试");
                        alert(res.message || "查询场地失败, 请稍后重试");
                    }
                });
            });

            // 删除
            $(".reservations-list").on("click", ".reservations-delete", function (e) {
                e.preventDefault();

                var $list = $(this).parents("tr");
                var date = $list.attr("data-date");
                var site = $list.attr("data-site");
                var list = content.opts.data.siteReserveDateList;

                for (var i = 0; i < list.length; i++) {
                    if (list[i].reserveStartDate == date && list[i].siteReserveTimeList[0].siteId == site) {
                        content.opts.data.siteReserveDateList.splice(i, 1);
                        break;
                    }
                }
                $list.remove();

                content.calculateSiteMoney();
            });

            // 加场
            $("#reservations_fixed_add").on("click", function (e) {
                e.preventDefault();

                var $form = $("#reservations_fixed_form");
                var $list = $(".reservations-list");
                var siteReserveDate = {};

                if (!$form.valid()) {
                    return false;
                }

                var data = content.opts.data;

                data.mobile = $("#reservations_fixed_mobile").val();
                data.name = $("#reservations_fixed_name").val();
                data.memberId = $("#reservations_fixed_member").val() || "0";
                data.opType = $("#reservations_fixed_opType").val();

                siteReserveDate.reserveStartDate = $("#reservations_fixed_date").val();
                siteReserveDate.reserveEndDate = $("#reservations_fixed_date").val();
                siteReserveDate.reserveWeek = moment(siteReserveDate.reserveStartDate).format("e");
                siteReserveDate.siteReserveTimeList = [{
                    siteStartTime: $("#reservations_fixed_start").val(),
                    siteEndTime: $("#reservations_fixed_end").val(),
                    siteId: $("#reservations_fixed_siteId").val()
                }];
                data.siteReserveDateList.push(siteReserveDate);

                $list.append(content.tpl.BlockBooking()
                    .replace("#BOOKING_SPORT#", $("#reservations_fixed_site").find("option:selected").text().trim())
                    .replace(/#BOOKING_START_DATE#/g, $("#reservations_fixed_date").val())
                    .replace("#BOOKING_START_TIME#", $("#reservations_fixed_start").val())
                    .replace("#BOOKING_END_TIME#", $("#reservations_fixed_end").val())
                    .replace("#BOOKING_AREA#", $("#reservations_fixed_siteId").find("option:selected").text().trim())
                    .replace("#BOOKING_SITE#", $("#reservations_fixed_siteId").val()));

                content.calculateSiteMoney();
            });

            // 预订确认
            $("#reservations_fixed_confirm").on("click", function (e) {
                e.preventDefault();

                var $list = $(".reservations-list");
                if ($list.find("tr").size() == 1) {
                    alert("请先加场");
                    return false;
                }

                /*var data = content.opts.data;
                data.mobile = $("#reservations_fixed_mobile").val();
                data.name = $("#reservations_fixed_name").val();
                data.memberId = $("#reservations_fixed_member").val() || "0";
                data.opType = $("#reservations_fixed_opType").val();*/

                $.post('site/saveReservationSite', {
                    siteOperationJson: JSON.stringify(content.opts.data)
                }, function (res) {
                    var data = res.data;

                    if (res.code == 1) {
                        $("#reservations_paid_order").val(data.orderId);
                        $("#zhifuModal").modal({backdrop: false, show: true});
                    } else {
                        alert(res.message || "提交预订失败, 请稍后重试");
                    }
                });
            });

            // 确认支付
            $("#reservations_paid_confirm").on("click", function (e) {
                e.preventDefault();

                var $form = $("#reservations_paid_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") == "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('/site/confirmOrder', conditions, function (res) {
                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        $("#zhifuModal").modal("hide");
                        alert("预订支付成功");
                    } else {
                        alert(res.message || "确认订单失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Venue_Bookings.init();
})(jQuery, moment);