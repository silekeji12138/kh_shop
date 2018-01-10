<?php
// 文章模型控制器
header("Content-type: text/html; charset=utf-8");
class IndexController extends BaseController
{
    public function textAction(){
           $rs=self::tmAction('淘宝网店');
           var_dump($rs);
//        include CUR_VIEW_PATH . "Sindex" . DS ."index_text.html";
    }

    public static function tmAction($msg){
               $model=new model('shangpin');
               $a='tabs';
               switch ($msg){
                   case '天猫商城':
                       $b=1;
                       break;
                   case '淘宝网店':
                       $b=17;
                       break;
                   case '京东商城':
                       $b=33;
                       break;
                   case '蘑菇街':
                       $b=49;
                       break;
                   case '其他':
                       $b=65;
                       break;
               }
               $data[$a.($b)]=$model->select("select *from sl_shangpin WHERE szpt='".$msg."'AND sshy='服装饰品' limit 0,1");
               $data[$a.($b+1)]=$model->select("select *from sl_shangpin WHERE szpt='".$msg."'AND sshy='家居用品' limit 0,1");
               $data[$a.($b+2)]=$model->select("select *from sl_shangpin WHERE szpt='".$msg."'AND sshy='家装家饰' limit 0,1");
               $data[$a.($b+3)]=$model->select("select *from sl_shangpin WHERE szpt='".$msg."'AND sshy='美容护理' limit 0,1");
               $data[$a.($b+4)]=$model->select("select *from sl_shangpin WHERE szpt='".$msg."'AND sshy='母婴用品' limit 0,1");
               $data[$a.($b+5)]=$model->select("select *from sl_shangpin WHERE szpt='".$msg."'AND sshy='3C数码' limit 0,1");
               $data[$a.($b+6)]=$model->select("select *from sl_shangpin WHERE szpt='".$msg."'AND sshy='运动户外' limit 0,1");
               $data[$a.($b+7)]=$model->select("select *from sl_shangpin WHERE szpt='".$msg."'AND sshy='食品保健' limit 0,1");
               return $data;
    }
    //主页
    public function indexAction(){
        $r1=self::tmAction('天猫商城');
        $r2=self::tmAction('淘宝网店');
        $r3=self::tmAction('京东商城');
        $r4=self::tmAction('蘑菇街');
        $r5=self::tmAction('其他');
        $model=new model('search2');
        $tm=$model->select("select *from sl_search2 WHERE class='天猫商城'");
        $tb=$model->select("select *from sl_search2 WHERE class='淘宝网店'");
        $jd=$model->select("select *from sl_search2 WHERE class='京东商城'");
        $mgj=$model->select("select *from sl_search2 WHERE class='蘑菇街'");
        $snyg=$model->select("select *from sl_search2 WHERE class='苏宁易购'");
        $m2=new model('gonggao');
        $gonggao=$m2->select("select gg from sl_gonggao");
        $zhinan=$m2->select("select zn from sl_gonggao");
        $wenda=$m2->select("select wd from sl_gonggao");
        include CUR_VIEW_PATH . "Sindex" . DS ."index_index.html";
    }
    //待入驻页面
    public function dairuzhuAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_dairuzhu.html";
    }
    //购买其他网点入口
    public function qitaAction(){
        $model=new model('shangpin');
        $result=$model->select("select *from sl_shangpin");

        include CUR_VIEW_PATH . "Sindex" . DS ."index_qita.html";
    }
    //404错误入口
    public function errorfourAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_404.html";
    }
    //500错误入口
    public function errorfiveAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_500.html";
    }
    //服务市场的入口
    public function fwscAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_fwsc.html";
    }
    //帮助中心入口
    public function helpAction(){
        $model=new model('help');
        $zx=$model->select("select *from sl_help WHERE pname='买家帮助'");
        include CUR_VIEW_PATH . "Sindex" . DS ."index_help.html";
    }
    //帮助中心2级入口
    public function help1Action(){
        $name=$_GET['name']?$_GET['name']:'买家帮助';
        $id=$_GET['id'];
        $model=new model('help');
        $zx=$model->select("select *from sl_help WHERE pname='".$name."'");
        if ($id){
            $result=$model->select("select content from sl_help WHERE id=$id");
            $res=$result[0]['content'];
        }
        include CUR_VIEW_PATH . "Sindex" . DS ."index_help1.html";
    }
    //安全保障
    public function anquanAction(){
        $name=$_GET['name']?$_GET['name']:'店铺转让认证';
        $id=$_GET['id'];
        $model=new model('help');
        $zx=$model->select("select *from sl_help WHERE pname='".$name."'");
        if ($id){
            $result=$model->select("select content from sl_help WHERE id=$id");
            $res=$result[0]['content'];
        }
        include CUR_VIEW_PATH . "Sindex" . DS ."index_anquan.html";
    }
    //服务流程
    public function fuwuAction(){
        $name=$_GET['name']?$_GET['name']:'购买流程';
        $id=$_GET['id'];
        $model=new model('help');
        $zx=$model->select("select *from sl_help WHERE pname='".$name."'");
        if ($id){
            $result=$model->select("select content from sl_help WHERE id=$id");
            $res=$result[0]['content'];
        }
        include CUR_VIEW_PATH . "Sindex" . DS ."index_fuwu.html";
    }
    //体现充值
    public function tixianAction(){
        $name=$_GET['name']?$_GET['name']:'购买流程';
        $id=$_GET['id'];
        $model=new model('help');
        $zx=$model->select("select *from sl_help WHERE pname='".$name."'");
        if ($id){
            $result=$model->select("select content from sl_help WHERE id=$id");
            $res=$result[0]['content'];
        }
        include CUR_VIEW_PATH . "Sindex" . DS ."index_tixian.html";
    }
    //客服咨询页面功能的展示
    public function kefu1Action(){
        $name=$_GET['name']?$_GET['name']:'客服咨询';
        $id=$_GET['id'];
        $model=new model('help');
        $zx=$model->select("select *from sl_help WHERE pname='".$name."'");
        if ($id){
            $result=$model->select("select content from sl_help WHERE id=$id");
            $res=$result[0]['content'];
        }
        include CUR_VIEW_PATH . "Sindex" . DS ."index_kefu.html";
    }
























    //投诉建议中心的入口
    public function jianyiAction(){
        if ($_SERVER['REQUEST_METHOD']=='POST'){
            $data=$_POST;
            $model=new model('jianyi');
            $data['status']='待定';
            $model->insert($data);
            $this->jump('index.php?p=show&c=index&a=jianyi','提交成功',2);
        }
        $model=new model('jianyi');
        $result=$model->select("select name,prize from sl_jianyi WHERE status='通过'");
        include CUR_VIEW_PATH . "Sindex" . DS ."index_jianyi.html";
    }
    //客服团队展示性页面
    public function kefuAction(){
        $model=new model('sl_kefu');
        $result=$model->select("select *from sl_kefu WHERE zt='在线'");
        echo json_encode($result);
    }
    //第一层搜索显示功能
    public function search1Action(){
        $t1=$_POST['t1'];
        $t2=$_POST['t2'];
        switch ($t1){
            case '天猫商城':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tmall.html";
                break;
            case '淘宝网店':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tb.html";
                break;
            case '京东商城':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_jd.html";
                break;
            case '其他商城':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sindex" . DS ."index_qita.html";
                break;
            case '天猫新店':
                echo '皮皮虾';
                break;
            case '企业店铺':
                echo '皮皮虾2号';
                break;
        }
    }
    //第二层搜索功能的实现的方法
    public function search2Action(){
        $t1=$_GET['t1'];
        $t2=$_GET['t2'];
        switch ($t1){
            case '天猫商城':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tmall.html";
                break;
            case '淘宝网店':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tb.html";
                break;
            case '京东商城':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_jd.html";
                break;
            case '蘑菇街':
                echo '皮皮虾二号';
                break;
            case '苏宁易购':
                echo '皮皮虾';
                break;
        }
    }
    //第三层搜索功能的展示页面的实现
    public function search3Action(){
        $t1=$_GET['t1'];
        $t2=$_GET['t2'];
        switch ($t1){
            case '天猫商城':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND (sclx='".$t2."' or sblx='".$t2."')");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tmall.html";
                break;
            case '淘宝网店':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND (sclx='".$t2."' or sblx='".$t2."')");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tb.html";
                break;
            case '京东商城':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND (sclx='".$t2."' or sblx='".$t2."')");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_jd.html";
                break;
            case '蘑菇街':
                echo '皮皮虾二号';
                break;
            case '其他网店':
                echo '皮皮虾';
                break;
        }
    }
    
}