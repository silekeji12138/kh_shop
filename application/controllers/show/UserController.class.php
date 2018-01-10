<?php
// 文章模型控制器
class UserController extends BaseController
{
     public function __construct()
     {
         if (!$_SESSION['username']){
             $this->jump('index.php?p=show&c=login&a=login','请先登录',3);
         }
     }


    //会员的个人中心
    public function indexAction(){
        include CUR_VIEW_PATH . "Suser" . DS ."user_index.html";
    }

    //用户注销功能的方法
    public function loginoutAction(){
        $_SESSION['username']='';
        session_destroy();
        $this->jump('index.php?p=show&c=login&a=login','',0);
    }
    
}