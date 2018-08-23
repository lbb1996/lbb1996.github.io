<?php
!defined('IN_UC') && exit('Access Denied');

class friendcontrol extends base {
	function __construct() {
		$this->friendcontrol();
	}
	function friendcontrol() {
		parent::__construct();
		$this->load('friend');
	}
	function ondelete($arr) {
		@extract($arr, EXTR_SKIP);
		$id = $_ENV['friend']->delete($uid, $friendids);
		return $id;
	}
	function onadd($arr) {
		@extract($arr, EXTR_SKIP);
		$id = $_ENV['friend']->add($uid, $friendid, $comment);
		return $id;
	}
	function ontotalnum($arr) {
		@extract($arr, EXTR_SKIP);
		$totalnum = $_ENV['friend']->get_totalnum_by_uid($uid, $direction);
		return $totalnum;
	}
	function onls($arr) {
		@extract($arr, EXTR_SKIP);
		$totalnum = $totalnum ? $totalnum : $_ENV['friend']->get_totalnum_by_uid($uid);
		$data = $_ENV['friend']->get_list($uid, $page, $pagesize, $totalnum, $direction);
		return $data;
	}
}
?>