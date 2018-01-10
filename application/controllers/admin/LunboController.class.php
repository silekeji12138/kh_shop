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
class LunboController extends BaseController
{
    
    // 显示轮播商标
    public function indexAction()
    {
        $page=$_GET['page']?$_GET['page']:1;
        $num=5;
        $act=$num*($page-1);
        $modle=new model('search2');
        $result=$modle->select("select *from sl_search2 limit $act,$num ");
        $sum=$modle->select("select count(*)from sl_search2 ");
        $sum=$sum[0]['count(*)'];

        include LIB_PATH . "Page.class.php";
        $page = new Page($sum, $num, $page, "index.php", array(
            "p" => "admin",
            "c" => "lunbo",
            "a" => "index",
        ));
        $pageinfo = $page->showPage();
        include CUR_VIEW_PATH . "Slunbo" . DS . "lunbo_list.html";
    }
    //标题下拉列表的展示
    public function biaotiAction(){
            $model=new model('canshu');
            $result=$model->select("select u1 from sl_canshu WHERE classid=267");
            include CUR_VIEW_PATH . "Slunbo" . DS . "lunbo_add.html";

    }
    //表单传递过来的页面
    public function biaoti1Action(){
        $filename ="./public/uploads/tubiao/".time().$_FILES['file']['name'];
        move_uploaded_file($_FILES["file"]["tmp_name"],$filename);
        $data=$_POST;
        $data['img']=$filename;
        $data['url']="index.php?p=show&c=index&a=search2"."&t1=".$data['class']."&t2=".$data['biaoti'];
        $model=new  model('search2');
        $number=$model->select("select count(*)from sl_search2 WHERE class='".$data['class']."'");
        $num=$number[0]['count(*)']+1;
        if ($num<10){
            $data['tubiao']="left left0".$num;
        }else{
            $data['tubiao']="left left".$num;
        }
        $model->insert($data);
        $this->jump('index.php?p=admin&c=lunbo&a=index','',0);
    }
    //修改页面
    public function editAction(){
        $id=$_GET['id'];
        $model=new model('search2');
        $result=$model->select("select *from sl_search2 WHERE id=$id");
        $vs=$result[0];
        $model=new model('canshu');
        $result1=$model->select("select u1 from sl_canshu WHERE classid=267");
        include CUR_VIEW_PATH . "Slunbo" . DS . "lunbo_edit.html";
    }
    //修改功能实现的方法
    public function edit1Action(){
        $data=$_POST;
        $id=$data['id'];
        $data1['biaoti']=$data['biaoti'];
        $data1['class']=$data['class'];
        $data1['url']="index.php?p=show&c=index&a=search2"."&t1=".$data['class']."&t2=".$data['biaoti'];
        if ($_FILES['file']['name']==''){
            $data1['img']=$data['tupian'];
        }else{
            $filename ="./public/uploads/tubiao/".time().$_FILES['file']['name'];
            move_uploaded_file($_FILES["file"]["tmp_name"],$filename);
            $data1['img']=$filename;
        }
        $model=new model('search2');
        $model->xg($data1,"id=$id");
        $this->jump('index.php?p=admin&c=lunbo&a=index','',0);
    }
    //删除方法的实现
    public function deleteAction(){
        $id=$_GET['id'];
        $model=new model('search2');
        $model->dl("id=$id");
    }
    
}