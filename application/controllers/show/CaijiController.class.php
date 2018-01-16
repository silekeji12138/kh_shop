<?php
// 文章模型控制器
use QL\QueryList;
class CaijiController extends BaseController
{


    public function indexAction(){
        include "public/phpQuery/phpQuery.php";
        include "public/QueryList/QueryList.php";
        $hj = QueryList::Query('https://detail.tmall.com/item.htm?spm=a220m.1000858.1000725.1.62732b1arLtQoe&id=556827275205&skuId=3447029277085&areaId=510100&user_id=106852162&cat_id=50025829&is_b=1&rn=058c546adf3dbfddddc362bf7206789b',
            array("url"=>array('strong','text')));
        $data = $hj->getData(function($x){
            return $x['url'];
        });
        $data[0] = mb_convert_encoding($data[0],'ISO-8859-1','utf-8');
        $data[0] = mb_convert_encoding($data[0],'utf-8','GBK');
        print_r($data[0]);
    }
    
}