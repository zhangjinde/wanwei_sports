!function(i){var t={init:function(){this.initEvents(),this.initTimePicker()},initTimePicker:function(){i.datetimepicker.setLocale("zh"),i("#start_time").datetimepicker({datepicker:!1,format:"H:i",step:60,value:"06:00"}),i("#end_time").datetimepicker({datepicker:!1,format:"H:i",step:60,value:"22:00"})},initEvents:function(){i(".init-confirm").on("click",function(t){t.preventDefault();var e=i("#init_form"),n=e.serialize();return!("submitting"==e.attr("submitting")||!e.valid())&&(e.attr("submitting","submitting"),void i.post("/init/saveInit",n,function(t){e.attr("submitting",""),1==t.code?(i("#tips_success_modal").modal({show:!0,backdrop:!1}),setTimeout(function(){i("#tips_success_modal").modal("hide"),location.assign("/passport/login")},3e3)):(console.log(t.message||"初始化失败, 请稍后重试"),alert(t.message||"初始化失败, 请稍后重试"))}))})}};t.init()}(jQuery);