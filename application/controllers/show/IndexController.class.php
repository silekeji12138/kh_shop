<?php
// 文章模型控制器
class IndexController extends BaseController
{
    public function textAction(){
        include CUR_VIEW_PATH . "Spublic" . DS ."foot.html";
    }
    //主页
    public function indexAction(){
        $model=new model('search2');
        $tm=$model->select("select *from sl_search2 WHERE class='天猫商城'");
        $tb=$model->select("select *from sl_search2 WHERE class='淘宝网店'");
        $jd=$model->select("select *from sl_search2 WHERE class='京东商城'");
        $mgj=$model->select("select *from sl_search2 WHERE class='蘑菇街'");
        $snyg=$model->select("select *from sl_search2 WHERE class='苏宁易购'");
        include CUR_VIEW_PATH . "Sindex" . DS ."index_index.html";
    }
    //待入驻页面
    public function dairuzhuAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_dairuzhu.html";
    }
    //购买其他网点入口
    public function qitaAction(){
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
        include CUR_VIEW_PATH . "Sindex" . DS ."index_help.html";
    }
    //投诉建议中心的入口
    public function jianyiAction(){
        include CUR_VIEW_PATH . "Sindex" . DS ."index_jianyi.html";
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