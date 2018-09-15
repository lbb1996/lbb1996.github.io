 <?php
class TagAction extends BaseAction{	
	// 显示标签列表
  public function show(){
		//查询参数
		$admin['type'] = !empty($_GET['type'])?$_GET['type']:'';
		$admin['limit'] = !empty($_GET['limit'])?intval($_GET['limit']):20;
		$admin['p'] = !empty($_GET['p'])?intval($_GET['p']):1;
		$limit = ($admin['p']-1)*$admin['limit'].','.$admin['limit'];
		//查询数据
		$rs = D("Tag");
		if($admin['type']){
			$count = $rs->query("select count(1) as count from (select tag_id,tag_list from ".C('db_prefix')."tag group by tag_list,tag_name having tag_list='".$admin['type']."') aa");
			$array = $rs->query("select * from (select tag_id,tag_cid,tag_list,tag_name,count(tag_id) as tag_count from ".C('db_prefix')."tag group by tag_cid,tag_name having tag_list='".$admin['type']."' order by tag_count desc) aa limit ".$limit."");
		}else{
			$count = $rs->query("select count(1) as count from (select tag_id,tag_list from ".C('db_prefix')."tag group by tag_list,tag_name) aa");
			$array = $rs->query("select * from (select tag_id,tag_cid,tag_list,tag_name,count(tag_id) as tag_count from ".C('db_prefix')."tag group by tag_cid,tag_name order by tag_cid asc,tag_count desc) aa limit ".$limit."");
		}
		foreach($array as $key=>$val){
			$array[$key]['tag_url'] = U('Admin-'.admin_ff_taglist2modelname($array[$key]['tag_list']).'/Show',array('tag_name'=>urlencode($array[$key]['tag_name']),'tag_list'=>urlencode($array[$key]['tag_list'])),'',false,true);
		}
		//组合分页
		$count = $count[0]['count'];
		$totalpages = ceil($count/$admin['limit']);
		$currentpage = ff_page_max($admin['p'],$totalpages);
		$pageurl = U('Admin-Tag/Show',array('type'=>$admin['type'],'limit'=>$admin['limit'],'p'=>'FFLINK'),false,false).C('url_html_suffix');
		//定义分页变量
		$admin['pages'] = '共'.$count.'个标签&nbsp;当前:'.$currentpage.'/'.$totalpages.'页&nbsp;'.getpage($currentpage,$totalpages,8,$pageurl,'pagego(\''.$pageurl.'\','.$totalpages.')');
		$this->assign($admin);
		$this->assign('list_tag',$array);
		$this->display('./Public/system/tag_show.html');
		//$rs = new Model() ;
		//$count = $rs->query("select count(1) as count from (select tag_id,tag_list from ".C('db_prefix')."tag where tag_cid=1 group by tag_list,tag_name) aa");
		//$array = $rs->field('*,count(tag_name) as tag_count')->limit($limit)->page($currentpage)->group('tag_list,tag_name')->order('tag_count desc')->select();
  }	
	// 显示标签AJAX方式
  public function showajax(){
		$rs = D("Tag");
		$tag_list = !empty($_GET['sid'])?$_GET['sid']:'vod_tag';
		$array = $rs->query("select * from (select tag_id,tag_cid,tag_list,tag_name,count(tag_id) as tag_count from ".C('db_prefix')."tag group by tag_cid,tag_name having tag_list='".$tag_list."' order by tag_count desc) aa limit 0,10");
		$this->assign('tag_input',trim($_GET['input']));
		$this->assign('tag_list',$array);
		$this->display('./Public/system/tag_ajax.html');
		//$where['tag_list'] = array('eq',$_GET['sid']);
		//$array = $rs->field('*,count(tag_name) as tag_count')->where($where)->limit('15')->group('tag_name,tag_list')->order('tag_count desc')->select();
  }
	// 删除标签
  public function del(){
		$rs = D("Tag");
		$where['tag_name'] = trim($_GET['id']);
		$rs->where($where)->delete();
		$this->success('标签:'.$tag.'删除成功！');
  }									
}
?>