<?php
/* @name Api资源共享插件 
 * @支持IP授权，支持缓存
 * http://www.xxxx.com/index.php?s=plus-api-json-vodids-12,13,14-cid-8-limit-20-wd-刘德华-h-24-p-22-play-qvod-inputer-admin
 * 2016.11.28 
 * qq:271513820
 */
class ApiAction extends HomeAction{
	
	//判断IP是否合法
	public function _initialize(){
		if(C('collect_ips')){
			if( !in_array(get_client_ip(), explode(',', C('collect_ips'))) ){
				exit( json_encode( array('status'=>501, 'data'=>'IP未授权') ) );
			}
		}
  }

	//json接口
	public function json(){
		//默认定义
		$params = array();
		$params['field'] = 'list_name,vod_id,vod_cid,vod_name,vod_title,vod_type,vod_keywords,vod_actor,vod_director,vod_content,vod_pic,vod_area,vod_language,vod_year,vod_addtime,vod_filmtime,vod_server,vod_play,vod_url,vod_inputer,vod_reurl,vod_length,vod_weekday,vod_copyright,vod_state,vod_version,vod_tv,vod_total,vod_continu,vod_status,vod_stars,vod_hits,vod_isend,vod_douban_id,vod_series';
		//获取地址栏参数
		$params['cid'] = intval($_GET['cid']);
		$params['h'] = intval($_GET['h']);
		$params['play'] = htmlspecialchars($_GET['play']);
		$params['inputer'] = htmlspecialchars($_GET['inputer']);
		$params['vodids'] = htmlspecialchars($_GET['vodids']);
		$params['wd'] = htmlspecialchars($_GET['wd']);
		$params['limit'] = !empty($_GET['limit'])?intval($_GET['limit']):30;
		if($params['limit'] > 100){
			$params['limit'] = 100;
		}
		if($_GET['action'] == 'all'){
			$params['order'] = 'vod_addtime asc,vod_id asc';
		}else{
			$params['order'] = 'vod_addtime desc,vod_id desc';
		}		
		//查询条件
		$where = array();
		$where['vod_status'] = 1;
		//影片ids
		if($params['vodids']){
			$where['vod_id'] = array('in',$params['vodids']);
		}
		//影片分类
		if($params['cid']){
			$where['vod_cid'] = array('in', ff_list_ids($params['cid']));
		}else{
			$where['vod_cid'] = array('gt',0);
		}
		//影片编辑(资源站入库标识)
		if($params['inputer']){
			$where['vod_inputer'] = array('eq',$params['inputer']);
		}	
		//播放器组
		if($params['play']){
			$where['vod_play'] = array('like','%'.$params['play'].'%');
		}
		//影片时间
		if($params['h']){
			if($params['h'] == 24){
				$time = ff_linux_time(1);
			}elseif($params['h'] == 98){
				$time = ff_linux_time(7);
			}else{
				$time = time()-$params['h']*60*60;
			}
			$where['vod_addtime'] = array('gt', $time);
		}
		//影片搜索
		if($params['wd']){
			$wd = urldecode($params['wd']);
			$search = array();
			$search['vod_name'] = array('like','%'.$wd.'%');
			$search['vod_actor'] = array('like','%'.$wd.'%');
			$search['vod_director'] = array('like','%'.$wd.'%');
			$search['_logic'] = 'or';
			$where['_complex'] = $search;
		}
		// 分页参数
		$params['page_is']= true;
		$params['page_id']= 'ffapi';
		$params['page_p']= !empty($_GET['p'])?intval($_GET['p']):1;
		// 缓存参数
		$params['cache_name'] = md5(C('cache_foreach_prefix').'_'.implode('_',$params));
		$params['cache_time']= intval(C('cache_foreach'));
		// 拼装data 根据查询条件查询数据库
		$array_data = D('VodView')->ff_select_page($params, $where);
		foreach($array_data as $key=>$val){
			$array_data[$key]['vod_pic'] = ff_url_img($array_data[$key]['vod_pic'], $array_data[$key]['vod_content']);
			$array_data[$key]['vod_addtime'] = date('Y-m-d H:i:s', $array_data[$key]['vod_addtime']);
			if($params['play']){
				$array_data[$key]['vod_url'] = $this->json_url($val['vod_play'], $val['vod_url'], $params['play']);
				$array_data[$key]['vod_play'] = trim($params['play']);
			}
		}
		// 拼装page
		$page = $_GET['ff_page_ffapi'];
		$array_page = array('pageindex'=>$page['currentpage'], 'pagecount'=>$page['totalpages'], 'pagesize'=>$params['limit'], 'recordcount'=>$page['records']);
		// 拼装list
		$params = array();
		$params['field'] = 'list_id,list_name';
		$params['limit'] = false;
		$params['order'] = 'list_id asc,list_oid';
		$params['cache_name'] = C('cache_foreach_prefix').'_ffapi_list';
		$params['cache_time']= intval(C('cache_foreach'));
		$array_list = D("List")->ff_select_page($params,'list_sid=1 and list_status=1');
		echo json_encode(array('status'=>200,'page'=>$array_page, 'list'=>$array_list, 'data'=>$array_data));
  }
	public function json_url($vod_play, $vod_url, $url_play){
		$array_play = explode('$$$',$vod_play);
		$key = array_search(trim($url_play),$array_play);
		$array_url = explode('$$$',$vod_url);
		return $array_url[$key];
	}
	
	//分享用户接口
	public function user(){
		//默认定义
		$params = array();
		$params['field'] = 'user_id,user_name,user_face';
		$params['limit'] = 100;
		$params['h'] = intval($_GET['h']);
		//查询条件
		$where = array();
		$where['user_status'] = 1;
		if($params['h']){
			if($params['h'] == 24){
				$time = ff_linux_time(1);
			}elseif($params['h'] == 98){
				$time = ff_linux_time(7);
			}else{
				$time = time()-$params['h']*60*60;
			}
			$where['user_jointime'] = array('gt', $time);
		}
		// 分页参数
		$params['page_is']= true;
		$params['page_id']= 'ffapi';
		$params['page_p']= !empty($_GET['p'])?intval($_GET['p']):1;
		// 缓存参数
		$params['cache_name'] = md5(C('cache_foreach_prefix').'_'.implode('_',$params));
		$params['cache_time']= intval(C('cache_foreach'));
		// 拼装data 根据查询条件查询数据库
		$array_data = D('User')->ff_select_page($params, $where);
		// 拼装page
		$page = $_GET['ff_page_ffapi'];
		$array_page = array('pageindex'=>$page['currentpage'], 'pagecount'=>$page['totalpages'], 'pagesize'=>$params['limit'], 'recordcount'=>$page['records']);
		echo json_encode(array('status'=>200,'page'=>$array_page, 'data'=>$array_data));
	}
	
	//分享评论接口
	public function forum(){
		//默认定义
		$params = array();
		$params['field'] = 'forum_id,forum_title,forum_content,forum_up,forum_down,forum_referer,vod_name,vod_reurl';
		$params['order'] = 'forum_addtime';
		$params['sort'] = 'desc';
		$params['limit'] = 30;
		$params['h'] = intval($_GET['h']);
		//查询条件
		$where = array();
		//$where['forum_status'] = 1;
		if($params['h']){
			if($params['h'] == 24){
				$time = ff_linux_time(1);
			}elseif($params['h'] == 98){
				$time = ff_linux_time(7);
			}else{
				$time = time()-$params['h']*60*60;
			}
			$where['forum_addtime'] = array('gt', $time);
		}
		// 分页参数
		$params['page_is']= true;
		$params['page_id']= 'ffapi';
		$params['page_p']= !empty($_GET['p'])?intval($_GET['p']):1;
		// 缓存参数
		$params['cache_name'] = md5(C('cache_foreach_prefix').'_'.implode('_',$params));
		$params['cache_time']= intval(C('cache_foreach'));
		// 关联条件
		$viewFields = array (
			'Forum'=>array('forum_id','forum_title','forum_content','forum_up','forum_down','forum_referer'),
			'Vod'=>array('vod_name','vod_reurl','_on'=>'Forum.forum_cid = Vod.vod_id'),
		);
		// 拼装data 根据查询条件查询数据库
		$array_data = D('ForumView')->ff_select_page($params, $where, $viewFields);
		// 拼装page
		$page = $_GET['ff_page_ffapi'];
		$array_page = array('pageindex'=>$page['currentpage'], 'pagecount'=>$page['totalpages'], 'pagesize'=>$params['limit'], 'recordcount'=>$page['records']);
		echo json_encode(array('status'=>200,'page'=>$array_page, 'data'=>$array_data));
	}
	
	//分享剧情接口
	public function scenario(){
		//默认定义
		$params = array();
		$params['field'] = 'vod_id,vod_name,vod_reurl,vod_scenario';
		$params['order'] = 'vod_addtime';
		$params['sort'] = 'desc';
		$params['limit'] = 30;
		$params['h'] = intval($_GET['h']);
		//查询条件
		$where = array();
		$where['vod_status'] = 1;
		$where['vod_scenario'] = array('neq','');
		if($params['h']){
			if($params['h'] == 24){
				$time = ff_linux_time(1);
			}elseif($params['h'] == 98){
				$time = ff_linux_time(7);
			}else{
				$time = time()-$params['h']*60*60;
			}
			$where['vod_addtime'] = array('gt', $time);
		}
		// 分页参数
		$params['page_is']= true;
		$params['page_id']= 'ffapi';
		$params['page_p']= !empty($_GET['p'])?intval($_GET['p']):1;
		// 缓存参数
		$params['cache_name'] = md5(C('cache_foreach_prefix').'_'.implode('_',$params));
		$params['cache_time']= intval(C('cache_foreach'));
		// 拼装data 根据查询条件查询数据库
		$array_data = D('Vod')->ff_select_page($params, $where);
		foreach($array_data as $key=>$val){
			$array_data[$key]['vod_scenario'] = json_decode($array_data[$key]['vod_scenario'],true);
		}
		// 拼装page
		$page = $_GET['ff_page_ffapi'];
		$array_page = array('pageindex'=>$page['currentpage'], 'pagecount'=>$page['totalpages'], 'pagesize'=>$params['limit'], 'recordcount'=>$page['records']);
		echo json_encode(array('status'=>200,'page'=>$array_page, 'data'=>$array_data));
	}
	
	public function news(){
		//默认定义
		$params = array();
		$params['field'] = 'list_name,news_id,news_cid,news_name,news_ename,news_type,news_keywords,news_pic,news_pic_bg,news_pic_slide,news_inputer,news_reurl,news_remark,news_content,news_hits,news_stars,news_up,news_down,news_jumpurl,news_letter,news_gold,news_golder,news_addtime';
		//获取地址栏参数
		$params['ids'] = htmlspecialchars($_GET['ids']);
		$params['cid'] = intval($_GET['cid']);
		$params['h'] = intval($_GET['h']);
		$params['inputer'] = htmlspecialchars($_GET['inputer']);
		$params['wd'] = htmlspecialchars($_GET['wd']);
		$params['limit'] = !empty($_GET['limit'])?intval($_GET['limit']):30;
		//分页限制
		if($params['limit'] > 100){
			$params['limit'] = 100;
		}
		//采集全部
		if($_GET['action'] == 'all'){
			$params['order'] = 'news_addtime asc,news_id asc';
		}else{
			$params['order'] = 'news_addtime desc,news_id desc';
		}		
		//查询条件
		$where = array();
		$where['news_status'] = 1;
		//影片ids
		if($params['ids']){
			$where['news_id'] = array('in',$params['ids']);
		}
		//影片分类
		if($params['cid']){
			$where['news_cid'] = array('in', ff_list_ids($params['cid']));
		}else{
			$where['news_cid'] = array('gt', 0);
		}
		//影片时间
		if($params['h']){
			if($params['h'] == 24){
				$time = ff_linux_time(1);
			}elseif($params['h'] == 98){
				$time = ff_linux_time(7);
			}else{
				$time = time()-$params['h']*60*60;
			}
			$where['news_addtime'] = array('gt', $time);
		}
		//影片编辑(资源站入库标识)
		if($params['inputer']){
			$where['news_inputer'] = array('eq',$params['inputer']);
		}		
		//影片搜索
		if($params['wd']){
			$where['news_name'] = array('like','%'.urldecode($params['wd']).'%');
		}
		// 分页参数
		$params['page_is']= true;
		$params['page_id']= 'ffapi';
		$params['page_p']= !empty($_GET['p'])?intval($_GET['p']):1;
		// 缓存参数
		$params['cache_name'] = md5(C('cache_foreach_prefix').'_'.implode('_',$params));
		$params['cache_time']= intval(C('cache_foreach'));
		// 拼装data 根据查询条件查询数据库
		$array_data = D('NewsView')->ff_select_page($params, $where);
		foreach($array_data as $key=>$val){
			$array_data[$key]['news_pic'] = ff_url_img($array_data[$key]['news_pic'], $array_data[$key]['news_content']);
			$array_data[$key]['news_addtime'] = date('Y-m-d H:i:s', $array_data[$key]['news_addtime']);
		}
		// 拼装page
		$page = $_GET['ff_page_ffapi'];
		$array_page = array('pageindex'=>$page['currentpage'], 'pagecount'=>$page['totalpages'], 'pagesize'=>$params['limit'], 'recordcount'=>$page['records']);
		// 拼装list
		$params = array();
		$params['field'] = 'list_id,list_name';
		$params['limit'] = false;
		$params['order'] = 'list_id asc,list_oid';
		$params['cache_name'] = C('cache_foreach_prefix').'_ffapi_news';
		$params['cache_time']= intval(C('cache_foreach'));
		$array_list = D("List")->ff_select_page($params,'list_sid=2 and list_status=1');
		echo json_encode(array('status'=>200,'page'=>$array_page, 'list'=>$array_list, 'data'=>$array_data));
  }
}
?>