!function(t){var o={opts:{URL:"/good/getGoods"},init:function(){this.initEvents()},initEvents:function(){function o(o,n){t.post("/good/goodInOrOut",{goodId:o,up:n},function(o){1==o.code?location.reload():(t.logConsole("商品上/下架失败失败",o.message),t.tipsWarningAlert("商品上/下架失败失败"))})}var n=this;t(".goods-filter").on("click",function(o){o.preventDefault();var i=t("#goods_filter_form").serialize();t.tipsWarningAlert,location.assign(n.opts.URL+"?"+i)}),t(".page-first, .page-prev, .page-index, .page-next, .page-last").on("click",function(o){o.preventDefault();var n=location.search;n?n.indexOf("page=")==-1?location.assign(location.href+"&page="+t(this).attr("data-index")):location.assign(location.href.replace(/page=\d+/,"")+"&page="+t(this).attr("data-index")):location.assign("/good/getGoods?page="+t(this).attr("data-index"))}),t(".goods-list").on("click",".goods-enter",function(n){n.preventDefault();var i=t(this);return"working"!=i.attr("working")&&(i.attr("working","working"),void o(i.attr("data-id"),!0))}),t(".goods-list").on("click",".goods-outer",function(n){n.preventDefault();var i=t(this);return"working"!=i.attr("working")&&(i.attr("working","working"),void o(i.attr("data-id"),!1))}),t(".goods-list").on("click",".goods-count",function(){var o=t(this);t("#plus_good_id").val(o.attr("data-id")),t("#plus_current_good_count").text(o.attr("data-count")),t("#plus_good_count").val("")}),t("#plus_count_modal").on("click",".confirm-plus-count",function(o){o.preventDefault();var n=t("#plus_count_form"),i=n.serialize();return!("submitting"==n.attr("submitting")||!n.valid())&&(n.attr("submitting","submitting"),void t.post("/good/addGoodCount",i,function(o){n.attr("submitting",""),1==o.code?location.reload():(t.logConsole("增加库存失败",o.message),t.tipsWarningAlert("增加库存失败"))}))}),t(".goods-list").on("click",".goods-minus-count",function(){var o=t(this);t("#minus_good_id").val(o.attr("data-id")),t("#minus_current_good_count").text(o.attr("data-count")),t("#minus_good_count").val("")}),t("#minus_count_modal").on("click",".confirm-minus-count",function(o){o.preventDefault();var n=t("#minus_count_form"),i=n.serialize(),a=t("#minus_current_good_count").text(),r=t("#minus_good_count").val();return!("submitting"==n.attr("submitting")||!n.valid())&&(parseInt(a)<parseInt(r)?(t.tipsWarningAlert("损耗大于当前库存"),!1):(n.attr("submitting","submitting"),void t.post("/good/minusGoodCount",i,function(o){n.attr("submitting",""),1==o.code?location.reload():(t.logConsole("损耗库存失败",o.message),t.tipsWarningAlert("损耗库存失败"))})))})}};o.init()}(jQuery);