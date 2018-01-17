<?php
// 文章模型控制器

header("Content-type: text/html; charset=utf-8");
use QL\QueryList;
class IndexController extends BaseController
{

    public function textAction(){
        include "public/phpQuery/phpQuery.php";
        include "public/QueryList/QueryList.php";
//        include "public/Snoopy/Snoopy.class.php";
        if (1==2) {
            $rules = array(
                'name' => array('strong', 'text'),
                'pf1' => array('.count:first', 'text'),
                'pf2' => array('.count:eq(1)', 'text'),
                'pf3' => array('.count:eq(2)', 'text'),
            );
            $html = "https://detail.tmall.com/item.htm?spm=a221t.1710954.7526515591.6.27f22bbcwdDoAC&acm=lb-zebra-7771-270527.1003.4.1731558&id=527956695986&scm=1003.4.lb-zebra-7771-270527.ITEM_527956695986_1731558";
            $data = QueryList::Query($html, $rules)->data;
            $data1 = [];
            foreach ($data[0] as $key => $value) {
                $value = mb_convert_encoding($value, 'ISO-8859-1', 'utf-8');
                $value = mb_convert_encoding($value, 'utf-8', 'GBK');
                $data1[$key] = $value;
            }
        }else{
            $rules = array(
//                 'name' => array('strong>a[target=_blank]', 'title'),

                'pf' => array('span','text'),
//                'pf1' => array('.count:eq(1)', 'text'),
//                'pf3' => array('.count:eq(2)', 'text'),
            );
            $html = "https://rate.taobao.com/user-rate-0025ab586719dfab34560c3823afe693.htm?spm=2013.1.1000126.3.1943fbadeugP7k";
            $data = QueryList::Query($html, $rules)->data;
//            $data1 = [];
//            foreach ($data[0] as $key => $value) {
//                $value = mb_convert_encoding($value, 'ISO-8859-1', 'utf-8');
//                $value = mb_convert_encoding($value, 'utf-8', 'GBK');
//                $data1[$key] = $value;
////            }
//        抓取到淘宝的店铺的名称的方法
        $data[7]['pf'] = mb_convert_encoding($data[7]['pf'], 'ISO-8859-1', 'utf-8');
        $data[7]['pf'] = mb_convert_encoding($data[7]['pf'], 'utf-8', 'GBK');
        }
        print_r($data);
//        print_r($data[0]);

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
        $user=new model('usersay');
        $user_say=$user->select("select *from sl_usersay limit 0,5");
        include CUR_VIEW_PATH . "Sindex" . DS ."index_index.html";
    }
    //待入驻页面
    public function dairuzhuAction(){
        $modle=new model('search2');
        $tm=$modle->select("select *from sl_search2 WHERE class='天猫商城' limit 0,6");
        $jd=$modle->select("select *from sl_search2 WHERE class='京东商城' limit 0,6");
        $mgj=$modle->select("select *from sl_search2 WHERE class='蘑菇街' limit 0,6");

        $m=new model('cgal');
        $tm1=$m->select("select *from sl_cgal WHERE szpt='天猫商城' limit 0,6");
        $mgj1=$m->select("select *from sl_cgal WHERE szpt='蘑菇街' limit 0,6");
        $jd1=$m->select("select *from sl_cgal WHERE szpt='京东商城' limit 0,6");
        include CUR_VIEW_PATH . "Sindex" . DS ."index_dairuzhu.html";
    }
    //代运营入口方法和页面
    public function dyyAction(){
        if ($_SERVER['REQUEST_METHOD']=='POST'){
            $data=$_POST;
            $model=new model('xqxx');
            $model->insert($data);
            $this->jump('index.php?p=show&c=index&a=dyy','提交成功',2);
        }
        include CUR_VIEW_PATH . "Sindex" . DS ."index_dyy.html";
    }
    //用户说详情页面的进入
    public function usAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_us.html";
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
    //企业服务功能展示方法
    public function qyfwAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_qyfw.html";
    }
    //企业服务代理记账页面展示方法
    public function dljzAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_dljz.html";
    }
    //企业服务店铺升级页面的展示方法
    public function dpsjAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_dpsj.html";
    }
    //企业服务变更服务页面的展示方法
    public function bgfwAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_bgfw.html";
    }
    //帮助类的在线问答的实现的方法
    public function zxwdAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_zxwd.html";
    }
    //公司简介展示型页面
    public function gsjjAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_gsjj.html";
    }
    //商务合作展示型页面的功能
    public function swhzAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_swhz.html";
    }
    //诚聘英才展示型页面的功能
    public function cpycAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_cpyc.html";
    }
    //用户评价客服的功能方法
    public function pjxtAction(){
       $id=$_GET['id'];
       $data1['py']=$_GET['ms'];
       $data1['fx']=$_GET['fx'];
       $uid=$_SESSION['user_id'];
       $time=strtotime(date("Y-m-d",time()+3600*8));
       if ($uid==''){
           echo '0';
       }else{
           $model=new model('pfxt');
           $result=$model->select("select *from sl_pfxt WHERE uid=$uid and kfid=$id and add_time=$time");
           if ($result){
               echo '2';
           }else{
               $data1['uid']=$uid;
               $data1['kfid']=$id;
               $data1['add_time']=$time;
               $model->insert($data1);
               echo '1';
           }
       }
    }
























    //网站咨询展示型页面的功能
    public function wzzxAction(){
        $model=new model('wzzx');
        $num=4;
        $number=$model->select("select count(*)from sl_wzzx");
        $total=ceil($number[0]['count(*)']/$num);

        if ($_SERVER['REQUEST_METHOD']=='POST'){
            $page=$_POST['page'];
            $_GET['page']=$page;
        }else{
            $page=$_GET['page']?$_GET['page']:1;
        }
        if ($page<=1){
            $page=1;
            $_GET['page']=1;
        }
        if ($_GET['page']>$total){
            $page=$total;
            $_GET['page']=$total;
        }
        $min=$page-2;
        $max=$page+5;
        if ($min<=1){
            $min=1;
        };
        if ($max>=$total){
            $max=$total;
        }

        $act=($page-1)*$num;
        $result=$model->select("select *from sl_wzzx limit $act,$num");
        include CUR_VIEW_PATH . "Sindex" . DS ."index_wzzx.html";
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
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tmall.html";
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
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sindex" . DS ."index_qita.html";
                break;
            case '苏宁易购':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy LIKE '%".$t2."%'");
                include CUR_VIEW_PATH . "Sindex" . DS ."index_qita.html";
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
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND (sclx='".$t2."' or sblx='".$t2."')");
                include CUR_VIEW_PATH . "Sindex" . DS ."index_qita.html";
                break;
            case '其他网店':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE sclx='".$t2."' or sblx='".$t2."'");
                include CUR_VIEW_PATH . "Sindex" . DS ."index_qita.html";
                break;
        }
    }
    //代入驻类的商品链接搜索
    public function search4Action(){
           $t1=$_GET['t1'];
           $t3=$_GET['t3'];
        switch ($t1){
            case '天猫商城':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy='".$t3."' ");
                include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tmall.html";
                break;
            case '京东商城':
                $model=new model('shangpin');
                $result=$model->select("select *from sl_shangpin WHERE szpt='".$t1."' AND sshy='".$t3."' ");
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