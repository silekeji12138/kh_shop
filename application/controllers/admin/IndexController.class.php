<?php
//后台首页控制器
class IndexController extends BaseController {
	//生成验证码
	public function codeAction(){
		//载入验证码类
		$this->library('Captcha');
		$c = new Captcha();
		$c->generateCode();
	}
	public function indexAction(){
	    
	    //如果是村管理员1
	    if($_SESSION['admin']['zuming']=="村管理员")
	    {
	        $adminModel = new AdminModel('admin');
	        $user = $adminModel->selectByPk($_SESSION['admin']['user_id']);
	         
	    }
	    

	    include CUR_VIEW_PATH . "index.html";
	}
	public function topAction(){
		include CUR_VIEW_PATH . "top.html";
	}
	public function menuAction(){
		include CUR_VIEW_PATH . "menu.html";
	}
	public function dragAction(){
		include CUR_VIEW_PATH . "drag.html";
	}
	public function mainAction(){
		//实例化模型
		$adminModel = new AdminModel('admin');
		$admins = $adminModel->getAdmins();
		// echo "<pre>";
		// var_dump($admins);
		include CUR_VIEW_PATH . "main.html";
	}
	
	//ajax接口
	public function apiAction(){
	    $type=$_GET["type"];
	    header('Content-Type:application/json; charset=utf-8');
	    $temp_str='';
	    if($type=="getLiandongHtml")
	    {
	        $classid=$_GET["classid"];
	        //filedName
	        $filedName=$_GET["filedName"];
	        if($classid!="")
	        {
	            $temp_str=$this->$type($classid,$filedName);
	            echo $temp_str;
	        }
	        else 
	        {
	            echo "";
	        }
	        
	    }
	    
	}
}