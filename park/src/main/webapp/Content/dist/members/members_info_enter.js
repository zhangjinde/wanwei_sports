(function ($) {
    var Members_register = {
        opts: {
            ToURL: "/member/membersInfoCar"
        },
        init: function () {
            // 表单时间控件设置
            $('#memberBirthday').datetimepicker({
                timepicker: false,
                lang: "zh",
                format:'Y-m-d',
                defaultDate: new Date()
            });

            $(".member-birthday-select").on("click", function (e) {
                e.preventDefault();

                $('#memberBirthday').datetimepicker("show");
            });

            this.initEvents();
        },
        initEvents: function () {
            var content = this;

            // 注册用户提交
            $(".register-member").on("click", function (e) {
                e.preventDefault();

                var $form = $("#member_form");
                var conditions = $form.serialize();

                if ($form.attr("submitting") === "submitting" || !$form.valid()) {
                    return false;
                }
                $form.attr("submitting", "submitting");

                $.post('member/saveMember', conditions, function (res) {
                    var data = res.data;

                    $form.attr("submitting", "");

                    if (res.code == 1) {
                        location.assign(content.opts.ToURL + '?memberId=' + data.memberId);
                    } else {
                        alert(res.message || "会员信息保存失败, 请稍后重试");
                    }
                });
            });
        }
    };

    Members_register.init();
})(jQuery);