!function(t){var i={opts:{URL:"/office/notifications"},init:function(){this.initEvents()},initEvents:function(){function i(i,n){2==n?(t("#senderModal").find("#note_receiver1").val(i.noteReceiver).attr("disabled","disabled"),t("#senderModal").find(".note-title").text(i.noteTitle),t("#senderModal").find(".note-content").text(i.noteContent)):(t("#fasongModal").find("#note_id").val(i.noteId),t("#fasongModal").find("#note_receiver").val(i.noteReceiver),t("#fasongModal").find("#note_title").val(i.noteTitle),t("#fasongModal").find("#note_content").val(i.noteContent))}var n=this;t(".notification-filter").on("click",function(i){i.preventDefault();var o=t("#notification_filter_form").serialize();location.assign(n.opts.URL+"?"+o)}),t(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click",function(i){i.preventDefault();var o=location.search,e=t(this).attr("data-index");o?o.indexOf("page=")==-1?location.assign(n.opts.URL+"?"+o+"&page="+e):location.assign(n.opts.URL+"?"+o.replace(/(page=)\d+/,"$1"+e)):location.assign(n.opts.URL+"?page="+e)}),t(".notifications-list").on("click",".notifications-view",function(n){n.preventDefault();var o=t(this).attr("data-id"),e=t(this).attr("data-edit");t.post("office/viewNotifications",{noteId:o},function(n){var o=n.data;1==n.code?(i(o,e),1==e&&(t("#fasongModal").find(".save-notification").hide(),t("#fasongModal").find(".send-notification").send())):(console.log(n.message||"查询通知详情失败, 请稍后重试"),alert(n.message||"查询通知详情失败, 请稍后重试"))})}),t(".notifications-list").on("click",".notifications-resend",function(n){n.preventDefault();var o=t(this).attr("data-id"),e=t(this).attr("data-edit");t.post("office/viewNotifications",{noteId:o},function(n){var o=n.data;1==n.code?(i(o,e),1==e&&(t("#fasongModal").find(".save-notification").hide(),t("#fasongModal").find(".send-notification").send())):(console.log(n.message||"查询通知详情失败, 请稍后重试"),alert(n.message||"查询通知详情失败, 请稍后重试"))})}),t(".add-notification").on("click",function(n){n.preventDefault(),i({},1),t("#fasongModal").find(".save-notification").show(),t("#fasongModal").find(".send-notification").hide()}),t(".save-notification").on("click",function(i){i.preventDefault();var n=t("#notification_form"),o=n.serialize();return!("submitting"===n.attr("submitting")||!n.valid())&&(n.attr("submitting","submitting"),void t.post("office/saveNotifications",o,function(t){n.attr("submitting",""),1==t.code?location.reload():alert(t.message||"通知信息保存失败, 请稍后重试")}))}),t(".send-notification").on("click",function(i){i.preventDefault();var n=t("#notification_form"),o=n.serialize();return!("submitting"===n.attr("submitting")||!n.valid())&&(n.attr("submitting","submitting"),void t.post("office/sendNotifications",o,function(t){n.attr("submitting",""),1==t.code?location.reload():alert(t.message||"通知信息保存失败, 请稍后重试")}))})}};i.init()}(jQuery);