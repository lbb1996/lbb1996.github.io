<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_play" />
</head>
<body class="vod-play">
<include file="BlockTheme:header" />
<div class="container ff-bg">
<div class="page-header">
  <h2 class="text-nowrap">
    <span class="glyphicon glyphicon-film ff-text"></span> 
    <a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a>
    <a href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}" class="ff-text">{$vod_name|msubstr=0,8}</a>
    <small>第{$play_pid}集</small>
    <small class="hidden-xs hidden-sm"><include file="BlockBase:vod_share" /></small>
  </h2>
</div>
<div class="row ff-row">
  <div class="col-md-8 ff-col">
    <include file="BlockBase:vod_player" />
    <div class="clearfix"></div>
    <ul class="list-unstyled ff-row ff-player-tool">
      <li class="col-sm-4 col-xs-7 ff-col"><include file="BlockBase:vod_updown" /></li>
      <li class="col-sm-4 hidden-xs"><include file="BlockBase:vod_score" /></li>
      <li class="col-sm-4 col-xs-5 ff-col text-right"><include file="BlockBase:vod_playurl_next" /></li>
    </ul>
  </div>
  <div class="col-md-4 ff-col hidden-xs hidden-sm">
    <div class="media">
      <a class="media-left" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">
        <img class="media-object img-thumbnail img-responsive ff-img" data-original="{$vod_pic|ff_url_img=$vod_content}" alt="{$vod_name}免费观看">
      </a>
      <div class="media-body">
        <h5>
          <a class="ff-text" href="{:ff_url_vod_read($list_id,$list_dir,$vod_id,$vod_ename,$vod_jumpurl)}">{$vod_name|msubstr=0,12,true}</a>
        </h5>
        <dl class="dl-horizontal">
          <dt>主演：</dt>
          <dd class="text-nowrap ff-text-right">{$vod_actor|ff_url_search}</dd>
          <dt>导演：</dt>
          <dd class="text-nowrap ff-text-right">{$vod_director|ff_url_search='director'}</dd>
          <dt>类型：</dt>
          <dd class="text-nowrap ff-text-right">
            <a href="{:ff_url_vod_show($list_id,$list_dir,1)}">{$list_name}</a>
            <include file="BlockBase:vod_type" />
          </dd>
          <dt>地区：</dt>
          <dd class="text-nowrap"><include file="BlockBase:vod_area" /></dd>
          <dt>年份：</dt>
          <dd class="ff-text-right"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$vod_year,'star'=>'','state'=>'','order'=>'hits'),true)}">{$vod_year|default='2017'}</a></dd>
        </dl>
      </div>
    </div>
    <div class="clearfix ff-clearfix"></div>
    <p class="text-center ff-ads">
      {:ff_url_ads('300_300')}
    </p>
  </div>
</div>
<include file="BlockBase:vod_playurl" />
<!-- -->
<eq name="play_name_en" value="yugao">
<include file="BlockBase:vod_playurl_yugao_dropdown" />
<else/>
<include file="BlockBase:vod_playurl_line_dropdown" />
</eq>
<!-- -->
<include file="BlockTheme:vod_item_img_series" />
<!-- -->
<include file="BlockTheme:vod_item_img_actor" />
<!-- -->
<include file="BlockTheme:vod_item_img_hot" />
<!-- -->
<include file="BlockBase:forum_ajax_vod" />
<!-- -->
<include file="BlockBase:vod_record_set" />
{$vod_hits_insert}
</div><!--container end -->
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
  <include file="BlockTheme:footer" />
</div>
</body>
</html>