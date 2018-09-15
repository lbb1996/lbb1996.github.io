<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_detail" />
</head>
<body class="vod-detail">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<div class="page-header">
  <h2>
    <span class="glyphicon glyphicon-film ff-text"></span>
    <a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a>
    <a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name|msubstr=0,8,true}</a>
    <small>影片详情</small>
    <small class="pull-right hidden-xs">
      相关链接： 
      <a href="{:ff_url('forum/vod',array('cid'=>$vod_id,'p'=>1),true)}" target="_blank">{$vod_name|msubstr=0,8,true}影评</a>
      <notempty name="vod_scenario.info">
      <a href="{:ff_url('scenario/detail',array('id'=>$vod_id),true)}" target="_blank">{$vod_name|msubstr=0,8,true}剧情</a>
      </notempty>
    </small>
  </h2>
</div>
<div class="row">
<div class="col-md-8 col-xs-12">
	<div class="media">
  	<div class="media-left">
      <a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">
        <img class="media-object img-thumbnail ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}免费观看">
      </a>
      <div class="hidden-xs hidden-sm">
      <p class="text-center">
      	<include file="BlockBase:vod_record" />
      </p>
      </div>
    </div>
    <div class="media-body">
    	<h2>
      	<a class="ff-text" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name}</a>
        <small><include file="BlockBase:vod_continu" /></small>
      </h2>
      <dl class="dl-horizontal">
        <dt>主演：</dt>
        <dd class="ff-text-right">{$vod_actor|ff_url_search}</dd>
        <dt>导演：</dt>
        <dd class="ff-text-right">{$vod_director|ff_url_search='director'}</dd>
        <dt>类型：</dt>
        <dd class="ff-text-right">
        <a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a>
        <include file="BlockBase:vod_type" />
        </dd>
        <dt>地区：</dt>
        <dd class="ff-text-right"><include file="BlockBase:vod_area" /></dd>
        <dt>年份：</dt>
        <dd class="ff-text-right"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2017'}</a></dd>
        <dt class="hidden-xs hidden-sm">剧情：</dt>
        <dd class="ff-text-right hidden-xs hidden-sm">
        	<include file="BlockBase:vod_content" />
        </dd>
      </dl>
    </div>
  </div>
</div>
<div class="col-md-4 ff-col hidden-xs hidden-sm">
  <include file="BlockBase:vod_score" />
  <div class="clearfix"></div>
  <div class="text-center ff-ads">
  {:ff_url_ads('300_250')}
  </div>
</div>
</div><!--row end -->
<include file="BlockBase:vod_playurl" />
<!-- -->
<include file="BlockBase:vod_playurl_line" />
<!-- -->
<include file="BlockBase:vod_playurl_yugao" />
<!-- -->
<include file="BlockBase:vod_playurl_down" />
<!-- -->
<include file="BlockBase:vod_scenario" />
<!-- -->
<include file="BlockTheme:vod_item_img_series" />
<!-- -->
<include file="BlockTheme:vod_item_img_actor" />
<!-- -->
<include file="BlockTheme:vod_item_img_hot" />
<!-- -->
<include file="BlockBase:forum_ajax_vod" />
</div><!--container end -->
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
  <include file="BlockTheme:footer" />
</div>
</body>
</html>