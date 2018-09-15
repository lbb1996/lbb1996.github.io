<php>$item_list = ff_mysql_list('sid:1;limit:5;cache_name:default;cache_time:default;order:list_pid asc,list_oid;sort:asc');</php><!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:index" />
</head>
<body class="index">
<include file="BlockTheme:header" />
<!-- -->
<div class="container ff-bg">
  <div class="row ff-row slide">
    <div class="col-md-8 ff-col">
      <include file="Slide:index" />
    </div>
    <ul class="list-unstyled col-md-4 ff-col vod-item-img ff-img-90 visible-lg visible-md">
      <volist name="item_slide" id="feifei" offset="4" length="4">
      <li class="col-md-6">
      	<p class="image">
          <a href="{$feifei.slide_url}">
            <img class="img-responsive img-thumbnail ff-img" data-original="{$feifei.slide_logo|ff_url_img}" alt="{$feifei.slide_name}">
          </a>
        </p>
        <h4 class="ff-text-right">
          <a href="{$feifei.slide_url}">{$feifei.slide_name|msubstr=0,22,true}</a>
        </h4>
      </li>
      </volist>
    </ul>
    <div class="clearfix"></div>
    <div class="col-xs-12 ff-col ff-text-right text-nowrap search-hot">
    	<strong>热门搜索：</strong>{$site_hot}
    </div>
  </div>
</div>
<!-- -->
<div class="clearfix clearfix-ads"></div>
<div class="container ff-bg">
  <p class="text-center ff-ads">
    {:ff_url_ads('960_90')}
  </p>
</div>
<div class="clearfix clearfix-ads"></div>
<!-- -->
<volist name="item_list" id="feifeilist" offset="0" length="4">
<div class="container ff-bg">
<div class="page-header">
  <h2 class="ff-text-right">
    <span class="glyphicon glyphicon-film ff-text"></span>
    <a href="{$feifeilist.list_link}">{$feifeilist.list_name}</a>
    <span class="hidden-xs pull-right">
    <volist name=":explode(',',$feifeilist['list_extend']['type'])" id="feifeitype" offset="0" length="12">
    <a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifeitype}</a>
    </volist>
    <a class="ff-text" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多</a>
    </span>
    <small class="visible-xs pull-right">
    <a class="btn btn-success btn-xs" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多</a>
    </small>
  </h2>
</div>
<div class="row ff-row">
  <div class="col-md-8 ff-col">
    <ul class="list-unstyled vod-item-img ff-img-215">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:12;cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc')" id="feifei">
      <include file="BlockTheme:vod_item_img_left" />
      </volist>
    </ul>
  </div><!--md-8end -->
  <div class="col-md-4 ff-col visible-lg visible-md">
    <ol class="vod-item-ol">
      <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:20;cache_name:default;cache_time:default;order:vod_gold desc')" id="feifei">
        <include file="BlockTheme:vod_item_gold" />
      </volist>
    </ol>
  </div><!--md-4 end -->
</div><!--row end -->
</div><!--container end-->
<div class="clearfix ff-clearfix"></div>
</volist>
</div>
</div>
<!-- 短视频 样式-->
<volist name="item_list" id="feifeilist" offset="4" length='1'>
<div class="container ff-bg">
  <div class="page-header">
    <h2 class="ff-text-right">
      <span class="glyphicon glyphicon-film ff-text"></span>
      <a href="{$feifeilist.list_link}">{$feifeilist.list_name}</a>
      <span class="hidden-xs pull-right">
      <volist name=":explode(',',$feifeilist['list_extend']['type'])" id="feifeitype" offset="0" length="12">
      <a href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>urlencode($feifeitype),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifeitype}</a>
      </volist>
      <a class="ff-text" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多</a>
      </span>
      <small class="visible-xs pull-right">
      <a class="btn btn-success btn-xs" href="{:ff_url('vod/type',array('id'=>$feifeilist['list_id'],'type'=>'','area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更多</a>
      </small>
    </h2>
  </div>
  <ul class="list-unstyled vod-item-img ff-img-90">
    <volist name=":ff_mysql_vod('cid:'.$feifeilist['list_id'].';limit:18;cache_name:default;cache_time:default;order:vod_addtime;sort:desc')" id="feifei">
    <include file="BlockTheme:vod_item_img_sp" />
    </volist>
  </ul>
</div>
<div class="clearfix ff-clearfix"></div>
</volist>
<!-- 文章最新 -->
<php>$item_news = ff_mysql_news('limit:20;cache_name:default;cache_time:default;order:news_addtime;sort:desc');</php>
<notempty name="item_news">
<div class="container ff-bg">
  <div class="page-header">
    <h2><span class="glyphicon glyphicon-list-alt ff-text"></span> 最新资讯</h2>
  </div>
  <ul class="news-item-ul ff-row">
    <volist name="item_news" id="feifei">
      <include file="BlockTheme:news_item_hot" />
    </volist>
  </ul>
</div>
<div class="clearfix ff-clearfix"></div>
</notempty>
<!-- -->
<div class="container ff-bg hidden-xs">
  <div class="page-header">
    <h2><span class="glyphicon glyphicon-link ff-text"></span> 友情链接</h2>
  </div>
  <p class="ff-text-right">
  <volist name=":ff_mysql_link('limit:20;cache_name:default;cache_time:default;order:link_order;sort:asc')" id="feifei"><a href="{$feifei.link_url}" target="_blank">{$feifei.link_name}</a></volist>
  </p>
</div>
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
  <include file="BlockTheme:footer" />
</div>
</body>
</html>