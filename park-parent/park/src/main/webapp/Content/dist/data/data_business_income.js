!function(t){var e={opts:{URL:"/data/getBusinessIncome"},init:function(){this.initEvents(),t.datetimepicker.setLocale("zh"),t("#createTimeStart").datetimepicker({timepicker:!1,lang:"zh",format:"Y-m-d",defaultDate:new Date}),t("#createTimeEnd").datetimepicker({timepicker:!1,lang:"zh",format:"Y-m-d",defaultDate:new Date})},initEvents:function(){var e=this;t(".data-filter").on("click",function(a){a.preventDefault();var n=t("#data_form").serialize();location.assign(e.opts.URL+"?"+n)})}};t(".confirm-check-money").on("click",function(e){if(e.preventDefault(),!window.confirm("确认吗？"))return!1;var a=t(this),n=a.attr("data-type"),i=a.attr("data-status"),o=a.parent().prev().find("input").val(),r=a.parent().attr("data-old-amount"),c=a.parent().prev().prev().find("input").val();t.post("/data/saveCollateInfo",{collateType:n,collateStatus:i,collateRemark:o,oldAmount:r,collateAmount:c},function(t){alert(t.message),1==t.code&&window.location.reload(!0)})}),e.init()}(jQuery);