<!DOCTYPE html>
<html lang="zh-cn">
<head>
<include file="BlockBase:header_meta" />
<include file="BlockSeo:vod_list" />
</head>
<body class="vod-channel">
<include file="BlockTheme:header" />
<div class="container ff-bg">
  <div class="row ff-row">
    <div class="col-md-8 ff-col ff-slide-pic">
      <include file="Slide:channel" />
    </div>
    <div class="col-md-4 ff-col">
      <include file="BlockTheme:vod_channel_types" />
    </div>
  </div>
</div>
<div class="clearfix ff-clearfix"></div> 
<volist name=":explode(',',$list_extend['type'])" id="feifeilist" offset="0" length="8">
<php>$item_vod=ff_mysql_vod('cid:'.$list_id.';tag_name:'.$feifeilist.';tag_list:vod_type;limit:24;cache_name:default;cache_time:default;order:vod_stars desc,vod_addtime;sort:desc');if(!$item_vod){continue;}</php>
<div class="container ff-bg">
  <div class="page-header">
    <h2>
    <span class="glyphicon glyphicon-film ff-text"></span>
    {$feifeilist}
    <span class="pull-right"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifeilist),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}" class="btn btn-success btn-xs">更多</a></span>
    </h2>
  </div>
  <ul class="list-unstyled vod-item-img ff-img-90">
    <volist name="item_vod" id="feifei">
    <include file="BlockTheme:vod_item_img_sp" />
    </volist>
  </ul>
</div>
<div class="clearfix ff-clearfix"></div> 
</volist>
<!-- -->
<div class="container ff-bg">
<include file="BlockTheme:footer" />
</div>
</body>
</html>