<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<title>热门视频搜索_{$site_name}</title>
</head>
<body class="ajax-search">
<include file="BlockTheme:header" />
<div class="container ff-bg">
  <form class="form-horizontal ff-search" data-sid="{$site_sid}" data-limit="{:C('ui_search_limit')}" role="search" action="{$root}index.php?s=vod-search-name" method="post" data-action="{:ff_url('vod/search',array('wd'=>'FFWD'), true)}" data-action-news="{:ff_url('news/search',array('wd'=>'FFWD'), true)}">
    <div class="input-group">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
          <span class="title"></span>
          <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
          <li><a href="javascript:;" data-action="{:ff_url('news/search',array('name'=>'FFWD'), true)}">资讯</a></li>
          <li><a href="javascript:;" data-action="{:ff_url('vod/search',array('name'=>'FFWD'), true)}">视频</a></li>
        </ul>
      </div>
      <input type="text" class="form-control ff-wd" name="wd" placeholder="请输入影片名称">
      <div class="input-group-btn">
        <button type="submit" class="btn btn-default btn-success">搜索</button>
      </div>
    </div>   
  </form>
  <dl>
    <dt>热门搜索：</dt>
    <dd><volist name=":ff_mysql_vod('limit:30;cache_name:default;cache_time:default;order:vod_stars desc,vod_hits_lasttime;sort:desc')" id="feifei">
    <a class="btn btn-default btn-sm" href="{:ff_url_vod_play($feifei['list_id'],$feifei['list_dir'],$feifei['vod_id'],$feifei['vod_ename'],1,1)}">{$feifei.vod_name|msubstr=0,15,'utf-8',true}</a>
    </volist></dd>
  </dl>
</div>
<!-- -->
<include file="BlockTheme:footer" />
</body>
</html>