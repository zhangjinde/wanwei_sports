!function(e){e("#student_name").on("input",function(t){t.preventDefault(),/^\s*$/.test(e(this).val())?e(this).parents(".weui-cell").addClass("weui-cell_warn"):e(this).parents(".weui-cell").removeClass("weui-cell_warn")}),e("#student_mobile").on("input",function(t){t.preventDefault(),/^1\d{10}$/.test(e(this).val())?e(this).parents(".weui-cell").removeClass("weui-cell_warn"):e(this).parents(".weui-cell").addClass("weui-cell_warn")}),e("#class_id").on("change",function(t){t.preventDefault(),"0"==e(this).val()?e(this).parents(".weui-cell").addClass("weui-cell_warn"):(e(this).parents(".weui-cell").removeClass("weui-cell_warn"),e.post("/mobile/training/classInfo",{classId:e(this).val()},function(t){1==t.code?e("#pay_price").val(t.data.classInfo.classPrice):(e.logConsole("查询班级详情失败",t.message),e.tipsWarningAlert(t.message||"查询班级详情失败"))}))}),e("#confirm_signup").on("click",function(t){t.preventDefault();var s=e("#signup_form"),i=s.serialize();return e("#student_name").trigger("input"),e("#student_mobile").trigger("input"),e("#class_id").trigger("change"),!(e(".weui-cell_warn").size()>0)&&("submitting"!=s.attr("submitting")&&(s.attr("submitting","submitting"),void e.post("/mobile/training/signTrainsStudents",i,function(t){s.attr("submitting",""),1==t.code?e.tipsSuccessAlert("报名成功！",function(){location.assign("/mobile/training/students?classId="+e("#class_id").val())}):(e.logConsole("用户报名失败",t.message),e.tipsWarningAlert(t.message||"用户报名失败"))})))})}(Zepto);