<div class="clearfix"></div>
<div class="row ff-footer">
	<div class="col-md-2 text-muted text-center hidden-xs hidden-sm">
		<img class="img-thumbnail" src="{$public_path}images/qrcode/weixin.jpg"><br />微信公众号
	</div>
  <div class="col-md-8 col-xs-12 text-center">
    <p class="text-nowrap">{$site_description}</p>
    <p class="text-nowrap">{$site_copyright}</p>
    <p class="text-nowrap">
      <a href="{:ff_url('map/show',array('id'=>'rss','limit'=>100,'p'=>1),true)}" target="_blank">rss</a>
      <a href="{:ff_url('map/show',array('id'=>'baidu','limit'=>100,'p'=>1),true)}" target="_blank">baidu</a>
			<a href="{:ff_url('map/show',array('id'=>'sogou','limit'=>100,'p'=>1),true)}" target="_blank">sogou</a>
			<a href="{:ff_url('map/show',array('id'=>'360','limit'=>100,'p'=>1),true)}" target="_blank">360</a>
			<a href="{:ff_url('map/show',array('id'=>'bing','limit'=>100,'p'=>1),true)}" target="_blank">bing</a>
      <a href="{:ff_url('map/show',array('id'=>'google','limit'=>100,'p'=>1),true)}" target="_blank">google</a>
      <a href="{:ff_url('forum/guestbook', array('p'=>1), true)}">网站留言</a>
      <a href="http://www.feifeicms.com/" target="_blank">feifeicms {%feifeicms_version}</a>
      {$site_icp}
    </p>
  </div>
	<div class="col-md-2 text-muted text-center hidden-xs hidden-sm">
		<img class="img-thumbnail" src="{$public_path}images/qrcode/wap.jpg"><br />手机访问
	</div>
	<span class="tj">{$site_tongji}</span>
</div>