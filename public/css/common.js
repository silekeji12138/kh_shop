

//网店类型切换
jQuery(function(jq){
    var rr02 = jq('#bbb');
    var conr02 = rr02.find('div.con02'),
        conr01 = conr02[0],
        btnWr02 = rr02.find('> div.btns02'),
        btnPr02 = btnWr02.find('a.up02'),
        btnNr02 = btnWr02.find('a.down02');

    var lisr02 = conr02.find('.left02');

    var pnumr02 = 10, numr02 = lisr02.length;
    if(numr02 <= pnumr02)return;

    var owr02 = lisr02[1].offsetLeft - lisr02[0].offsetLeft,
        idxArear02 = [0, numr02 - pnumr02],
        idxr02 = 0;

    function updateNum(n){
        if (n > idxArear02[1] || n < idxArear02[0]) {return;}

        btnPr02[((n == 0)?'add':'remove') + 'Class']('uN');
        btnNr02[((n == idxArear02[1])?'add':'remove') + 'Class']('dN');

        idxr02 = n;
        conr02.stop().animate({left: -n * owr02},120);
    }

    btnPr02.click(function(){
        updateNum(idxr02 - 1);
        return false;
    });
    btnNr02.click(function(){
        updateNum(idxr02 + 1);
        return false;
    });
});
jQuery(function(jq){
    var rr = jq('#aaa');
    var conr = rr.find('div.con01'),
        conr0 = conr[0],
        btnWr = rr.find('> div.btns01'),
        btnPr = btnWr.find('a.up01'),
        btnNr = btnWr.find('a.down01');

    var lisr = conr.find('.left01');

    var pnumr = 10, numr = lisr.length;
    if(numr <= pnumr)return;

    var owr = lisr[1].offsetLeft - lisr[0].offsetLeft,
        idxArear = [0, numr - pnumr],
        idxr = 0;

    function updateNum(n){
        if (n > idxArear[1] || n < idxArear[0]) {return;}

        btnPr[((n == 0)?'add':'remove') + 'Class']('uN');
        btnNr[((n == idxArear[1])?'add':'remove') + 'Class']('dN');

        idxr = n;
        conr.stop().animate({left: -n * owr},120);
    }

    btnPr.click(function(){
        updateNum(idxr - 1);
        return false;
    });
    btnNr.click(function(){
        updateNum(idxr + 1);
        return false;
    });
});
jQuery(function(jq){
    var rr03 = jq('#ccc');
    var conr03 = rr03.find('div.con03'),
        conr01 = conr03[0],
        btnWr03 = rr03.find('> div.btns03'),
        btnPr03 = btnWr03.find('a.up03'),
        btnNr03 = btnWr03.find('a.down03');

    var lisr03 = conr03.find('.left03');

    var pnumr03 = 10, numr03 = lisr03.length;
    if(numr03 <= pnumr03)return;

    var owr03 = lisr03[1].offsetLeft - lisr03[0].offsetLeft,
        idxArear03 = [0, numr03 - pnumr03],
        idxr03 = 0;

    function updateNum(n){
        if (n > idxArear03[1] || n < idxArear03[0]) {return;}

        btnPr03[((n == 0)?'add':'remove') + 'Class']('uN');
        btnNr03[((n == idxArear03[1])?'add':'remove') + 'Class']('dN');

        idxr03 = n;
        conr03.stop().animate({left: -n * owr03},120);
    }

    btnPr03.click(function(){
        updateNum(idxr03 - 1);
        return false;
    });
    btnNr03.click(function(){
        updateNum(idxr03 + 1);
        return false;
    });
});


jQuery(function(jq){
    var rr04 = jq('#ddd');
    var conr04 = rr04.find('div.con04'),
        conr01 = conr04[0],
        btnWr04 = rr04.find('> div.btns04'),
        btnPr04 = btnWr04.find('a.up04'),
        btnNr04 = btnWr04.find('a.down04');

    var lisr04 = conr04.find('.left04');

    var pnumr04 = 10, numr04 = lisr04.length;
    if(numr04 <= pnumr04)return;

    var owr04 = lisr04[1].offsetLeft - lisr04[0].offsetLeft,
        idxArear04 = [0, numr04 - pnumr04],
        idxr04 = 0;

    function updateNum(n){
        if (n > idxArear04[1] || n < idxArear04[0]) {return;}

        btnPr04[((n == 0)?'add':'remove') + 'Class']('uN');
        btnNr04[((n == idxArear04[1])?'add':'remove') + 'Class']('dN');

        idxr04 = n;
        conr04.stop().animate({left: -n * owr04},120);
    }

    btnPr04.click(function(){
        updateNum(idxr04 - 1);
        return false;
    });
    btnNr04.click(function(){
        updateNum(idxr04 + 1);
        return false;
    });
});

jQuery(function(jq){
    var rr05 = jq('#eee');
    var conr05 = rr05.find('div.con05'),
        conr01 = conr05[0],
        btnWr05 = rr05.find('> div.btns05'),
        btnPr05 = btnWr05.find('a.up05'),
        btnNr05 = btnWr05.find('a.down05');

    var lisr05 = conr05.find('.left05');

    var pnumr05 = 10, numr05 = lisr05.length;
    if(numr05 <= pnumr05)return;

    var owr05 = lisr05[1].offsetLeft - lisr05[0].offsetLeft,
        idxArear05 = [0, numr05 - pnumr05],
        idxr05 = 0;

    function updateNum(n){
        if (n > idxArear05[1] || n < idxArear05[0]) {return;}

        btnPr05[((n == 0)?'add':'remove') + 'Class']('uN');
        btnNr05[((n == idxArear05[1])?'add':'remove') + 'Class']('dN');

        idxr05 = n;
        conr05.stop().animate({left: -n * owr05},120);
    }

    btnPr05.click(function(){
        updateNum(idxr05 - 1);
        return false;
    });
    btnNr05.click(function(){
        updateNum(idxr05 + 1);
        return false;
    });
});

//搜索分类切换
$(".search-list li a").click(function(){
    $(".search-list li").removeClass("active");
    $(this).parents("li").addClass("active");
});
//新闻轮播时间
$('.vertical').carousel({
  interval: 5000
});

//精品网店左侧伸缩
$(".tab-back-tt").hover(function(){

		var b = $(this).attr("href");
		$(".show-tab-c").hide();
		$(b).show();
		$(".tab-back-c").removeClass("active");
		$(".tab-back-tt").removeClass("active");
		$(this).parent(".tab-back-c").addClass("active");
		$(this).addClass("active");
        if($(this).parent(".tab-back-c").find(".tab-back-list").is(":hidden"))
        {
		  $(".tab-back-list").slideUp("slow");
          $(this).parent(".tab-back-c").find(".tab-back-list").slideDown("slow");
        }else{
          $(this).parent(".tab-back-c").find(".tab-back-list").slideDown("slow");
            }
});
//精品网店顶部菜单显示
$(".shop-tab li a").hover(function(){

		var c = $(this).attr("href");
		$(this).parents(".show-tab-c").find(".tab-pane").removeClass("active");
		$(this).parents(".carousel-inner").find("a").removeClass("active");
		$(this).addClass("active");
		$(c).addClass("active");
});
//返回顶部动画
$(document).ready(function() {
        $('.back-top').click(function() {
            if(location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var $target = $(this.hash);
                $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
                if ($target.length) {
                    var targetOffset = $target.offset().top;
                    $('html,body').animate({
                        scrollTop: targetOffset
                    }, 1000);
                    return false;
                }
            }
        });

    });


//出售网店页面网店选择
$(".sell-icon-c").click(function(){
    $(".sell-icon-c").removeClass("active");
    $(this).addClass("active");
});
//客服中心
$('.kf-slide').carousel({
  interval: 20000000
})


//购买网店条件选择JS
$(".purchase-ul li a").click(function(){
    $(this).parents(".purchase-ul").find("a").removeClass("active");
    $(this).addClass("active");
})
//企业服务-变更服务套餐选择
$(".bg-back-tt").click(function(){
    $(".bg-back-tt").removeClass("active");
    $(this).addClass("active");
})
//企业升级条件选择JS
$(".sj-btn").click(function(){
    $(this).parents(".sj-btn-c").find("a").removeClass("active");
    $(this).addClass("active");
})



 window.onresize=function(){
            location.reload();
        };

var oTop = $(".navbarExample").offset().top;
var sTop = 0;
$(window).scroll(function(){
sTop = $(this).scrollTop();

if(sTop >= oTop){
$(".navbarExample").css({"position":"fixed","top":"0",});
$(".navbarExample").addClass("active");
$('.margin-top').css({'display':'block'});
$('body').addClass("body-padding");
}else{
$(".navbarExample").css({"position":"static"});
$(".navbarExample").removeClass("active");
$('body').removeClass("body-padding");
}
});
var oTop11 = $("#one").offset().top;
var sTop11 = 0;
$(window).scroll(function(){
sTop11 = $(this).scrollTop();

if(sTop11 >= (oTop11-120)){

     $('.gm-tabs li').removeClass('active');
	 $('.gm-tabs .one').addClass('active');
}else{

}
});
var oTop2 = $("#two").offset().top;
var sTop2 = 0;
$(window).scroll(function(){
sTop2 = $(this).scrollTop();

if(sTop2 >= (oTop2-120)){

     $('.gm-tabs li').removeClass('active');
	 $('.gm-tabs .two').addClass('active');
}else{

}
});
var oTop3 = $("#three").offset().top;
var sTop3 = 0;
$(window).scroll(function(){
sTop3 = $(this).scrollTop();

if(sTop3 >= (oTop3-120)){

     $('.gm-tabs li').removeClass('active');
	 $('.gm-tabs .three').addClass('active');
}else{

}
});
var oTop4 = $("#four").offset().top;
var sTop4 = 0;
$(window).scroll(function(){
sTop4 = $(this).scrollTop();

if(sTop4 >= (oTop4-120)){

     $('.gm-tabs li').removeClass('active');
	 $('.gm-tabs .four').addClass('active');
}else{

}
});
