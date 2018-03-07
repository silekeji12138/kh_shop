<?php

/**
 * Created by PhpStorm.
 * User: DELL
 * Date: 2018/3/6
 * Time: 14:26
 */
class CustomController extends BaseController
{
    public function __construct()
    {
        $result = $this->check();
        //失败即未登录，跳转登录
        if ($result === false){
            $this->jump('?c=login&a=custom_login','请先登录',3);
        }
    }
    //用户验证
    private function check(){
        if (!isset($_SESSION['custom_name'])){
            //若session中没有用户信息，在cookie中找是否存在用户id
            if (isset($_COOKIE['custom_id']) && isset($_COOKIE['custom_password'])){
                $id = $_COOKIE['custom_id'];
                $password = $_COOKIE['custom_password'];
                //验证信息
                $result = $this -> checkByCookie($id,$password);
                if ($result === false){
                    return false;
                }
                $_SESSION['custom_name']=$result[0]['username'];
                $_SESSION['name']=$result[0]['nc'];
                $_SESSION['custom_id']=$result[0]['id'];
                $_SESSION['custom_photo']=$result[0]['tx'];
                $_SESSION['login_time']=date("Y-m-d H:i:s",time());
                return true;
            }
            return false;
        }
    }


    //自动登录
    private function checkByCookie($id,$password){
        $model = new Model('kefu');
        $result = $model->select("select *from sl_kefu where id={$id}")[0];
        if (empty($result)){
            $this -> error="该用户不存在";
            return false;
        }
        $password_DB = md5($result['pwd']."cdsile");
        if ($password != $password_DB){
            $this->error="密码错误";
            return false;
        }
        return $result;
    }

    //用户注销功能的方法
    public function logoutAction(){
        if (isset($_COOKIE['custom_id'])){
            setcookie('custom_id',null,time()-3600,"/");
            setcookie('custom_password',null,time()-3600,"/");
        }
        $_SESSION['custom_name']='';
        session_destroy();
        $this->jump('?c=login&a=custom_login','',0);
    }

    //个人中心
    public function personAction(){
        $model = new Model('kefu');
        $uid = $_SESSION['custom_id'];
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            $model->xg($data,"id={$uid}");
            $arr['caozuo'] = '修改个人信息';
            $arr['caozuoren'] = $_SESSION['custom_name'];
            $arr['uid'] = $uid;
            $insert = new Model('kfrz');
            $insert->insert($arr);
        }
        $list = $model->select("select *from sl_kefu WHERE id={$uid}")[0];
        include CUR_VIEW_PATH . "Scustom" . DS ."person.html";
    }

    //上传头像
    public function photoAction(){
        $model = new Model('kefu');
        $uid = $_SESSION['custom_id'];
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $file = $_FILES;
            if ($file['photo']['error']==0){
                $this->library("Upload");
                $upload = new Upload();
                $data['tx'] = $upload->up($_FILES['photo']);
                $_SESSION['custom_photo'] = $data['tx'];
            }
            $model->xg($data,"id={$uid}");
            $arr['caozuo'] = '修改个人信息';
            $arr['caozuoren'] = $_SESSION['custom_name'];
            $arr['uid'] = $uid;
            $insert = new Model('kfrz');
            $insert->insert($arr);
        }
        include CUR_VIEW_PATH . "Scustom" . DS ."photo.html";
    }

    //登录密码
    public function pwdAction(){
        $model = new Model('kefu');
        $uid = $_SESSION['custom_id'];
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            $list = $model->select("select *from sl_kefu WHERE id={$uid}")[0];
            if ($data['old']!=$list['pwd']){
                $this->jump("?c=custom&a=pwd",'旧密码错误',3);
            }
            $model->xg(['pwd'=>$data['pwd']],"id={$uid}");
            $arr['caozuo'] = '修改密码';
            $arr['caozuoren'] = $_SESSION['custom_name'];
            $arr['uid'] = $uid;
            $insert = new Model('kfrz');
            $insert->insert($arr);
            $this->jump("?c=custom&a=logout",'',0);
        }
        include CUR_VIEW_PATH . "Scustom" . DS ."password.html";
    }

    //修改状态
    public function statusAction(){
        $model = new Model('kefu');
        $uid = $_SESSION['custom_id'];
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            $model->xg(['zt'=>$data['zt']],"id={$uid}");
            $_SESSION['status'] = $data['zt'];
        }
        $list = $model->select("select zt from sl_kefu WHERE id={$uid}")[0];
        include CUR_VIEW_PATH . "Scustom" . DS ."status.html";
    }

    public function logAction(){
        $model = new Model('kfrz');
        $uid = $_SESSION['custom_id'];
        $lists = $model->select("select * from sl_kfrz WHERE uid={$uid} ORDER BY dtime DESC ");
        include CUR_VIEW_PATH . "Scustom" . DS ."log.html";
    }
}