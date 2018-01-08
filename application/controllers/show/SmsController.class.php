<?php
// 文章模型控制器
class SmsController extends BaseController
{


    public function smsAction(){
        $num=$_GET['num'];
        header("Content-type: text/html; charset=utf-8");
        date_default_timezone_set('PRC'); //设置默认时区为北京时间
        //短信接口用户名 $uid
        $uid = 'SLKJ006499';
        //短信接口密码 $passwd
        $passwd = '123456';
        $message=rand(1000,9000);
        //$num ='136087976876';
        $msg = rawurlencode(mb_convert_encoding($message, "gb2312", "utf-8"));
        $msg=$msg."【思乐科技】";
        $gateway = "http://mb345.com:999/ws/BatchSend2.aspx?CorpID={$uid}&Pwd={$passwd}&Mobile={$num}&Content={$msg}&SendTime=&cell=";
        $result = file_get_contents($gateway);
        $_SESSION[$num]=$message;
//         if(  $result > 0 )
//         {
//             echo $gateway;
//             echo $result;
//             echo "发送成功! 发送时间".date("Y-m-d H:i:s");
//         }
//         else
//         {
//             echo "发送失败, 错误提示代码: ".$result;
//         }
//        exit;
    }
    
}