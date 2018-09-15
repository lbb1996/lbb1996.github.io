<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<title>热门视频搜索_{$site_name}</title>
</head>
<body class="ajax-search">
<include file="BlockTheme:header" />
<div class="container ff-bg">
	<div class="ff-clearfix"></div>
  <include file="BlockBase:search_select" />
  <dl>
    <dt>热门搜索：</dt>
    <dd><volist name=":ff_mysql_vod('limit:30;cache_name:default;cache_time:default;order:vod_stars desc,vod_hits_lasttime;sort:desc')" id="feifei">
    <a class="btn btn-default btn-sm" href="{:ff_url_vod_play($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],1,1)}">{$feifei.vod_name|msubstr=0,15,'utf-8',true}</a>
    </volist></dd>
  </dl>
</div>
<div class="clearfix ff-clearfix"></div>
<div class="container ff-bg">
<include file="BlockTheme:footer" />
</div>
</body>
</html>