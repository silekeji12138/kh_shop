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

        include CUR_VIEW_PATH . "Suser" . DS ."record.html";
    }

    //提现
    public function cashAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."cash.html";
    }

    //提现记录
    public function logAction(){

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

        include CUR_VIEW_PATH . "Suser" . DS ."person.html";
    }

    //登录密码
    public function passwordAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."password.html";
    }

    //支付密码
    public function paywordsAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."paywords.html";
    }

    //密码保护
    public function protectAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."protect.html";
    }

    //手机认证
    public function phoneAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."phone.html";
    }

    //邮箱认证
    public function emailAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."email.html";
    }

    //账号安全
    public function safeAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."safe.html";
    }

    //建议
    public function adviceAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."advice.html";
    }

    //咨询
    public function consultAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."consult.html";
    }

    //投诉
    public function complaintAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."complaint.html";
    }

    //评价
    public function assessAction(){

        include CUR_VIEW_PATH . "Suser" . DS ."assess.html";
    }
}