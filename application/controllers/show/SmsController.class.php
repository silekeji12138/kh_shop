<?php

/**
 * Created by PhpStorm.
 * User: DELL
 * Date: 2018/2/23
 * Time: 14:24
 */
class SmsController extends BaseController
{
    public function smsAction(){
        header("Content-type: text/html; charset=uft8");
        date_default_timezone_set('PRC'); //设置默认时区为北京时间
        //短信接口用户名 $uid
        $uid = 104394;
        //短信接口密码 $passwd
        $pwd = md5('m91TcV');
        $tel = $_POST['tel'];
        //接入号
        $no = 106910134394;
        $message=rand(1000,9000);
        $_SESSION[$tel] = $message;
        //$msg = rawurlencode(mb_convert_encoding($message, "gb2312", "utf-8"));
        $msg = "【剑南春】您的短信验证码是：{$message}";
        $msg = urlencode($msg);
        $gateway = "http://119.23.114.82:6666/cmppweb/sendsms?uid={$uid}&pwd={$pwd}&mobile={$tel}&srcphone={$no}&msg={$msg}";
        $result = file_get_contents($gateway);
        if ($result==0){
            echo "success";
        }else{
            echo $result;
        }
    }
}