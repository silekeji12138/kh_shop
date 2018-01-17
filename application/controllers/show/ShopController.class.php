<?php

/**
 * Created by PhpStorm.
 * User: DELL
 * Date: 2018/1/9
 * Time: 17:01
 */
class ShopController extends BaseController
{
    public function __construct()
    {

        $result = $this->check();
        //失败即未登录，跳转登录
        if ($result === false){
            $this->jump('index.php?p=show&c=login&a=login','请先登录',3);
        }
    }
    //用户验证
    private function check(){
        if (!isset($_SESSION['tel'])){
            //若session中没有用户信息，在cookie中找是否存在用户id
            if (isset($_COOKIE['id']) && isset($_COOKIE['password'])){
                $id = $_COOKIE['id'];
                $password = $_COOKIE['password'];
                //验证信息
                $result = $this -> checkByCookie($id,$password);
                if ($result === false){
                    return false;
                }
                $_SESSION['username']=$result['name'];
                $_SESSION['tel']=$result['tel'];
                $_SESSION['user_id']=$result['id'];
                return true;
            }
            return false;
        }
    }

    //自动登录
    private function checkByCookie($id,$password){
        $model = new Model('member');
        $result = $model->select("select *from member where id={$id}")[0];
        if (empty($result)){
            $this -> error="该用户不存在";
            return false;
        }
        $password_DB = md5($result['password']."cdsile");
        if ($password != $password_DB){
            $this->error="密码错误";
            return false;
        }
        return $result;
    }
    /**
     * 卖家
     */
    //要出售淘宝店
    public function taobaoAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $model = new Model('shangpin');
            $data = $_POST;
            $data['uid'] = $_SESSION['admin']['user_id'];
            $data['szpt'] = "淘宝网店";
            $data['wgkf'] = $data['yb']."-".$data['yz']."-".$data['wg'];
            $data['zj'] = $data['sfz']."-".$data['scsfz']."-".$data['hkb']."-".$data['schkb'];
            if($model->insert($data)){
                return $this->jump('index.php?p=show&c=shop&a=taobao','提交成功',3);
            }else{
                return $this->jump('index.php?p=show&c=shop&a=taobao','提交失败',3);
            }

        }
        include CUR_VIEW_PATH . "Sshop" . DS ."taobao.html";
    }

    //出售天猫
    public function tianmaoAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $model = new Model('shangpin');
            $data = $_POST;
            $data['uid'] = $_SESSION['admin']['user_id'];
            $data['szpt'] = "天猫商城";
            $data['wgkf'] = $data['yb']."-".$data['yz']."-".$data['wg'];
            $data['zj'] = $data['sfz']."-".$data['scsfz']."-".$data['hkb']."-".$data['schkb'];
            if($model->insert($data)){
                return $this->jump('index.php?p=show&c=shop&a=tianmao','提交成功',3);
            }else{
                return $this->jump('index.php?p=show&c=shop&a=tianmao','提交失败',3);
            }

        }
        include CUR_VIEW_PATH . "Sshop" . DS ."tianmao.html";
    }

    //出售的网店
    public function shopSaleAction(){
        $model = new Model('sale');
        $uid = $_SESSION['user_id'];
        $lists = $model->select("select *from sl_sale WHERE uid={$uid} ORDER BY dtime DESC");
        include CUR_VIEW_PATH . "Sshop" . DS ."shop_sale.html";
    }

    /**
     * 买家
     */
    //购买的网店
    public function buyAction(){
        $model = new Model('buy');
        $uid = $_SESSION['user_id'];
        $lists = $model->select("select *from sl_buy WHERE uid={$uid} ORDER BY dtime DESC");
        include CUR_VIEW_PATH . "Sshop" . DS ."buy.html";
    }


    //收藏的网店
    public function saveAction(){
        $model = new Model('save');
        $uid = $_SESSION['user_id'];
        $lists = $model->select("select *from sl_save WHERE uid={$uid} ORDER BY dtime DESC");
        include CUR_VIEW_PATH . "Sshop" . DS ."save.html";
    }

    //竞拍的网店
    public function auctionAction(){
        $model = new Model('auction');
        $uid = $_SESSION['user_id'];
        $lists = $model->select("select *from sl_auction WHERE uid={$uid} ORDER BY dtime DESC");
        include CUR_VIEW_PATH . "Sshop" . DS ."auction.html";
    }

    //店铺升级
    public function upgradeAction(){
        $model = new Model('service');
        $uid = $_SESSION['user_id'];
        $lists = $model->select("select *from sl_service WHERE uid={$uid} and sort_id=78 ORDER BY dtime DESC");
        include CUR_VIEW_PATH . "Sshop" . DS ."upgrade.html";
    }

    public function agentAction(){
        $model = new Model('service');
        $uid = $_SESSION['user_id'];
        $lists = $model->select("select *from sl_service WHERE uid={$uid} and sort_id=79 ORDER BY dtime DESC ");
        include CUR_VIEW_PATH . "Sshop" . DS ."agent.html";
    }

    public function replaceAction(){
        $model = new Model('service');
        $uid = $_SESSION['user_id'];
        $lists = $model->select("select *from sl_service WHERE uid={$uid} and sort_id=80 ORDER BY dtime DESC ");
        include CUR_VIEW_PATH . "Sshop" . DS ."replace.html";
    }

    /**
     * 删除记录  通用
     * param $model  表明
     * param $id     id
     */
    public function delAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        $table = $_GET['model'];
        $model = new Model("$table");
        if ($request=='POST'){
            $ids = $_POST['ids'];
        }else{
            $ids = $_GET['id'];
        }
        if($model->delete($ids)){
            return $this->jump($_SERVER['HTTP_REFERER'],'删除成功',3);
        }else{
            return $this->jump($_SERVER['HTTP_REFERER'],'删除失败',3);
        }
    }


}