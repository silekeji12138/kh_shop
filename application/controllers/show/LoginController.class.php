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
        $rs_tel=$model->select("select *from sl_member WHERE tel='".$data['tel']."' or `name`='{$data['tel']}'");
        if ($rs_tel){
            $data['password'] = md5($data['password']);
            $rs_password=$model->select("select *from sl_member WHERE password='".$data['password']."'");
            if ($rs_password){
                $_SESSION['username']=$rs_tel[0]['name'];
                $_SESSION['tel']=$rs_tel[0]['tel'];
                $_SESSION['user_id']=$rs_tel[0]['id'];
                //下次是否自动登录
                if (isset($data['remember'])){
                    $id=$rs_tel[0]['id'];
                    $password=md5($rs_tel[0]['password']."cdsile");
                    setcookie('id',$id,time()+7*24*3600,"/");
                    setcookie('password',$password,time()+7*24*3600,"/");
                }
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
        if($model->insert($data)){
            include CUR_VIEW_PATH . "Slogin" . DS ."login_success.html";
        }else{
            $this->jump('index.php?p=show&c=login&a=register',"注册失败，请重试",3);
        }

    }
    //注册成功的页面展示
    public function successAction(){
        $model = new Model('member');

        include CUR_VIEW_PATH . "Slogin" . DS ."login_success.html";
    }

    public function getAction(){
        $num=$_GET['tel'];
        echo $_SESSION[$num];
    }

}