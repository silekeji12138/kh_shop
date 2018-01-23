<?php
// 文章模型控制器

class JaController extends BaseController
{
       public static function mAction($message){
           $message='健身房是否金士顿防水防汗我的是佛都会发生的呢哦我复活我发和我复活oh';
           $a=urlencode(base64_encode($message));
           return $a;
       }

}