<?php
// 文章模型控制器
class UserController extends BaseController
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
        $result = $model->select("select *from sl_member where id={$id}")[0];
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


    //会员的个人中心
    public function indexAction(){
        $model = new Model('member');
        $uid = $_SESSION['user_id'];
        $row = $model->select("select * from sl_member WHERE id = {$uid}")[0];
        //购买的网店
        $buy = $model->select("select count(*) as count from sl_buy WHERE uid = {$uid} and zfzt='已支付' or zfzt='已支付订金'")[0];
        $sale = $model->select("select count(*) as count from sl_shangpin WHERE uid={$uid} and status='通过'")[0];
        $check = $model->select("select count(*) as count from sl_shangpin WHERE uid={$uid} and status='待审核'")[0];
        $wait = $model->select("select count(*) as count from sl_buy WHERE uid={$uid} and zfzt='已支付订金'")[0];
        //公告
        $zx=$model->select("select *from sl_tongzhi ORDER BY dtime DESC limit 0,5");
        //在线问答
        $qa = $model->select("select *from sl_zxwd ORDER BY dtime DESC limit 0,5");
        //投诉建议
        $lists = $model->select("select * from sl_advice WHERE sort_id = 74 or sort_id=76 limit 0,5");
        //var_dump($sale);die;
        include CUR_VIEW_PATH . "Suser" . DS ."user_index.html";
    }

    //公告
    public function noticeAction(){
        $id=$_GET['id'];
        $model=new model('help');
        $zx=$model->select("select *from sl_tongzhi ORDER BY dtime DESC limit 0,10");
        if ($id){
            $result=$model->select("select neirong,biaoti from sl_tongzhi WHERE id=$id");
            $res=$result[0]['neirong'];
        }
        include CUR_VIEW_PATH . "Suser" . DS ."notice.html";
    }

    //用户注销功能的方法
    public function loginoutAction(){
        if (isset($_COOKIE['id'])){
            setcookie('id',null,time()-3600,"/");
            setcookie('password',null,time()-3600,"/");
        }
        $_SESSION['username']='';
        session_destroy();
        $this->jump('index.php?p=show&c=login&a=login','',0);
    }

<<<<<<< .mine
    //商品订单
    public function orderAction(){
        $goods_id = $_GET['id'];
        $model = new Model('shangpin');
        $uid = $_SESSION['user_id'];
        $type = $_GET['type'];
        //防重复提交token
        $token = mt_rand(1,100000);
        $_SESSION['token'.$uid] = $token;
        //订单号
        $no = date('Ymd',time()).$uid.rand(100000,999999);
        //余额
        $row = $model->select("select property from sl_member WHERE id={$uid}")[0];

        if ($type==1){
            $list = $model->select("select *from sl_shangpin WHERE id={$goods_id}")[0];
            //买家不能买自己的店铺
            if ($list['uid']==$uid){
                return $this->jump($_SERVER['HTTP_REFERER'],'店家不能购买自己的店铺',3);
            }
        }else{
            $list = $model->select("select * from sl_qytb id={$goods_id}")[0];
        }
        if ($list['mark']==0){
            return $this->jump('/','该网店已经被购买，请选择其他网店',3);
        }
        include CUR_VIEW_PATH . "Suser" . DS ."order.html";
    }

    //生成商品订单  付款
    public function generateAction(){
        $data = $_POST;
        $uid = $_SESSION['user_id'];
        $goods_id = $data['id'];
        $type = $_GET['type'];
        $token = $_SESSION['token'.$uid];
        if ($token!=$data['token']){
            //重复提交
            $this->jump('/','请勿重复提交',3);
        }else{
            //创建订单  扣除余额
            $model = new Model('shangpin');
            $user = new Model('member');
            $row = $user->select("select property,paywords from sl_member WHERE id={$uid}")[0];
            if (md5($data['paywords'])!=$row['paywords']){
                return $this->jump($_SERVER['HTTP_REFERER'],'支付密码错误',3);
            }
            //开启事务
            $model->start_T();
            try{
                if ($type==1){
                    $list = $model->select("select *from sl_shangpin WHERE id={$goods_id}")[0];
                }else{
                    $list = $model->select("select * from sl_qytb id={$goods_id}")[0];
                }
                //订单信息
                $lists['uid'] = $uid;
                $lists['biaoti'] = $list['biaoti'];
                $lists['type'] = $type;
                $lists['csjg'] = $list['jiage'];
                $lists['xbje'] = $list['xbj'];
                $lists['no'] = $data['no'];
                $lists['goods_id'] = $goods_id;
                $lists['xszt'] = "停售";
                if ($data['fk']==1){
                    $pay = $list['jiage']+$list['jiage']*0.1+$list['xbj'];
                    $lists['zfzt'] = "已支付";
                }else{
                    $pay = $list['jiage']*0.2;
                    $lists['zfzt'] = "已支付订金";
                }
                if ($row['property']<$pay){
                    throw new Exception("余额不足，支付失败");
                }
                if ($list['mark']!=1){
                    throw new Exception("商品已被购买");
                }
                $buy = new Model('sl_buy');

                //商品下架
                $status['mark'] = 0;
                if(!$model->xg($status,"id=$goods_id")){
                    throw new Exception("购买失败,商品已被购买");
                }
                //扣除余额
                $arr['property'] = $row['property'] - $pay;
                if(!$user->xg($arr,"id={$uid}")){
                    throw new Exception("支付失败");
                }
                if (!$buy->insert($lists)){
                    throw new Exception("购买失败");
                }
                //生成记录
                $log = new Model('log');
                $record['type'] = '支出';
                $record['uid'] = $uid;
                $record['mark'] = '支出';
                $record['intro'] = '无';
                $record['differ'] = '购买店铺';
                $record['price'] = $pay;
                $record['dtime'] = time();
                $record['status'] = '已支付';
                $record['num'] = $data['no'];
                $record['balance'] = $row['property']-$pay;
                $log->insert($record);

                $model->comit_T();
                $this->jump('?c=shop&a=buy','',0);
            }catch (Exception $e){
                //回滚
                $model->roll_T();
                $this->jump('?c=user&a=order&type=1&id='.$goods_id,$e->getMessage(),3);
            }


        }
    }

    //支付商品尾款
    public function retainageAction(){
        $id = $_GET['id'];
        $model = new Model('buy');
        $uid = $_SESSION['user_id'];
        $request = $_SERVER['REQUEST_METHOD'];
        $order = $model->select("select `type`,goods_id,`no` from sl_buy WHERE id={$id}")[0];
        $list = $model->select("select *from sl_shangpin WHERE id={$order['goods_id']}")[0];
        if ($request=='POST'){
            $model->start_T();
            $data = $_POST;
            $user = new Model('member');
            $one = $user->select("select property,paywords from sl_member WHERE id={$uid}")[0];
            if (md5($data['paywords'])!=$one['paywords']){
                return $this->jump($_SERVER['HTTP_REFERER'],'支付密码错误',3);
            }
            try{
                $row['zfzt']='已支付';
                if (!$model->xg($row,"id={$id}")){
                    throw new Exception('购买失败');
                }
                //扣除余额
                $pay = $list['jiage']*0.9+$list['xbj'];

                $arr['property'] = $one['property'] - $pay;
                if(!$user->xg($arr,"id={$uid}")){
                    throw new Exception("支付失败");
                }

                //生成记录
                $log = new Model('log');
                $record['type'] = '支出';
                $record['uid'] = $uid;
                $record['mark'] = '支出';
                $record['intro'] = '无';
                $record['differ'] = '购买店铺';
                $record['price'] = $pay;
                $record['dtime'] = time();
                $record['status'] = '已支付';
                $record['num'] = $order['no'];
                $record['balance'] = $one['property']-$pay;
                $log->insert($record);
                //提交
                $model->comit_T();
                $this->jump('?c=shop&a=buy','',0);
            }catch (Exception $e){
                //回滚
                $model->roll_T();
                $this->jump('?c=user&a=buy',$e->getMessage(),3);
            }
        }
        //获取商品信息
        include CUR_VIEW_PATH . "Suser" . DS ."retainage.html";
    }

    //企业服务订单
    public function commonAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        $model = new Model('service');
        $uid = $_SESSION['user_id'];
        if($request=='POST'){
            $data = $_POST;
            $type = $_GET['type'];
            $no = date('Ymd',time()).$uid.rand(100000,999999);
            if ($_GET['type']==1){
                $list['type'] = '店铺升级';
                $list['sort_id'] = 78;
                $list['fwxq'] = $data['gszc'].' '.$data['nszz'].' '.$data['dz'].' '.$data['yhkh'];
            }elseif ($_GET['type']==2){
                $list['type'] = '代理记账';
                $list['sort_id'] = 79;
                $list['fwxq'] = $data['gszc'];
            }else{
                $list['type'] = '企业变更';
                $list['sort_id'] = 80;
                $list['fwxq'] = $data['gszc'];
            }
            $list['uid'] = $uid;
            $list['fws'] = '店来店往自营';
            $list['fwjg'] = $data['price'];
            $list['dq'] = $data['province'].' '.$data['city'];
            $list['status'] = '未付款';

            //防重复提交token
            $token = mt_rand(1,100000);
            $_SESSION['token'.$uid] = $token;
            //订单号
            $no = date('Ymd',time()).$uid.rand(100000,999999);
            $list['no'] = $no;
            $model->insert($list);
        }else{
            $list = $model->select("select *from sl_service WHERE `no`={$_GET['no']}")[0];
            $token = mt_rand(1,100000);
            $_SESSION['token'.$uid] = $token;
            $no = $list['no'];
            if ($list['sort_id']==78){
                $list['type'] = '店铺升级';
            }elseif ($list['sort_id'] = 79){
                $list['type'] = '代理记账';
            }else{
                $list['type'] = '企业变更';
            }
        }
        //余额
        $row = $model->select("select property from sl_member WHERE id={$uid}")[0];
        include CUR_VIEW_PATH . "Suser" . DS ."common.html";
    }

    //企业服务订单付款
    public function checkAction(){
        $model = new Model('service');
        $data = $_POST;
        $uid = $_SESSION['user_id'];
        $no = $data['no'];
        $token = $_SESSION['token'.$uid];
        if ($token!=$data['token']){
            //重复提交
            $this->jump('/','请勿重复提交',3);
        }else{
            //开启事务
            $model->start_T();
            $user = new Model('member');
            $row = $user->select("select property,paywords from sl_member WHERE id={$uid}")[0];
            if (md5($data['paywords'])!=$row['paywords']){
                $this->jump('index.php?p=show&c=user&a=common&no='.$no,"支付密码错误",3);
            }
            try{
                $list = $model->select("select *from sl_service WHERE no={$no}")[0];
                $pay = $list['fwjg'];
                if ($row['property']<$pay){
                    throw new Exception("余额不足，支付失败");
                }
                $lists['status'] = '已付款';
                //扣除余额
                $arr['property'] = $row['property'] - $pay;
                if(!$user->xg($arr,"id={$uid}")){
                    throw new Exception("支付失败");
                }
                if ($list['status']=='已付款'){
                    throw new Exception("请勿重复购买");
                }
                if (!$model->xg($lists,"no=$no")){
                    throw new Exception("购买失败");
                }
                //生成记录
                $log = new Model('log');
                $record['type'] = '支出';
                $record['uid'] = $uid;
                $record['mark'] = '支出';
                $record['intro'] = '无';
                $record['differ'] = '购买服务';
                $record['price'] = $pay;
                $record['dtime'] = time();
                $record['status'] = '已支付';
                $record['num'] = $data['no'];
                $record['balance'] = $row['property']-$pay;
                $log->insert($record);

                $model->comit_T();
                if ($list['sort_id']==78){
                    $this->jump('index.php?p=show&c=shop&a=upgrade','',0);
                }elseif ($list['sort_id']==79){
                    $this->jump('index.php?p=show&c=shop&a=agent','',0);
                }else{
                    $this->jump('index.php?p=show&c=shop&a=replace','',0);
                }
            }catch (Exception $e){
                //回滚
                $model->roll_T();
               //var_dump($e->getMessage());die;
                $this->jump('index.php?p=show&c=user&a=common&no='.$no,$e->getMessage(),3);
            }
        }
    }





































=======
    //商品订单
    public function orderAction(){
        $goods_id = $_GET['id'];
        $model = new Model('shangpin');
        $uid = $_SESSION['user_id'];
        $type = $_GET['type'];
        //防重复提交token
        $token = mt_rand(1,100000);
        $_SESSION['token'.$uid] = $token;
        //订单号
        $no = date('Ymd',time()).$uid.rand(100000,999999);
        //余额
        $row = $model->select("select property from sl_member WHERE id={$uid}")[0];

        if ($type==1){
            $list = $model->select("select *from sl_shangpin WHERE id={$goods_id}")[0];
            //买家不能买自己的店铺
            if ($list['uid']==$uid){
                return $this->jump($_SERVER['HTTP_REFERER'],'店家不能购买自己的店铺',3);
            }
        }else{
            $list = $model->select("select * from sl_qytb id={$goods_id}")[0];
        }
        if ($list['mark']==0){
            return $this->jump('/','该网店已经被购买，请选择其他网店',3);
        }
        include CUR_VIEW_PATH . "Suser" . DS ."order.html";
    }

    //生成商品订单  付款
    public function generateAction(){
        $data = $_POST;
        $uid = $_SESSION['user_id'];
        $goods_id = $data['id'];
        $type = $_GET['type'];
        $token = $_SESSION['token'.$uid];
        if ($token!=$data['token']){
            //重复提交
            $this->jump('/','请勿重复提交',3);
        }else{
            //创建订单  扣除余额
            $model = new Model('shangpin');
            $user = new Model('member');
            $row = $user->select("select property,paywords,frozen,xbj from sl_member WHERE id={$uid}")[0];
            if (md5($data['paywords'])!=$row['paywords']){
                return $this->jump($_SERVER['HTTP_REFERER'],'支付密码错误',3);
            }
            //开启事务
            /**
             * arr-------用户资金管理
             * lists-----购买订单
             * line------冻结资金
             * record----收支记录
            */
            $model->start_T();
            try{
                if ($type==1){
                    $list = $model->select("select *from sl_shangpin WHERE id={$goods_id}")[0];
                }else{
                    $list = $model->select("select * from sl_qytb id={$goods_id}")[0];
                }
                //订单信息
                $lists['uid'] = $uid;
                $lists['biaoti'] = $list['biaoti'];
                $lists['type'] = $type;
                $lists['csjg'] = $list['jiage'];
                $lists['xbje'] = $list['jiage']*0.2;
                $lists['no'] = $data['no'];
                $lists['goods_id'] = $goods_id;
                $lists['xszt'] = "交易中";
                if ($data['fk']==1){
                    $pay = $list['jiage']+$list['jiage']*0.1+$list['xbj']*0.2;
                    $arr['xbj'] = $list['jiage']*0.2;
                    $lists['zfzt'] = "已支付";
                    $record['intro'] = "全款";
                    $line['intro'] = "全款";
                }else{
                    $pay = $list['jiage']*0.2;
                    $lists['zfzt'] = "已支付订金";
                    $record['intro'] = "订金";
                    $line['intro'] = "订金";
                }
                if ($row['property']<$pay){
                    throw new Exception("余额不足，支付失败");
                }
                if ($list['mark']!=1){
                    throw new Exception("商品已被购买");
                }
                $buy = new Model('sl_buy');

                //商品下架
                $status['mark'] = 0;
                $status['jyzt'] = "交易中";
                if(!$model->xg($status,"id=$goods_id")){
                    throw new Exception("购买失败,商品已被购买");
                }
                //扣除余额
                $arr['property'] = $row['property'] - $pay;
                $arr['frozen'] = $pay + $row['frozen'];
                $arr['xbj'] = $arr['xbj'] + $row['xbj'];
                if(!$user->xg($arr,"id={$uid}")){
                    throw new Exception("支付失败");
                }
                if (!$buy->insert($lists)){
                    throw new Exception("购买失败");
                }
                //生成记录
                $log = new Model('log');
                $record['type'] = '支出';
                $record['uid'] = $uid;
                $record['mark'] = '支出';
                $record['differ'] = '购买店铺';
                $record['price'] = $pay;
                $record['dtime'] = time();
                $record['status'] = '已支付';
                $record['num'] = $data['no'];
                $record['balance'] = $row['property']-$pay;
                $log->insert($record);
                //冻结资金
                $line['type'] = '冻结';
                $line['uid'] = $uid;
                $line['mark'] = '支出';
                $line['differ'] = '购买店铺';
                $line['price'] = $pay;
                $line['dtime'] = time();
                $line['status'] = '已冻结';
                $line['num'] = $data['no'];
                $log->insert($line);
                $model->comit_T();
                $this->jump('?c=shop&a=buy','',0);
            }catch (Exception $e){
                //回滚
                $model->roll_T();
                $this->jump('?c=user&a=order&type=1&id='.$goods_id,$e->getMessage(),3);
            }


        }
    }

    //支付商品尾款
    public function retainageAction(){
        $id = $_GET['id'];
        $model = new Model('buy');
        $uid = $_SESSION['user_id'];
        $request = $_SERVER['REQUEST_METHOD'];
        $order = $model->select("select `type`,goods_id,`no` from sl_buy WHERE id={$id}")[0];
        $list = $model->select("select *from sl_shangpin WHERE id={$order['goods_id']}")[0];
        if ($request=='POST'){
            $model->start_T();
            $data = $_POST;
            $user = new Model('member');
            $one = $user->select("select property,paywords from sl_member WHERE id={$uid}")[0];
            if (md5($data['paywords'])!=$one['paywords']){
                return $this->jump($_SERVER['HTTP_REFERER'],'支付密码错误',3);
            }
            try{
                $row['zfzt']='已支付';
                if (!$model->xg($row,"id={$id}")){
                    throw new Exception('购买失败');
                }
                //扣除余额
                $pay = $list['jiage']*1.1;
                $arr['frozen'] = $pay + $one['frozen'];
                $arr['xbj'] = $list['jiage']*0.2 + $one['xbj'];
                $arr['property'] = $one['property'] - $pay;
                if(!$user->xg($arr,"id={$uid}")){
                    throw new Exception("支付失败");
                }

                //生成记录
                $log = new Model('log');
                $record['type'] = '支出';
                $record['uid'] = $uid;
                $record['mark'] = '支出';
                $record['intro'] = '无';
                $record['differ'] = '购买店铺';
                $record['price'] = $pay;
                $record['dtime'] = time();
                $record['status'] = '已支付';
                $record['intro'] = '尾款';
                $record['num'] = $order['no'];
                $record['balance'] = $one['property']-$pay;
                $log->insert($record);
                //冻结资金
                $line['type'] = '冻结';
                $line['uid'] = $uid;
                $line['mark'] = '支出';
                $line['differ'] = '购买店铺';
                $line['price'] = $pay;
                $line['dtime'] = time();
                $line['status'] = '已冻结';
                $line['num'] = $data['no'];
                $log->insert($line);


                //提交
                $model->comit_T();
                $this->jump('?c=shop&a=buy','',0);
            }catch (Exception $e){
                //回滚
                $model->roll_T();
                $this->jump('?c=user&a=buy',$e->getMessage(),3);
            }
        }
        //获取商品信息
        include CUR_VIEW_PATH . "Suser" . DS ."retainage.html";
    }

    //企业服务订单
    public function commonAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        $model = new Model('service');
        $uid = $_SESSION['user_id'];
        if($request=='POST'){
            $data = $_POST;
            $type = $_GET['type'];
            $no = date('Ymd',time()).$uid.rand(100000,999999);
            if ($_GET['type']==1){
                $list['type'] = '店铺升级';
                $list['sort_id'] = 78;
                $list['fwxq'] = $data['gszc'].' '.$data['nszz'].' '.$data['dz'].' '.$data['yhkh'];
            }elseif ($_GET['type']==2){
                $list['type'] = '代理记账';
                $list['sort_id'] = 79;
                $list['fwxq'] = $data['gszc'];
            }else{
                $list['type'] = '企业变更';
                $list['sort_id'] = 80;
                $list['fwxq'] = $data['gszc'];
            }
            $list['uid'] = $uid;
            $list['fws'] = '店来店往自营';
            $list['fwjg'] = $data['price'];
            $list['dq'] = $data['province'].' '.$data['city'];
            $list['status'] = '未付款';

            //防重复提交token
            $token = mt_rand(1,100000);
            $_SESSION['token'.$uid] = $token;
            //订单号
            $no = date('Ymd',time()).$uid.rand(100000,999999);
            $list['no'] = $no;
            $model->insert($list);
        }else{
            $list = $model->select("select *from sl_service WHERE `no`={$_GET['no']}")[0];
            $token = mt_rand(1,100000);
            $_SESSION['token'.$uid] = $token;
            $no = $list['no'];
            if ($list['sort_id']==78){
                $list['type'] = '店铺升级';
            }elseif ($list['sort_id'] = 79){
                $list['type'] = '代理记账';
            }else{
                $list['type'] = '企业变更';
            }
        }
        //余额
        $row = $model->select("select property from sl_member WHERE id={$uid}")[0];
        include CUR_VIEW_PATH . "Suser" . DS ."common.html";
    }

    //企业服务订单付款
    public function checkAction(){
        $model = new Model('service');
        $data = $_POST;
        $uid = $_SESSION['user_id'];
        $no = $data['no'];
        $token = $_SESSION['token'.$uid];
        if ($token!=$data['token']){
            //重复提交
            $this->jump('/','请勿重复提交',3);
        }else{
            //开启事务
            $model->start_T();
            $user = new Model('member');
            $row = $user->select("select property,paywords from sl_member WHERE id={$uid}")[0];
            if (md5($data['paywords'])!=$row['paywords']){
                $this->jump('index.php?p=show&c=user&a=common&no='.$no,"支付密码错误",3);
            }
            try{
                $list = $model->select("select *from sl_service WHERE no={$no}")[0];
                $pay = $list['fwjg'];
                if ($row['property']<$pay){
                    throw new Exception("余额不足，支付失败");
                }
                $lists['status'] = '已付款';
                //扣除余额
                $arr['property'] = $row['property'] - $pay;
                if(!$user->xg($arr,"id={$uid}")){
                    throw new Exception("支付失败");
                }
                if ($list['status']=='已付款'){
                    throw new Exception("请勿重复购买");
                }
                if (!$model->xg($lists,"no=$no")){
                    throw new Exception("购买失败");
                }
                //生成记录
                $log = new Model('log');
                $record['type'] = '支出';
                $record['uid'] = $uid;
                $record['mark'] = '支出';
                $record['intro'] = '无';
                $record['differ'] = '购买服务';
                $record['price'] = $pay;
                $record['dtime'] = time();
                $record['status'] = '已支付';
                $record['num'] = $data['no'];
                $record['balance'] = $row['property']-$pay;
                $log->insert($record);

                $model->comit_T();
                if ($list['sort_id']==78){
                    $this->jump('index.php?p=show&c=shop&a=upgrade','',0);
                }elseif ($list['sort_id']==79){
                    $this->jump('index.php?p=show&c=shop&a=agent','',0);
                }else{
                    $this->jump('index.php?p=show&c=shop&a=replace','',0);
                }
            }catch (Exception $e){
                //回滚
                $model->roll_T();
               //var_dump($e->getMessage());die;
                $this->jump('index.php?p=show&c=user&a=common&no='.$no,$e->getMessage(),3);
            }
        }
    }

>>>>>>> .theirs
    //充值
    public function rechargeAction(){
        //线下
        $request = $_SERVER['REQUEST_METHOD'];
        if($request=="POST"){
            $data = $_POST;
            $model = new Model('');
            $model->insert($data);
        }
        include CUR_VIEW_PATH . "Suser" . DS ."recharge.html";
    }

    //充值记录
    public function recordAction(){
        $model = new Model('log');
        $uid = $_SESSION['user_id'];
        $where = "where uid={$uid} and type='充值'";
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            foreach ($data as $k=>$v){
                if ($k=='start'&&$v!=0){
                    $v = strtotime($v);
                    $where .= " and dtime>$v";
                }
                if ($k=='end'&&$v!=0){
                    $v = strtotime($v);
                    $where .= " and dtime<$v";
                }
                if ($k=='status'&&$v!='所有'){
                    $where .= " and status='$v'";
                }
            }
        }
        $list = $model->select("select *from sl_log $where ORDER BY dtime DESC ");
        include CUR_VIEW_PATH . "Suser" . DS ."record.html";
    }

    //提现
    public function cashAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."cash.html";
    }

    //提现记录
    public function logAction(){
        $model = new Model('log');
        $uid = $_SESSION['user_id'];
        $where = "where uid={$uid} and type='提现'";
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            foreach ($data as $k=>$v){
                if ($k=='start'&&$v!=0){
                    $v = strtotime($v);
                    $where .= " and dtime>$v";
                }
                if ($k=='end'&&$v!=0){
                    $v = strtotime($v);
                    $where .= " and dtime<$v";
                }
                if ($k=='status'&&$v!='所有'){
                    $where .= " and status='{$v}'";
                }
            }
        }
        $list = $model->select("select *from sl_log $where ORDER BY dtime DESC ");
        include CUR_VIEW_PATH . "Suser" . DS ."log.html";
    }

    //收支
    public function paymentAction(){
<<<<<<< .mine
        header("Content-Type:text/html;charset=utf8");
        $model = new Model('log');
        $uid = $_SESSION['user_id'];
        $where = "where uid={$uid} ";
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            foreach ($data as $k=>$v){
                if (!empty($data['type'])){
                    //获取收支类型
                    foreach ($data['type'] as $item=>$val){
                        if ($item==0){
                            if ($val=='其它'){
                                $where .= " and type='冻结' or type='收入'";
                            }else{
                                $where .= " and type='$val'";
                            }
                        }else{
                            if ($val=='其它'){
                                $where .= " or type='冻结' or type='收入'";
                            }else{
                                $where .= " or type='$val'";
                            }
                        }
                    }
                }
=======
        header("Content-Type:text/html;charset=utf8");
        $model = new Model('log');
        $uid = $_SESSION['user_id'];
        $where = "where uid={$uid} and type!='冻结'";
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            foreach ($data as $k=>$v){
                if (!empty($data['type'])){
                    //获取收支类型
                    foreach ($data['type'] as $item=>$val){
                        if ($item==0){
                            if ($val=='其它'){
                                $where .= " and type='收入'";
                            }else{
                                $where .= " and type='$val'";
                            }
                        }else{
                            if ($val=='其它'){
                                $where .= " or type='冻结' or type='收入'";
                            }else{
                                $where .= " or type='$val'";
                            }
                        }
                    }
                }
>>>>>>> .theirs

                if ($k=='start'&&$v!=0){
                    $v = strtotime($v);
                    $where .= " and dtime>$v";
                }
                if ($k=='end'&&$v!=0){
                    $v = strtotime($v);
                    $where .= " and dtime<$v";
                }
                if ($k=='inf'&&$v!=''){
                    $where .= " and price>$v";
                }
                if ($k=='sup'&&$v!=''){
                    $where .= " and price<$v";
                }
                if ($k=='keywords'&&$v!=''){
                    $where .= " and intro like '%$v%'";
                }
            }
        }
        $list = $model->select("select *from sl_log $where ORDER BY dtime DESC ");
        include CUR_VIEW_PATH . "Suser" . DS ."payment.html";
    }

    //冻结明细
    public function frozenAction(){
        header("Content-Type:text/html;charset=utf8");
        $model = new Model('log');
        $uid = $_SESSION['user_id'];
        $where = "where uid={$uid} and type='冻结'";
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            foreach ($data as $k=>$v){
                if ($k=='start'&&$v!=0){
                    $v = strtotime($v);
                    $where .= " and dtime>$v";
                }
                if ($k=='end'&&$v!=0){
                    $v = strtotime($v);
                    $where .= " and dtime<$v";
                }
                if ($k=='inf'&&$v!=''){
                    $where .= " and price>$v";
                }
                if ($k=='sup'&&$v!=''){
                    $where .= " and price<$v";
                }
                if ($k=='keywords'&&$v!=''){
                    $where .= " and intro like '%$v%'";
                }
            }
        }
        $list = $model->select("select *from sl_log $where ORDER BY dtime DESC ");
        include CUR_VIEW_PATH . "Suser" . DS ."frozen.html";
    }

    //个人资料
    public function personAction(){
        $model = new Model('member');
        $request = $_SERVER['REQUEST_METHOD'];
        $uid = $_SESSION['user_id'];
        //查询个人信息
        $list = $model->select("select * from sl_member WHERE id={$uid}")[0];

        if ($request=='POST'){
            $data = $_POST;
            $row['sex'] = $data['sex'];
            $row['username'] = $data['username'];
            $row['birth'] = $data['year']."-".$data['month']."-".$data['day'];
            //剔除不可更改的信息
            if (empty($list['name'])){
                //第一次需短信验证
                if ($_SESSION[$list['tel']]!=$data['captcha']){
                    $this->jump('?p=show&c=user&a=person','验证码错误',3);
                }
                $row['name'] = $data['name'];
            }
            if (empty($list['email'])){
                $row['email'] = $data['email'];
            }
            //头像
            $file = $_FILES;
            if ($file['photo']['error']==0){
                $this->library("Upload");
                $upload = new Upload();
                $row['photo'] = $upload->up($_FILES['photo']);
            }

            if($model->xg($row,"id=".$uid)){
                $_SESSION['photo'] = $row['photo'];
                $_SESSION['name'] = $data['name'];
                $this->jump('index.php?p=show&c=user&a=person','修改成功',3);
            }else{
                $this->jump('index.php?p=show&c=user&a=person','修改失败',3);
            }
        }
        $year = range(1900,2030);
        $month = range(1,12);
        $day = range(1,31);
        $list['year'] = explode('-',$list['birth'])[0];
        $list['month'] = explode('-',$list['birth'])[1];
        $list['day'] = explode('-',$list['birth'])[2];
        //var_dump($list['year']==1914?'selected':'');die;
        include CUR_VIEW_PATH . "Suser" . DS ."person.html";
    }

    //登录密码
    public function passwordAction(){
        $model = new Model('member');
        $request = $_SERVER['REQUEST_METHOD'];
        $uid = $_SESSION['user_id'];
        if ($request=="POST"){
            $data['password'] = md5($_POST['pwd']);
            $list = $model->select("select password from sl_member WHERE id={$uid}")[0];
            if (md5($_POST['old'])==$list['password']){
                $model->xg($data,"id={$uid}");
                $this->jump('index.php?p=show&c=user&a=loginout','',0);
            }else{
                $this->jump('index.php?p=show&c=user&a=password','旧密码不正确',3);
            }
        }
        include CUR_VIEW_PATH . "Suser" . DS ."password.html";
    }

    //支付密码
    public function paywordsAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        $model = new Model('member');
        $uid = $_SESSION['user_id'];
        //验证是否为首次设置密码
        $paywords = $model->select("select paywords from sl_member WHERE id={$uid}")[0];
        if ($request=='POST'){
            $data = $_POST;
            if (!empty($paywords['paywords'])){
                if (md5($data['old_pay'])!=$paywords['paywords']){
                    $this->jump('index.php?p=show&c=user&a=paywords','旧密码不正确',3);
                }
            }
            unset($data['old_pay']);
            if (empty($data['paywords'])){
                $this->jump('index.php?p=show&c=user&a=paywords','密码不能为空',3);
            }
            $data['paywords'] = md5($data['paywords']);
            if($model->xg($data,"id=".$uid)){
                $this->jump('index.php?p=show&c=user&a=paywords','修改成功',3);
            }else{
                $this->jump('index.php?p=show&c=user&a=paywords','修改失败',3);
            }
        }
        include CUR_VIEW_PATH . "Suser" . DS ."paywords.html";
    }

    //密码保护
    public function protectAction(){
        header("content-type:text/html;charset=utf-8");
        $request = $_SERVER['REQUEST_METHOD'];
        $uid = $_SESSION['user_id'];
        $model = new Model('member');
        $row = $model->select("select *from sl_member WHERE id = {$uid}")[0];
        if ($request=="POST"){
            $data = $_POST;
            if ($row['question']){
                if ($row['ans']!=$data['answer']){
                    $this->jump('index.php?p=show&c=user&a=protect','您的答案不正确',3);
                }
            }
            if ($data['question']=="请选择"){
                $this->jump('index.php?p=show&c=user&a=protect','请选择密保问题',3);
            }
            unset($data['answer']);
            if ($model->xg($data,"id={$uid}")){
                $this->jump('index.php?p=show&c=user&a=protect','您的答案不正确',0);
            }else{
                $this->jump('index.php?p=show&c=user&a=protect','修改密保问题失败，请稍后再试',3);
            }
        }
        //获取原始问题

        include CUR_VIEW_PATH . "Suser" . DS ."protect.html";
    }

    //手机认证
    public function phoneAction(){
        $model = new Model('member');
        $request = $_SERVER['REQUEST_METHOD'];
        $uid = $_SESSION['user_id'];

        if ($request=="POST"){
            if ($_POST['captcha']!=$_SESSION[$_POST['old']]){
            $this->jump('index.php?p=show&c=user&a=phone','旧手机验证码错误',3);
            exit;
             }
            $data['tel'] = $_POST['tel'];
            if ($_POST['code']==$_SESSION[$_POST['tel']]){
                $model->xg($data,"id = $uid");
                $this->jump('index.php?p=show&c=user&a=loginout','',0);

            }else{
                $this->jump('index.php?p=show&c=user&a=phone','新手机验证码错误',3);
                exit;
            }
        }
        $lists = $model->select("select tel from sl_member WHERE id = {$uid}")[0];
        include CUR_VIEW_PATH . "Suser" . DS ."phone.html";
    }

    //邮箱认证
    public function emailAction(){
        $uid = $_SESSION['user_id'];
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=="POST"){
            $email = trim($_POST['email']);
            header("content-type:text/html;charset=utf-8");
            //ini_set("magic_quotes_runtime",0); //调试
            //加载phpmailer
            $this->library("phpmailer");
            try {
                $mail = new phpmailer(true);
                $mail->IsSMTP();
                $mail->CharSet='UTF-8'; //设置邮件的字符编码，这很重要，不然中文乱码
                $mail->SMTPAuth = true; //开启认证
                $mail->Port = 25;
                $mail->Host = "smtp.163.com";
                $mail->Username = "joerowe123@163.com";
                $mail->Password = "joe123";
                //$mail->AddReplyTo("joerowe123@163.com","mckee");//回复地址
                $mail->From = "joerowe123@163.com";
                $mail->FromName = "店来店往";
                $mail->AddAddress($email);
                $mail->Subject = '邮箱认证';
                $mail->Body    = "<b><a style='color:red;' href='http://new6.jileiyun.com?c=user&a=authenticate&id=".$uid."&email=".$email."'>点击确认</a></b>绑定邮箱";
                $mail->WordWrap = 80; // 设置每行字符串的长度
                $mail->IsHTML(true);
                $mail->Send();
                echo "success";die;
            } catch (phpmailerException $e) {
                //var_dump($mail->ErrorInfo);die;
                //$this->jump('index.php?p=show&c=user&a=email','邮件发送失败',3);
                echo 'failed';die;
            }
        }

        $email = $_SESSION['email'.$uid];
        include CUR_VIEW_PATH . "Suser" . DS ."email.html";
    }

    public function authenticateAction(){
        $uid = $_GET['id'];
        $data['email'] = $_GET['email'];
        $model = new Model('member');
        $model->xg($data,"id=$uid");
        $this->jump('index.php?p=show&c=user&a=person','邮箱认证成功',3);
    }

    //建议
    public function adviceAction(){
        $model = new Model('advice');
        $uid = $_SESSION['user_id'];
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            $data['uid'] = $uid;
            $data['sort_id'] = 74;
            if($model->insert($data)){
                $this->jump('?c=user&a=advice','',0);
            }else{
                $this->jump('?c=user&a=advice','提交意见失败，请稍后再试',3);
            }
        }
        $list = $model->select("select * from sl_advice WHERE uid={$uid} and sort_id = 74");
        include CUR_VIEW_PATH . "Suser" . DS ."advice.html";
    }

    //咨询
    public function consultAction(){
        $model = new Model('advice');
        $uid = $_SESSION['user_id'];
        $list = $model->select("select * from sl_zxwd WHERE uid={$uid} ORDER BY dtime DESC ");
        include CUR_VIEW_PATH . "Suser" . DS ."consult.html";
    }

    //投诉
    public function complaintAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        $model = new Model('advice');
        $uid = $_SESSION['user_id'];
        if ($request=='POST'){
            $data = $_POST;
            $data['uid'] = $uid;
            $data['sort_id'] = 76;
            if($model->insert($data)){
                $this->jump('?c=user&a=complaint','',0);
            }else{
                $this->jump('?c=user&a=complaint','投诉失败，请稍后再试',3);
            }
        }
        $list = $model->select("select * from sl_advice WHERE uid={$uid} and sort_id = 76");
        include CUR_VIEW_PATH . "Suser" . DS ."complaint.html";
    }

    //评价
    public function assessAction(){
        $model = new Model('advice');
        $uid = $_SESSION['user_id'];
        $list = $model->select("select * from sl_kefu WHERE uid={$uid} ");
        include CUR_VIEW_PATH . "Suser" . DS ."assess.html";
    }
}