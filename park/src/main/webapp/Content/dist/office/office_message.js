!function(e){var t={opts:{URL:location.pathname},init:function(){this.initEvents()},initEvents:function(){var t=this;e(".message-filter").on("click",function(n){n.preventDefault();var i=e("#message_filter_form").serialize();location.assign(t.opts.URL+"?"+i)}),e(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click",function(n){n.preventDefault();var i=location.search,a=e(this).attr("data-index");i?i.indexOf("page=")==-1?location.assign(t.opts.URL+"?"+i+"&page="+a):location.assign(t.opts.URL+"?"+i.replace(/(page=)\d+/,"$1"+a)):location.assign(t.opts.URL+"?page="+a)}),e(".message-list").on("click",".message-view",function(t){t.preventDefault();var n=e(this).attr("data-note"),i=e(this).attr("data-id");e.post("office/viewNotifications",{noteId:n},function(t){var n=t.data;1==t.code?(e("#message_content_modal").find("#notification_send_id").val(n.noteId),e("#message_content_modal").find("#notification_send_receiver").val(n.senderId||""),e("#message_content_modal").find("#notification_send_title").val(n.noteTitle||""),e("#message_content_modal").find("#notification_send_content").val(n.noteContent||""),e.post("office/markNotificationRead",{id:i},function(t){1!=t.code&&(e.logConsole("标记通知详情已读失败",t.message),e.tipsWarningAlert("标记通知详情已读失败"))})):(e.logConsole("查询通知详情失败",t.message),e.tipsWarningAlert("通知详情查询失败"))})}),e(".message-list").on("click",".message-delete",function(t){t.preventDefault();var n=e(this).attr("data-id");e.post("office/deleteMessage",{id:n},function(t){1==t.code?(e.tipsWarningAlert("通知消息删除成功！"),setTimeout(function(){location.reload()},2e3)):(e.logConsole("查询通知详情失败",t.message),e.tipsWarningAlert("通知详情查询失败"))})})}};t.init()}(jQuery);