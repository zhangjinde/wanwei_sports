!function(e){var t={init:function(){this.initEvents()},calculateRechargeMoney:function(){var t=e("#recharge_money"),r=e("#recharge_send"),a=parseFloat(t.val()||"0.00"),i=parseFloat(r.val()||"0.00");return(a+i).toFixed(2)},initEvents:function(){var t=this;e("#keywords").autosuggest({url:"/member/searchMember",method:"post",queryParamName:"search",dataCallback:function(t){var r=t.data,a=[];if(1==t.code){if(r&&r.members&&r.members.length>0){for(var i=0;i<r.members.length;i++)a.push({id:r.members[i].memberId,label:r.members[i].cardNo,value:r.members[i].memberName+"("+r.members[i].memberMobile+","+r.members[i].cardNo+")"});return a}return e.tipsWarningAlert("没有搜索到会员"),[]}return e.logConsole("搜索会员失败",t.message),e.tipsWarningAlert("搜索会员失败"),[]},onSelect:function(t){var r=t.data("label");e("#card_no").val(r),location.assign("/member/getMembersCardRecharge?cardNo="+r)}}),e(".member-card-filter").on("click",function(t){t.preventDefault();var r=e("#member_card_form"),a=r.serialize();return!!r.valid()&&void e.post("member/searchMember",a,function(t){var r=t.data;1==t.code?r&&r.members&&r.members.length>0?location.assign("/member/getMembersCardRecharge?cardNo="+r.members[0].cardNo):e.tipsWarningAlert("没有搜索到会员"):(e.logConsole("搜索会员失败",t.message),e.tipsWarningAlert("搜索会员失败"))})}),e("#recharge_money, #recharge_send").on("change",function(r){r.preventDefault(),e(".recharge-total-money").text(t.calculateRechargeMoney())}),e(".recharge-card-submit").on("click",function(t){t.preventDefault();var r=e(this).button("loading"),a=e("#recharge_card_form"),i=a.serialize();return""===e("#recharge_cardId").val()?(e.tipsWarningAlert("请先选择会员卡"),!1):!("submitting"==a.attr("submitting")||!a.valid())&&(a.attr("submitting","submitting"),void e.post("/member/memberCardCZ",i,function(t){a.attr("submitting",""),1==t.code?(e("#invoice_confirm_modal").modal({backdrop:!1,show:!0}),e.each(t.data,function(t,r){e("#member_card_ticket_form").find("input[name='"+t+"']").val(r)}),e("#member_card_ticket_form").find("#ticket_header").val(""),e("#member_card_ticket_form").find("#ticket_money").val(""),e("#member_card_ticket_form").find("#ticket_content").val(""),e("#member_card_ticket_form").find("#invoice_no").val(t.data.balanceNo)):(e.logConsole("会员充值失败",t.message),e.tipsWarningAlert("会员充值失败")),r.button("reset")}))}),e("#is_print_ticket").on("change",function(t){t.preventDefault();var r=e(this).prop("checked");r?e(".is-show-ticket").show():e(".is-show-ticket").hide()}),e(".print-ticket").on("click",function(t){if(t.preventDefault(),!e("#is_print_ticket").prop("checked"))return location.reload(),e("#invoice_confirm_modal").modal("hide"),!1;var r=e("#member_card_ticket_form"),a=r.serialize();return!("submitting"==r.attr("submitting")||!r.valid())&&(r.attr("submitting","submitting"),void e.post("/member/saveInvoice",a,function(t){r.attr("submitting",""),1==t.code?(location.reload(),e("#invoice_confirm_modal").modal("hide")):(e.logConsole("发票登记失败",t.message),e.tipsWarningAlert("发票登记失败"))}))}),e("#recharge_type").on("change",function(t){t.preventDefault();var r=e(this),a=e(".recharge-check-no");r.val()==a.attr("data-value")?a.show():a.hide()})}};t.init()}(jQuery);