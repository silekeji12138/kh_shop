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
        include CUR_VIEW_PATH . "Sbuy" . DS ."buy_sale.html";
    }


    
}