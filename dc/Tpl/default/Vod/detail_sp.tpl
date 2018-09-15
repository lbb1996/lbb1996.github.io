<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_detail" />
</head>
<body class="vod-detail-sp">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<div class="page-header">
  <h2 class="text-nowrap">
    <span class="glyphicon glyphicon-film ff-text"></span> 
    <a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a>
    <small>{$vod_name|msubstr=0,24}</small>
    <small class="hidden-xs hidden-sm"><include file="BlockBase:vod_share" /></small>
  </h2>
</div>
<div class="row ff-row">
  <div class="col-md-8 ff-col">
    <div class="embed-responsive embed-responsive-4by3" id="cms_player">
      <div id="cms-player-vip">
        <div class="cms-player-box"></div>
        <iframe class="embed-responsive-item cms-player-iframe" src="{:ff_url('vod/vip',array('action'=>'play','id'=>$vod_id,'sid'=>1,'pid'=>1))}" width="100%" height="100%" frameborder="0" scrolling="no" allowfullscreen="true" allowtransparency="true"></iframe>
      </div>
    </div>
    <div class="clearfix"></div>
    <ul class="list-unstyled row vod-tool">
      <li class="col-sm-6 col-xs-12"><include file="BlockBase:vod_updown" /></li>
      <li class="col-sm-6 hidden-xs"><include file="BlockBase:vod_score" /></li>
    </ul>
  </div>
  <div class="col-md-4 ff-col hidden-xs hidden-sm">
    <p class="text-center ff-ads">{:ff_url_ads('300_250')}</p>
    <div class="clearfix ff-clearfix"></div>
    <p class="text-center ff-ads">{:ff_url_ads('300_250')}</p>
  </div>
</div>
<div class="page-header">
  <h2><span class="glyphicon glyphicon-heart-empty ff-text"></span> 猜你喜欢</h2>
</div>
<ul class="list-unstyled vod-item-img ff-img-90">
  <volist name=":ff_mysql_vod('cid:'.$vod_cid.';actor:'.ff_array(explode(',',$vod_actor),0).';limit:24;cache_name:default;cache_time:default;order:vod_hits_lasttime;sort:desc')" id="feifei">
  <include file="BlockTheme:vod_item_img_sp" />
  </volist>
</ul>
<!-- -->
<include file="BlockBase:forum_ajax_vod" />
{$vod_hits_insert}
</div><!--container end -->
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
  <include file="BlockTheme:footer" />
</div>
</body>
</html>