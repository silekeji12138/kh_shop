<?php
//核心启动类
class Framework {
	//定义一个run方法
	public static function run(){
		self::init();
		self::autoload();
		self::dispatch();
	}

	//初始化方法
	private static function init(){
		//定义路径常量
		define("DS", DIRECTORY_SEPARATOR);
		define("ROOT", getcwd() . DS ); //根目录
		define("APP_PATH", ROOT . 'application' . DS);
		define("FRAMEWORK_PATH", ROOT . "framework" .DS);
		define("PUBLIC_PATH", ROOT . "public" .DS);
		define("CONFIG_PATH", APP_PATH . "config" .DS);
		define("CONTROLLER_PATH", APP_PATH . "controllers" .DS);
		define("MODEL_PATH", APP_PATH . "models" .DS);
		define("VIEW_PATH", APP_PATH . "views" .DS);
		define("CORE_PATH", FRAMEWORK_PATH . "core" .DS);
		define("DB_PATH", FRAMEWORK_PATH . "databases" .DS);
		define("LIB_PATH", FRAMEWORK_PATH . "libraries" .DS);
		define("HELPER_PATH", FRAMEWORK_PATH . "helpers" .DS);
		define("UPLOAD_PATH", PUBLIC_PATH . "uploads" .DS);
		//获取参数p、c、a,index.php?p=admin&c=goods&a=add GoodsController中的addAction
		define('PLATFORM',isset($_GET['p']) ?  $_GET['p'] : "home");
		define('CONTROLLER',isset($_GET['c']) ?  ucfirst($_GET['c']) : "Index");
		define('ACTION',isset($_GET['a']) ?  $_GET['a'] : "index");
		//设置当前控制器和视图目录 CUR-- current
		define("CUR_CONTROLLER_PATH", CONTROLLER_PATH . PLATFORM . DS);
		define("CUR_VIEW_PATH", VIEW_PATH . PLATFORM . DS);

		//载入配置文件
		$GLOBALS['config'] = include CONFIG_PATH . "config.php";
		$GLOBALS['config_cache'] = include CONFIG_PATH . "config.cache.php";
		
		//检查文件是否完整
	   if(!is_file(CUR_CONTROLLER_PATH."IndexController.class.php"))
	    {
	        copy(CUR_CONTROLLER_PATH.'bakController.txt',CUR_CONTROLLER_PATH."IndexController.class.php");
	        
	    }

		//载入核心类
		include CORE_PATH . "Controller.class.php";
		include CORE_PATH . "Model.class.php";
		include DB_PATH . "Mysql.class.php";

        include LIB_PATH . "Common.class.php";
       // include LIB_PATH . "Page.class.php";
        //include LIB_PATH . "Upload.class.php";
        
		//开启session
		session_start();
	}	

	//路由方法,说白了，就是实例化对象并调用方法
	//index.php?p=admin&c=goods&a=add GoodsController中的addAction
	private static function dispatch(){
		//获取控制器名称
		$controller_name = CONTROLLER . "Controller";
		//获取方法名
		$action_name = ACTION . "Action";
		//实例化控制器对象
		$controller = new $controller_name();
		//调用方法
		$controller->$action_name();
	}

	//注册为自动加载
	private static function autoload(){
		// $arr = array(__CLASS__,'load');
		spl_autoload_register('self::load');
	}

	//自动加载功能,此处我们只实现控制器和数据库模型的自动加载
	//如GoodsController、 GoodsModel
	private static function load($classname){
		if (substr($classname, -10) == 'Controller') {
			//载入控制器
			include CUR_CONTROLLER_PATH . "{$classname}.class.php";
		} elseif (substr($classname, -5) == 'Model') {
			//载入数据库模型 
			include MODEL_PATH . "{$classname}.class.php";
		} else {
			//暂略
		}
	}
	
	//寻找后台控制器，如果找不到就复制一个出来
	private  function checkfile(){
	    if(!is_file(CUR_CONTROLLER_PATH."IndexController.class.php"))
	    {
	        copy(CUR_CONTROLLER_PATH.'bakController.class.php',CUR_CONTROLLER_PATH."IndexController.class.php");
	        
	    }
	    
	}
	

}
