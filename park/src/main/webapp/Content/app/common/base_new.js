(function ($, moment) {
    /* 全局事件 */

    // 退出登录
    /*$(".user-logout").on("click", function (e) {
        e.preventDefault();

        //alert("成功登出");
        location.assign('/passport/login');
    });*/

    // 初始化数据
    function initialize() {
        var weeks = ["", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"];
        var date = moment();
        $(".top-header-date").text(date.format("今天是YYYY年MM月DD日 ") + weeks[date.format("e")]);

        // 获取用户信息
        var user = $.cookie('wc-user');
        if (false && user) {
            user = JSON.parse(user);
            $(".top-menu-username").text(user.operatorName);
        } else {
            $.post('/passport/getUserProfile', function (res) {
                var data = res.data;

                if (res.code == 1) {
                    $.cookie('wc-user', JSON.stringify(data.user), {path: '/'});
                    $(".top-menu-username").text(data.user.operatorName);
                }
            });
        }

        // 获取营运时间
        var businessTime = $.cookie('wc-business-time');
        if (!businessTime) {
            $.post('/settings/getBusinessTime', function (res) {
                var data = res.data;

                if (res.code == 1) {
                    var businessTime1 = [];
                    var businessStartTime = parseInt(data.businessStartTime.replace(":00", ""));
                    var businessEndTime = parseInt(data.businessEndTime.replace(":00", ""));
                    var time;

                    for (var i = businessStartTime; i <= businessEndTime; i++) {
                        time = (i >= 10) ? ("" + i) : ("0" + i);
                        businessTime1.push(time + ":00");
                    }

                    $.cookie('wc-business-time', JSON.stringify(businessTime1), {path: '/'});
                }
            });
        }

        // 获取未读信息条数
        $.post('/office/getNotReadMessageCount', function (res) {
            var data = res.data;

            if (res.code == 1 && data.count > 0) {
                $(".unread-message-count").text(data.count).show();
            } else {
                $(".unread-message-count").hide();
            }
        });
    }
    initialize();

    new $.TextMagnifier();

    $.isDebug = true;
    $.logConsole = function (tag, message) {
        if ($.isDebug) {
            console.log(moment().format("YYYYMMDDHHmmss -- ") + tag + "：" + message);
        }
    };

    $.tipsWarningAlert = function (message) {
        $("#tips_failure_modal").modal({show: true, backdrop: false}).find(".tips-content").text(message);

        var timeout = setTimeout(function () {
            $("#tips_failure_modal").modal("hide");
            clearTimeout(timeout);
        }, 3000);
    };

    $.tipsSuccessAlert = function (message, callback) {
        if (!callback) {
            callback = new Function();
        }

        $("#tips_success_modal").modal({show: true, backdrop: false}).find(".tips-content").text(message);

        var timeout = setTimeout(function () {
            $("#tips_success_modal").modal("hide");
            clearTimeout(timeout);
            callback();
        }, 3000);
    };

    $.tipsSuccessConfirm = function (message) {
        $("#tips_confirm_modal").modal({show: true, backdrop: false}).find(".tips-content").text(message);
    };

    // 导航切换
    $(".navigator-container").on("click", ".list-nav-header", function (e) {
        e.preventDefault();

        var $this = $(this);
        var item = $this.attr("data-item");

        if ($this.hasClass("active")) {
            return false;
        }

        $(".navigator-container").find(".list-nav-header").removeClass("active");
        $this.addClass("active");

        $(".navigator-container").find(".list-nav-list").hide();
        $(".navigator-container").find(".list-nav-list." + item).show();
    });

    /* jQuery扩展 */

    // 将form表单数据序列化为json
    $.fn.serializeObject = function () {
        var data = {};

        this.serializeArray().map(function (x) {
            data[x.name] = x.value;
        });

        return data;
    };

    // 四则运算
    //加法函数
    function accAdd(arg1, arg2) {
        var r1, r2, m;

        try {
            r1 = arg1.toString().split(".")[1].length;
        } catch(e) {
            r1 = 0;
        }
        try {
            r2 = arg2.toString().split(".")[1].length;
        } catch(e) {
            r2 = 0;
        }

        m = Math.pow(10, Math.max(r1, r2));

        return (arg1 * m + arg2 * m) / m;
    }

    //给Number类型增加一个add方法
    Number.prototype.add = function (arg) {
        return accAdd(arg, this);
    };

    // 减法函数
    function accSubtract(arg1, arg2) {
        var r1, r2, m, n;

        try {
            r1 = arg1.toString().split(".")[1].length;
        } catch(e) {
            r1 = 0;
        }

        try {
            r2 = arg2.toString().split(".")[1].length;
        } catch(e) {
            r2 = 0;
        }

        m = Math.pow(10, Math.max(r1, r2));
        //动态控制精度长度
        n = (r1 >= r2) ? r1 : r2;

        return ((arg2 * m - arg1 * m) / m).toFixed(n);
    }

    //给number类增加一个sub方法
    Number.prototype.subtract = function (arg) {
        return accSubtract(arg, this);
    };

    //乘法函数
    function accMultiply(arg1, arg2) {
        var m = 0,
            s1 = arg1.toString(),
            s2 = arg2.toString();

        try {
            m += s1.split(".")[1].length
        } catch(e) {}
        try {
            m += s2.split(".")[1].length
        } catch(e) {}

        return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m);
    }

    //给Number类型增加一个mul方法
    Number.prototype.multiply = function (arg) {
        return accMultiply(arg, this);
    };

    //除法函数
    function accDivide(arg1, arg2) {
        var t1 = 0, t2 = 0, r1, r2;

        try {
            t1 = arg1.toString().split(".")[1].length
        } catch(e) {}
        try {
            t2 = arg2.toString().split(".")[1].length
        } catch (e) {}

        r1 = Number(arg1.toString().replace(".", ""));
        r2 = Number(arg2.toString().replace(".", ""));

        return (r1 / r2) * Math.pow(10, t2 - t1);
    }

    //给Number类型增加一个div方法
    Number.prototype.divide = function (arg) {
        return accDivide(this, arg);
    };
})(jQuery, moment);
