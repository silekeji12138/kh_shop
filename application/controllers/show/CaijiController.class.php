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

    public function textAction()
    {
        include "public/phpQuery/phpQuery.php";
        include "public/QueryList/QueryList.php";
        $rules = array(
            'pf' => array('a', 'text'),
        );
//        $html = "https://rate.taobao.com/user-rate-0025ab586719dfab34560c3823afe693.htm?spm=2013.1.1000126.3.1943fbadeugP7k";
        $html = "https://rate.taobao.com/user-rate-4f0f8abf81dff80710c7becb8bcd99c6.htm?spm=2013.1.1000126.3.2ae541a72n4QYy";
        $data = QueryList::Query($html, $rules)->data;
            $data1 = [];
            foreach ($data as $key=>$value) {
                $value['pf'] = mb_convert_encoding($value['pf'], 'ISO-8859-1', 'utf-8');
                $value['pf']= mb_convert_encoding($value['pf'], 'utf-8', 'GBK');
                print_r($value['pf']);
                echo '<br>';
            }
//        $data[0]['pf'] = mb_convert_encoding($data[0]['pf'], 'ISO-8859-1', 'utf-8');
//        $data[0]['pf']= mb_convert_encoding($data[0]['pf'], 'utf-8', 'GBK');
//        print_r($data);
    }
    public function text1Action(){
        include "public/phpQuery/phpQuery.php";
        phpQuery::newDocumentFile('https://rate.taobao.com/user-rate-d9c64ba0e692d7326dadc12e98ed7a9d.htm?spm=2013.1.1000126.4.7b922cf3N6I7CC');
//        phpQuery::newDocumentFile('https://haier.jd.com/');
        $b=pq('li')->html();
        $b= mb_convert_encoding($b, 'ISO-8859-1', 'utf-8');
        $b= mb_convert_encoding($b, 'utf-8', 'GBK');
        echo $b;
    }

    public function text2Action(){
        $ch = curl_init();
        $url = "http://www.cdsile.com";
        $header = array(
            'CLIENT-IP:192.168.44.61',
            'X-FORWARDED-FOR:192.168.44.61',
        );
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,true);
        $page_content = curl_exec($ch);
        curl_close($ch);
        echo $page_content;
        echo $_SERVER['REMOTE_ADDR'];

    }

}