<?php
// 文章模型控制器
 header("Content-type: text/html; charset=utf-8");
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

        $m3=$model->select("select *from sl_shangpin WHERE szpt='".$v['szpt']."' and (sshy='".$v['sshy']."' or sblx='".$v['sblx']."') limit 0,2");

        include CUR_VIEW_PATH . "Sbuy" . DS ."buy_xiangxi.html";
    }
    //
    public static function syptAction(){
        $s=new  model('sypt');
        $vs=$s->select("select *from sl_sypt");
        return $vs;
    }


    
}