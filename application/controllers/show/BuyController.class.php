<?php
// 文章模型控制器
<<<<<<< HEAD
=======

>>>>>>> f3825c32007b4ba901592eebdc5ed128917fc7dc
class BuyController extends BaseController
{

    //商城购买的页面=>天猫
    public function tmallAction(){
        $model=new model('shangpin');
        $result=$model->select("select *from sl_shangpin WHERE szpt='天猫商城'");
        include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tmall.html";
    }

    //商城购买的页面=>京东
    public function jdAction(){

        $model=new model('shangpin');
        $result=$model->select("select *from sl_shangpin WHERE szpt='京东商城'");
        include CUR_VIEW_PATH . "Sbuy" . DS ."buy_jd.html";
    }

    //商城购买的页面=>淘宝
    public function tbAction(){
        $model=new model('shangpin');
        $result=$model->select("select *from sl_shangpin WHERE szpt='淘宝网店'");
        include CUR_VIEW_PATH . "Sbuy" . DS ."buy_tb.html";
    }
    //商城出售页面
    public function saleAction(){
        if ($_SERVER['REQUEST_METHOD']=='POST'){
            $data=$_POST;
            $model=new model('sale');
            $model->insert($data);
            $this->jump('index.php?p=show&c=buy&a=sale','提交成功',2);
        }
        include CUR_VIEW_PATH . "Sbuy" . DS ."buy_sale.html";
    }
    //购买商铺的详情页面
    public function xiangxiAction(){
        $id=$_GET['id'];
        $model=new model('shangpin');
        $result=$model->select("select *from sl_shangpin WHERE id=$id");
        $v=$result[0];
        $m2=new model('cjwt');
        $cjwt=$m2->select("select *from sl_cjwt limit 0,4");
        $dtpf=explode(',',$v['dtpf']);
        $ms=$dtpf[0];
        $fwtd=$dtpf[1];
        $fhsd=$dtpf[2];
        $m3=$model->select("select *from sl_shangpin WHERE szpt='".$v['szpt']."' and (sshy='".$v['sshy']."' or sblx='".$v['sblx']."') limit 0,2");

        $dtpf=new model('dtpf');
        $m4=$dtpf->select("select *from sl_dtpf WHERE shangpinbianhao='".$v['bianhao']."'");
        include CUR_VIEW_PATH . "Sbuy" . DS ."buy_xiangxi.html";
    }
    //
    public static function syptAction(){
        $s=new  model('canshu');
        $vs=$s->select("select u1 from sl_canshu WHERE classid=278 ORDER BY u4 ASC ");
        return $vs;
    }

    public static function sysclxAction(){
        $s1=new  model('canshu');
        $vs1=$s1->select("select u1 from sl_canshu WHERE classid=271");
        return $vs1;
    }

    public static function sblxAction(){
        $s2=new  model('canshu');
        $vs2=$s2->select("select u1 from sl_canshu WHERE classid=244");
        return $vs2;
    }

    public static function sshyAction(){
        $s3=new  model('canshu');
        $vs3=$s3->select("select u1 from sl_canshu WHERE classid=267");
        return $vs3;
    }
    //浏览history
    public static function historyAction(){
        $model=new model('shangpin');
        $result=$model->select("SELECT * FROM sl_shangpin 
        WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM sl_shangpin)))  
        ORDER BY id LIMIT 6");
        return $result;
    }
    //随机客服
    public static function kefuAction(){
        $model=new model('kefu');
        $result=$model->select("SELECT * FROM sl_kefu 
        WHERE id >= (SELECT floor(RAND() * (SELECT MAX(id) FROM sl_kefu))) AND zt='在线'
        ORDER BY id LIMIT 1");
        return $result;
    }
    //地区
    public static function diquAction(){
        $s4=new  model('canshu');
        $vs4=$s4->select("select u1 from sl_canshu WHERE classid=262");
        return $vs4;
    }
    //纳税资质
    public static function zizhiAction(){
        $s5=new  model('canshu');
        $vs5=$s5->select("select u1 from sl_canshu WHERE classid=330");
        return $vs5;
    }
    //带货
    public static function daihuoAction(){
        $s6=new  model('canshu');
        $vs6=$s6->select("select u1 from sl_canshu WHERE classid=275");
        return $vs6;
    }
    //货源
    public static function huoyuanAction(){
        $s7=new  model('canshu');
        $vs7=$s7->select("select u1 from sl_canshu WHERE classid=318");
        return $vs7;
    }
    //商标类型
    public static function sblx1Action(){
        $s8=new  model('canshu');
        $vs8=$s8->select("select u1 from sl_canshu WHERE classid=332");
        return $vs8;
    }
    //商标过户
    public static function sbghAction(){
        $s9=new  model('canshu');
        $vs9=$s9->select("select u1 from sl_canshu WHERE classid=334");
        return $vs9;
    }
    //团队转让
    public static function tdzrAction(){
        $s10=new  model('canshu');
        $vs10=$s10->select("select u1 from sl_canshu WHERE classid=336");
        return $vs10;
    }
    //扣分情况
    public static function kfqkAction(){
        $s11=new  model('canshu');
        $vs11=$s11->select("select u1 from sl_canshu WHERE classid=338");
        return $vs11;
    }
    //店铺状态
    public static function dpztAction(){
        $s12=new  model('canshu');
        $vs12=$s12->select("select u1 from sl_canshu WHERE classid=347");
        return $vs12;
    }
    //经验传授
    public static function jyAction(){
        $s13=new  model('canshu');
        $vs13=$s13->select("select u1 from sl_canshu WHERE classid=344");
        return $vs13;
    }
    //测试
    public function textAction(){
        echo $_SERVER['PHP_SELF'];
        echo '<br>';
        if ($_SERVER['HTTP_REFERER']==''){
            echo 1;
        }
        echo $_SERVER['HTTP_REFERER'];
        echo '<br>';
        $name=$_SERVER['HTTP_REFERER'];
        $array=explode('&', $name);
        $a=substr($array[2],2,7);
        echo $a;
    }

    public function text1Action(){
        include CUR_VIEW_PATH . "Sbuy" . DS ."buy_text.html";
    }

    public function text2Action(){
        var_dump($_POST);
    }

    //企业淘宝购买详情页面
    public function qytb1Action(){

        $id=$_GET['id'];
        $model=new model('qytb');
        $result=$model->select("select *from sl_qytb WHERE id=$id");
        $v=$result[0];
        $dtpf=explode(',',$v['dtpf']);
        $ms=$dtpf[0];
        $fwtd=$dtpf[1];
        $fhsd=$dtpf[2];
        $m3=$model->select("select *from sl_shangpin WHERE  sshy='".$v['sshy']."'  limit 0,2");
        $m2=new model('cjwt');
        $cjwt=$m2->select("select *from sl_cjwt limit 0,4");
        include CUR_VIEW_PATH . "Sbuy" . DS ."buy_qytb1.html";
    }


    public function search7Action(){
        echo '保留,1.网店编号 2.关键字指的那些数据?待定';
    }


    
}