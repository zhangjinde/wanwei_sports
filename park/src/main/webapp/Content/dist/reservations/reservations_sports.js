!function(t){var e={init:function(){this.initEvents(),this.initTimePicker()},initTimePicker:function(){t.datetimepicker.setLocale("zh"),t.post("/settings/getBusinessTime",{},function(e){var i=e.data;1==e.code?(t("#start_time").datetimepicker({datepicker:!1,format:"H:i",step:60,value:i.businessStartTime,minTime:i.businessStartTime,maxTime:i.businessEndTime}),t("#end_time").datetimepicker({datepicker:!1,format:"H:i",step:60,value:i.businessEndTime,minTime:i.businessStartTime,maxTime:i.businessEndTime})):(console.log(e.message||"运营时间查询失败, 请稍后重试"),alert(e.message||"运营时间查询失败, 请稍后重试"),t("#start_time").datetimepicker({datepicker:!1,format:"H:i",step:60,value:"06:00"}),t("#end_time").datetimepicker({datepicker:!1,format:"H:i",step:60,value:"22:00"}))})},initEvents:function(){function e(){t("#sport_id").val(""),t("#sport_name").val(""),t("#sport_money").val(""),t("#sport_deposit").val(""),t("#start_time").val(""),t("#end_time").val(""),t("#sport_status1").prop("checked",!0)}t(".sports-confirm").on("click",function(e){e.preventDefault();var i=t("#sports_form"),s=i.serialize();return!("submitting"==i.attr("submitting")||!i.valid())&&(i.attr("submitting","submitting"),void t.post("/site/saveSiteSport",s,function(t){i.attr("submitting",""),1==t.code?location.reload():(console.log(t.message||"场地运动类型设置失败, 请稍后重试"),alert(t.message||"场地运动类型设置失败, 请稍后重试"))}))}),t(".sports-add").on("click",function(i){i.preventDefault(),e(),t("#settingModal").modal({backdrop:!1,show:!0})}),t(".sports-list").on("click",".sports-update",function(i){i.preventDefault();var s=t(this);e(),t.post("/site/getSiteSport",{sportId:s.attr("data-id")},function(e){var i=e.data;1==e.code?(t.each(i,function(e,i){t("#sports_form").find("*[name='"+e+"']").not(":radio").val(i)}),t("#sports_form").find("input[name='sportStatus'][value='"+i.sportStatus+"']").prop("checked",!0),t("#settingModal").modal({backdrop:!1,show:!0})):(console.log(e.message||"场地运动类型查询失败, 请稍后重试"),alert(e.message||"场地运动类型查询失败, 请稍后重试"))})})}};e.init()}(jQuery);