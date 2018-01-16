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
        $list = $model->select("select *from sl_log $where");
        include CUR_VIEW_PATH . "Suser" . DS ."record.html";
    }

    //提现
    public function cashAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."cash.html";
    }

    //提现记录
    public function logAction(){
        header("Content-Type:text/html;charset=utf8");
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
//        var_dump($where);die;
        $list = $model->select("select *from sl_log $where");
        include CUR_VIEW_PATH . "Suser" . DS ."log.html";
    }

    //收支
    public function paymentAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."payment.html";
    }

    //冻结明细
    public function frozenAction(){

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

        include CUR_VIEW_PATH . "Suser" . DS ."password.html";
    }

    //支付密码
    public function paywordsAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=='POST'){
            $model = new Model('member');
            $data = $_POST;
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

        include CUR_VIEW_PATH . "Suser" . DS ."phone.html";
    }

    //邮箱认证
    public function emailAction(){
        $request = $_SERVER['REQUEST_METHOD'];
        if ($request=="POST"){
            $email = $_POST['email'];
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
//$mail->IsSendmail(); //如果没有sendmail组件就注释掉，否则出现“Could not execute: /var/qmail/bin/sendmail ”的错误提示
                //$mail->AddReplyTo("joerowe123@163.com","mckee");//回复地址
                $mail->From = "joerowe123@163.com";
                $mail->FromName = "www.phpddt.com";
                $to = "917315039@qq.com";
                $mail->AddAddress($to);
                $mail->Subject = "phpmailer测试标题";
                $mail->Body = "<h1>phpmail演示</h1>这是php点点通（<font color=red>www.phpddt.com</font>）对phpmailer的测试内容";
                $mail->AltBody = "To view the message, please use an HTML compatible email viewer!"; //当邮件不支持html时备用显示，可以省略
                $mail->WordWrap = 80; // 设置每行字符串的长度
//$mail->AddAttachment("f:/test.png"); //可以添加附件
                $mail->IsHTML(true);
                $mail->Send();
                echo '邮件已发送';
            } catch (phpmailerException $e) {
                echo "邮件发送失败：".$e->errorMessage();die;
            }
        }
        include CUR_VIEW_PATH . "Suser" . DS ."email.html";
    }

    //建议
    public function adviceAction(){
        $model = new Model('advice');
        $uid = $_SESSION['user_id'];
        $list = $model->select("select * from sl_advice WHERE uid={$uid} and sort_id = 74");
        include CUR_VIEW_PATH . "Suser" . DS ."advice.html";
    }

    //咨询
    public function consultAction(){
        $model = new Model('advice');
        $uid = $_SESSION['user_id'];
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