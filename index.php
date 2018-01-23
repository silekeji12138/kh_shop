<?php
//入口文件
//引入核心启动类
include "framework/core/Framework.class.php";
session_start();
// $app = new Framework();
// $app->run();
Framework::run();
// echo getcwd();


