<?php
!defined('IN_UC') && exit('Access Denied');

define('UC_ARRAY_SEP_1', 'UC_ARRAY_SEP_1');
define('UC_ARRAY_SEP_2', 'UC_ARRAY_SEP_2');

class miscmodel {
	var $db;
	var $base;
	function __construct(&$base) {
		$this->miscmodel($base);
	}
	function miscmodel(&$base) {
		$this->base = $base;
		$this->db = $base->db;
	}
	function get_apps($col = '*', $where = '') {
		$arr = $this->db->fetch_all("SELECT $col FROM ".UC_DBTABLEPRE."applications".($where ? ' WHERE '.$where : ''));
		return $arr;
	}
	function delete_apps($appids) {
	}
	function update_app($appid, $name, $url, $authkey, $charset, $dbcharset) {
	}
	function alter_app_table($appid, $operation = 'ADD') {
	}
	function get_host_by_url($url) {
	}
	function check_url($url) {
	}
	function check_ip($url) {
	}
	function test_api($url, $ip = '') {
	}
	function dfopen($url, $limit = 0, $post = '', $cookie = '', $bysocket = FALSE, $ip = '', $timeout = 15, $block = TRUE) {
	}
	function array2string($arr) {
		$s = $sep = '';
		if($arr && is_array($arr)) {
			foreach($arr as $k=>$v) {
				$s .= $sep.$k.UC_ARRAY_SEP_1.$v;
				$sep = UC_ARRAY_SEP_2;
			}
		}
		return $s;
	}
	function string2array($s) {
		$arr = explode(UC_ARRAY_SEP_2, $s);
		$arr2 = array();
		foreach($arr as $k=>$v) {
			list($key, $val) = explode(UC_ARRAY_SEP_1, $v);
			$arr2[$key] = $val;
		}
		return $arr2;
	}
}
?>