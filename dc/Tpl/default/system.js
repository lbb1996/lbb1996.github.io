//主题自定义JS库
$(document).ready(function(){
	//资讯详情页图片自适应
	$('.news-detail .content img').addClass("img-responsive");
	//悬浮广告
	$(".ff-fixed").each(function(i){
		feifei.scroll.fixed($(this).attr('id'));
	});
});