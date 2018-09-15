<!--频道页筛选 -->
<dl class="types">
  <dt class="ff-text hidden-xs">按类型</dt>
  <dd>
    <ul class="list-unstyled row text-center">
      <volist name=":explode(',',$list_extend['type'])" id="feifei" offset="0" length="12">
      <li class="col-xs-3 text-nowrap"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>urlencode($feifei),'area'=>'','year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a></li>
      </volist>
    </ul>
  </dd>
  <dt class="ff-text hidden-xs">按年份</dt>
  <dd class="hidden-xs">
    <ul class="list-unstyled row text-center">
      <volist name=":explode(',',$list_extend['year'])" id="feifei" offset="0" length="11">
      <li class="col-xs-3"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>$feifei,'star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a></li>
      </volist>
      <li class="col-xs-3"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'19902006','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">更早</a></li>
    </ul>
  </dd>
  <dt class="ff-text hidden-xs">按地区</dt>
  <dd class="hidden-xs">
    <ul class="list-unstyled row text-center">
      <volist name=":explode(',',$list_extend['area'])" id="feifei" offset="0" length="12">
      <li class="col-xs-3"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>urlencode($feifei),'year'=>'','star'=>'','state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei}</a></li>
      </volist>
    </ul>
  </dd>
  <!--<notempty name="list_extend.star">
  <dt class="ff-text">按明星</dt>
  <dd>
    <ul class="list-unstyled row">
      <volist name=":explode(',',$list_extend['star'])" id="feifei" offset="0" length="12">
      <li class="col-xs-3"><a href="{:ff_url('vod/type',array('id'=>$list_id,'type'=>'','area'=>'','year'=>'','star'=>urlencode($feifei),'state'=>'','order'=>'addtime','p'=>1),true)}">{$feifei|msubstr=0,4}</a></li>
      </volist>
    </ul>
  </dd>
  </notempty> -->
</dl>