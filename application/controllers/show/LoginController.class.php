<?php
// 文章模型控制器
class LoginController extends BaseController
{

    //注册显示页面
    public function registerAction(){
        include CUR_VIEW_PATH . "Slogin" . DS ."login_register.html";
    }
    //登录显示页面
    public function loginAction(){
        include CUR_VIEW_PATH . "Slogin" . DS ."login_login.html";
}

    public function login1Action(){
        $data=$_POST;
        $model=new model('member');
        $rs_tel=$model->select("select *from sl_member WHERE tel='".$data['tel']."'");
        if ($rs_tel){
            $rs_password=$model->select("select *from sl_member WHERE password='".$data['password']."'");
            if ($rs_password){
                $_SESSION['username']=$rs_tel[0]['name'];
                $_SESSION['tel']=$rs_tel[0]['tel'];
                $this->jump('index.php?p=show&c=user&a=index','',0);
            }else{
                $this->jump('index.php?p=show&c=login&a=login','密码错误',3);
            }
        }else{
            $this->jump('index.php?p=show&c=login&a=login',"用户名不存在",3);
        }
    }

  //用户注册的功能
    public function zhuceAction(){
        $data=$_POST;
        $model=new model('member');
        $model->insert($data);
        $this->jump('index.php?p=show&c=login&a=success&name='.$data['name'],'',0);
    }
    //注册成功的页面展示
    public function successAction(){
        include CUR_VIEW_PATH . "Slogin" . DS ."login_success.html";
    }

    public function getAction(){
        $num=$_GET['tel'];
        echo $_SESSION[$num];
    }

}