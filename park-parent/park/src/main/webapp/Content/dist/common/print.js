!function(t){t.Web_Print={opts:{Config:{Company:"第一七一中学体育俱乐部",Address:"北京市朝阳区某条路门号",Phone:"010-85223322"}},getMememberCardBinding:function(t){for(var n=this,p='<style type="text/css">.print-content {width: 220px; font-size: 14px;}.print-content .print-content-header,.print-content .print-content-footer {font-size: 24px;font-weight: bold;}.print-content .print-content-w2 {width: 40px;display: inline-block;}.print-content .print-content-w4 {width: 70px;display: inline-block;}.print-content .print-content-w6 {width: 100px;display: inline-block;}.print-content .print-content-items p {margin-left: 16px;}.print-content .print-content-items .print-content-item {margin-left: 4px;}</style>',e='<div class="print-content"><p class="print-content-header">会员卡办理</p><p><span class="print-content-w4">打印时间:</span>'+t.printDate+'</p><p><span class="print-content-w4">收银员:</span>'+t.operatorName+'</p><p><span class="print-content-w4">订单号:</span>'+t.orderNo+"</p><hr>",i=0;i<t.cards.length;i++)e+='<div class="print-content-items"><p class="print-content-item">'+t.cards[i].cardType+"</p><p>会费 "+t.cards[i].cardTypeMoney+"元</p><p>押金 "+t.cards[i].cardDeposit+"元</p><p>充值金额 "+t.cards[i].cardBalance+"元</p><p>赠送金额 "+t.cards[i].givingAmount+"元</p></div>";return e+='<p style="text-align:right">合计: '+t.orderMoney+'元</p><hr><p><span class="print-content-w2">场地:</span>'+n.opts.Company+'</p><p><span class="print-content-w2">地址:</span>'+n.opts.Address+'</p><p><span class="print-content-w2">电话:</span>'+n.opts.Phone+"</p></div>",p+e},getBookingSheetContent:function(t){for(var n='<style type="text/css">.print-content {width: 220px; font-size: 14px;}.print-content .print-content-header,.print-content .print-content-footer {font-size: 24px;font-weight: bold;}.print-content .print-content-w2 {width: 40px;display: inline-block;}.print-content .print-content-w4 {width: 70px;display: inline-block;}.print-content .print-content-w6 {width: 100px;display: inline-block;}.print-content .print-content-items p {margin-left: 16px;}.print-content .print-content-items .print-content-item {margin-left: 4px;}</style>',p='<div class="print-content"><p class="print-content-header">场地预订结账单</p><p><span class="print-content-w4">打印时间:</span>'+t.datetime+'</p><p><span class="print-content-w4">收银员:</span>'+t.personname+'</p><p><span class="print-content-w4">订单号:</span>'+t.orderno+"</p><hr>",e=0;e<t.orders.length;e++)p+='<div class="print-content-items"><p class="print-content-item">'+t.orders[e].sitenumber+"</p><p>"+t.orders[e].date+" "+t.orders[e].starttime+"~"+t.orders[e].endtime+" 60.00元</p></div>";return p+='<p style="text-align:right">合计: 180.00元</p><hr><p><span class="print-content-w2">场地:</span>第一七一中学体育俱乐部</p><p><span class="print-content-w2">地址:</span>北京市朝阳区某条路门号</p><p><span class="print-content-w2">电话:</span>010-85223322</p></div>',n+p},printBookingSheet:function(t){var n=getLodop();n.PRINT_INIT("场地预订结账单"),n.SET_PRINT_PAGESIZE(3,650,40,""),n.ADD_PRINT_HTM(10,12,"100%","100%",this.getBookingSheetContent(t)),n.PRINT()},getBookingBlockSheetContent:function(t){for(var n='<style type="text/css">.sc-print-content {width: 220px; font-size: 14px;}.sc-print-content .print-content-header,.sc-print-content .print-content-footer {font-size: 24px;font-weight: bold;}.sc-print-content .print-content-w2 {width: 40px;display: inline-block;}.sc-print-content .print-content-w4 {width: 70px;display: inline-block;}.sc-print-content .print-content-w6 {width: 100px;display: inline-block;}.sc-print-content .print-content-items p {margin-left: 16px;}.sc-print-content .print-content-items .print-content-item {margin-left: 4px;}</style>',p='<div class="sc-print-content"><p class="print-content-header">场地预订结账单</p><p><span class="print-content-w4">打印时间:</span>'+t.datetime+'</p><p><span class="print-content-w4">收银员:</span>'+t.personname+'</p><p><span class="print-content-w4">订单号:</span>'+t.orderno+"</p><hr>",e=0;e<t.orders.length;e++)p+='<div class="print-content-items"><p class="print-content-item">'+t.orders[e].sitenumber+"</p><p>"+t.orders[e].startdate+"~"+t.orders[e].enddate+"~"+t.orders[e].scheduledweek+"</p></div>";return p+='<p style="text-align:right">合计: 180.00元</p><hr><p><span class="print-content-w2">场地:</span>第一七一中学体育俱乐部</p><p><span class="print-content-w2">地址:</span>北京市朝阳区某条路门号</p><p><span class="print-content-w2">电话:</span>010-85223322</p></div>',n+p},printBookingBlockSheet:function(t){var n=getLodop();n.PRINT_INIT("场地预订结账单"),n.SET_PRINT_PAGESIZE(3,650,40,""),n.ADD_PRINT_HTM(10,12,"100%","100%",this.getBookingBlockSheetContent(t)),n.PRINT()}}}(jQuery);