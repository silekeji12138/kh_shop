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
            $data['uid'] = $_SESSION['user_id'];
            $data['szpt'] = "淘宝网店";
            $data['xszt'] = "未售";
            $data['shzt'] = "待审核";
            $data['jyzt'] = "等待出售";
            $data['wgkf'] = $data['yb']."-".$data['yz']."-".$data['wg'];
            $data['zj'] = implode('-',$data['zj']);
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
            $data['uid'] = $_SESSION['user_id'];
            $data['szpt'] = "天猫商城";
            $data['xszt'] = "未售";
            $data['shzt'] = "待审核";
            $data['jyzt'] = "等待出售";
            $data['wgkf'] = $data['yb']."-".$data['yz']."-".$data['wg'];
            $data['zj'] = implode('-',$data['zj']);
            if($model->insert($data)){
                return $this->jump('index.php?p=show&c=shop&a=tianmao','提交成功',3);
            }else{
                return $this->jump('index.php?p=show&c=shop&a=tianmao','提交失败',3);
            }

        }
        include CUR_VIEW_PATH . "Sshop" . DS ."tianmao.html";
    }

    //出售其他网店
    public function otherAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        $model = new Model('shangpin');
        if ($request=='POST'){
            $data = $_POST;
            $data['uid'] = $_SESSION['user_id'];
            $data['zj'] = implode('-',$data['zj']);
            $data['xszt'] = "未售";
            $data['shzt'] = "待审核";
            $data['jyzt'] = "等待出售";
            $data['xbj'] = $data['jiage']*0.2;
//            var_dump($data);die;
            if($model->insert($data)){
                return $this->jump('index.php?p=show&c=shop&a=other','提交成功',3);
            }else{
                return $this->jump('index.php?p=show&c=shop&a=other','提交失败',3);
            }

        }
        //所属行业
        $hy = $model->select("select u1 from sl_canshu  where classid=267 order by id desc");

        include CUR_VIEW_PATH . "Sshop" . DS ."other.html";
    }

    //出售的网店
    public function shopSaleAction(){
        $model = new Model('shangpin');
        $uid = $_SESSION['user_id'];
        $lists = $model->select("select *from sl_shangpin WHERE uid={$uid} ORDER BY dtime DESC");
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

    //收藏网店
    public function collectionAction(){
        $goods_id = $_GET['id'];
        $type = $_GET['type'];
        $uid = $_SESSION['user_id'];
        $model = new Model('save');
        if ($type==1){
            $list = $model->select("select *from sl_shangpin WHERE id = {$goods_id}")[0];
        }else{
            $list = $model->select("select *from sl_qytb WHERE id = {$goods_id}")[0];
        }
        $mark = $model->select("select count(*) as count from sl_save WHERE goods_id={$goods_id} and `type`={$type}")[0];
        if ($mark['count']!=0){
            return $this->jump($_SERVER['HTTP_REFERER'],'该商品已被收藏',3);
        }
        $row['biaoti'] = $list['biaoti'];
        $row['csjg'] = $list['jiage'];
        //卖家信用
        $row['mjxy'] = $list['dtpf'];
        $row['type'] = $type;
        $row['kdsj'] = $list['kdsj'];
        $row['wdzt'] = $list['wdzt'];
        $row['uid'] = $uid;
        $row['goods_id'] = $goods_id;
        if ($model->insert($row)){
            $this->jump('?c=shop&a=save','收藏成功',3);
        }else{
            return $this->jump($_SERVER['HTTP_REFERER'],'收藏失败',3);
        }
        $model = new Model('商品');
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
        $cate = $model->select("select `no` from sl_service WHERE uid={$uid} and sort_id=78 GROUP BY `no` ORDER BY dtime DESC");
        $lists = [];
        foreach ($cate as $v){
            $lists[$v['no']] = $model->select("select *from sl_service WHERE uid={$uid} and sort_id=78 AND  `no`={$v['no']}  ORDER BY dtime DESC");
        }

        include CUR_VIEW_PATH . "Sshop" . DS ."upgrade.html";
    }

    //代理记账
    public function agentAction(){
        $model = new Model('service');
        $uid = $_SESSION['user_id'];
        $cate = $model->select("select `no` from sl_service WHERE uid={$uid} and sort_id=79  GROUP BY `no` ORDER BY dtime DESC");
        $lists = [];
        foreach ($cate as $v){
            $lists[$v['no']] = $model->select("select *from sl_service WHERE uid={$uid} and sort_id=79 AND  `no`={$v['no']}  ORDER BY dtime DESC");
        }
        include CUR_VIEW_PATH . "Sshop" . DS ."agent.html";
    }

    //企业变更
    public function replaceAction(){
        $model = new Model('service');
        $uid = $_SESSION['user_id'];
        $cate = $model->select("select `no` from sl_service WHERE uid={$uid} and sort_id=80  GROUP BY `no` ORDER BY dtime DESC");
        $lists = [];
        foreach ($cate as $v){
            $lists[$v['no']] = $model->select("select *from sl_service WHERE uid={$uid} and sort_id=80 AND  `no`={$v['no']}  ORDER BY dtime DESC");
        }
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