!function(t){var i={init:function(){this.initEvents()},initEvents:function(){t(".save-student").on("click",function(i){i.preventDefault();var s=t("#student_form"),n=s.serialize();return!("submitting"==s.attr("submitting")||!s.valid())&&(s.attr("submitting","submitting"),void t.post("/students/saveStudent",n,function(i){s.attr("submitting",""),1==i.code?(t("#tips_success_modal").modal({backdrop:!1,show:!0}),setTimeout(function(){t("#tips_success_modal").modal("hide"),location.assign("/students/list")},3e3)):(console.log(i.message||"学生信息保存失败, 请稍后重试"),alert(i.message||"学生信息保存失败, 请稍后重试"))}))})}};i.init()}(jQuery);