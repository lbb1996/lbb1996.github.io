<?php
include 'source/system/db.class.php';
include 'source/admincp/include/function.php';
$frames = array('login', 'index', 'body', 'config', 'config_cache', 'config_upload', 'config_pay', 'config_user', 'skin', 'label', 'tag', 'class', 'music', 'ajax', 'talk', 'special', 'singer', 'video', 'user', 'verify', 'comment', 'feed', 'wall', 'blog', 'photo', 'backup', 'sql', 'cache', 'html', 'html_index', 'html_list', 'html_info', 'update', 'admin', 'link', 'uplog', 'paylog', 'module', 'develop', 'ucenter');
$iframe = !empty($_GET['iframe']) && in_array($_GET['iframe'], $frames) ? $_GET['iframe'] : 'login';
include_once $iframe == 'talk' ? 'source/pack/chat/talk.php' : 'source/admincp/module/'.$iframe.'.php';
?>