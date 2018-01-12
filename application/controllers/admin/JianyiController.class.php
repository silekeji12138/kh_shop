<?php
// 文章模型控制器
//===============================================================
//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖保佑             永无BUG
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝= = ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
class JianyiController extends BaseController
{
    
    // 显示轮播商标
    public function indexAction()
    {
        $page=$_GET['page']?$_GET['page']:1;
        $num=5;
        $act=$num*($page-1);
        $modle=new model('jianyi');
        $result=$modle->select("select *from sl_jianyi limit $act,$num ");
        $sum=$modle->select("select count(*)from sl_jianyi ");
        $sum=$sum[0]['count(*)'];


        include LIB_PATH . "Page.class.php";
        $page = new Page($sum, $num, $page, "index.php", array(
            "p" => "admin",
            "c" => "jianyi",
            "a" => "index",
        ));
        $pageinfo = $page->showPage();
        include CUR_VIEW_PATH . "Sjianyi" . DS . "jianyi_list.html";
    }
    //修改状态的方法
    public function changeAction(){
        $id=$_GET['id'];
        $model=new model('jianyi');
        $data['status']='通过';
        $model->xg($data,"id=$id");
        $this->jump('index.php?p=admin&c=jianyi&a=index','',0);
    }
    public function change1Action(){
        $id=$_GET['id'];
        $model=new model('jianyi');
        $data['status']='未通过';
        $model->xg($data,"id=$id");
        $this->jump('index.php?p=admin&c=jianyi&a=index','',0);
    }
    public function deleteAction(){
        $id=$_GET['id'];
        $model=new model('jianyi');
        $model->dl("id=$id");
    }
    //奖品
    public function editAction(){
        $a=$_GET['b'];
        $id=$_GET['id'];
        $model=new model('jianyi');
        $data['prize']=$a;
        $rs=$model->xg($data,"id=$id");
        if ($rs){
            echo '1';
        }
    }
    
}