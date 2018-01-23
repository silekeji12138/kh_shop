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

    //订单付款
    public function orderAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."order.html";
    }

    //会员的个人中心
    public function indexAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."user_index.html";
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

    //充值
    public function rechargeAction(){

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
            if (!isset($list['name'])){
                $row['name'] = $data['name'];
            }
            if (!isset($list['email'])){
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
        if ($request=='POST'){
            $model = new Model('member');
            $data = $_POST;
            if (empty($data['paywords'])){
                $this->jump('index.php?p=show&c=user&a=paywords','密码不能为空',3);
            }
            $data['paywords'] = md5($data['paywords']);
            $uid = $_SESSION['user_id'];
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
                $mail->Body    = '<b><a style="color:red;" href="">点击确认</a></b>绑定邮箱';
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
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $data = $_POST;
            $data['uid'] = $uid;
            $data['sort_id'] = 75;
            if($model->insert($data)){
                $this->jump('?c=user&a=consult','',0);
            }else{
                $this->jump('?c=user&a=consult','咨询失败，请稍后再试',3);
            }
        }
        $list = $model->select("select * from sl_advice WHERE uid={$uid} and sort_id = 75");
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
        $list = $model->select("select * from sl_advice WHERE uid={$uid} and sort_id = 77");
        include CUR_VIEW_PATH . "Suser" . DS ."assess.html";
    }
}