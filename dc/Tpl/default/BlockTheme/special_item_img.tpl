<li class="col-md-2 col-sm-3 col-xs-6">
  <p class="image">
    <a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}">
      <img class="img-responsive img-thumbnail ff-img" data-original="{:ff_url_img($feifei['special_logo'])}" alt="{$feifei.special_name}">
    </a>
  </p>
  <h4 class="text-nowrap ff-text-right">
    <a href="{:ff_url('special/read', array('id'=>$feifei['special_id']), true)}" title="{$feifei.special_name|msubstr=0,10}">{$feifei.special_name}</a>
  </h4>
</li>