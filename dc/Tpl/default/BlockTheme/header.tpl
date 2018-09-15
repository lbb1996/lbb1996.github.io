<nav class="navbar navbar-inverse" role="navigation" data-dir="#nav-{$list_dir}">
  <div class="container">
  	<div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-feifeicms">
        <span class="glyphicon glyphicon-align-justify"></span>
      </button>      
      <gt name="site_user_id" value="0">
    		<a class="navbar-toggle btn" href="{:ff_url('user/center')}">
          <span class="glyphicon glyphicon-user"></span>
        </a>
      <else/>
      	<a class="navbar-toggle btn ff-user user-login-modal" href="{:ff_url('user/login')}" data-href="{:ff_url('user/center')}">
          <span class="glyphicon glyphicon-user"></span>
        </a>
      </gt>
      <a class="navbar-toggle btn" href="{:ff_url('ajax/search')}">
        <span class="glyphicon glyphicon-search"></span>
      </a>
			<neq name="model" value="index">
    		<a class="navbar-toggle btn ff-goback" href="javascript:;"><span class="glyphicon glyphicon-chevron-left"></span></a>
      </neq>
      <a class="navbar-brand" href="{$root}">{$site_name}</a>
    </div>
    <div class="collapse navbar-collapse" id="navbar-feifeicms">
    	<include file="BlockBase:nav_default" />
      <div class="visible-md visible-lg">
      	<include file="BlockBase:search_user" />
      </div>
    </div>
  </div><!-- /.container -->
</nav><!-- /.navbar -->