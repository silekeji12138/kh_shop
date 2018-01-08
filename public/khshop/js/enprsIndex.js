
function trim(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}
function xuan(can,ses) {
	var c = ses;
	for(var i=0;i<c.length;i++) {
		if(c[i].value == can) {
			c[i].selected = true;
		}
	}
}

/*********************跳转*******************/
function formsearch(pid) {
    document.getElementById("pageNo").value = pid;
    hrefgo('');
}
//跳转到:
function fytz() {
	var fy = document.getElementById("itzfy").value;
	document.getElementById("pageNo").value = fy;
    hrefgo('');
}

/*********************排序*******************/
//信用排序(价格及上架时间清空):
function xyfsOrder(type) {
	document.getElementById("xinyuOrder").value = type;
	document.getElementById("pxfs").value = "";
	document.getElementById("sjpx").value = "";
	hrefgo('1');
}
function xyfsOrder_T(type) {
	document.getElementById("xinyuOrder").value = type;
	hrefgo('1');
}
//2014-12-08:
function setDeft() {
	document.getElementById("xinyuOrder").value = "";
	document.getElementById("pxfs").value = "";
	document.getElementById("sjpx").value = "";
	hrefgo('1');
}
//价格排序(信用及上架时间清空):
function jgfsOrder(type) {
	document.getElementById("pxfs").value = type;
	document.getElementById("xinyuOrder").value = "";
	document.getElementById("sjpx").value = "";
	hrefgo('1');
}
function jgfsOrder_T(type) {
	document.getElementById("pxfs").value = type;
	hrefgo('1');
}
//上架时间排序(信用及价格清空):
function sjpxOrder(type) {
	document.getElementById("sjpx").value = type;
	document.getElementById("xinyuOrder").value = "";
	document.getElementById("pxfs").value = "";
	hrefgo('1');
}
//排序恢复默认:
function OrderResume() {
	document.getElementById("xinyuOrder").value = "";
	document.getElementById("pxfs").value = "";
	hrefgo('1');
}
function viewOnload(type) {
	document.getElementById("view").value = type;
	hrefgo('');
}

/*********************选择*******************/
//New150315,价格选择:
function jiaclick(sg) {

	if(sg == "1") {
		document.getElementById("stPrice").value = 0;
		document.getElementById("enPrice").value = 10000;
	}else if(sg == "2") {
		document.getElementById("stPrice").value = 10000;
		document.getElementById("enPrice").value = 30000;
	}else if(sg == "3") {
		document.getElementById("stPrice").value = 30000;
		document.getElementById("enPrice").value = 50000;
	}else if(sg == "4") {
		document.getElementById("stPrice").value = 50000;
		document.getElementById("enPrice").value = 100000;
	}else if(sg == "5") {
		document.getElementById("stPrice").value = 100000;
		document.getElementById("enPrice").value = "";
	}
	document.getElementById("ijiasg").value = sg;
	hrefgo('1');
}
function jiaXn(sg) {
	
	if(sg != null && sg != "" && sg != "10") {
		$('#ijiakuai'+sg).addClass('cur');
	}
}
function jiaQx() {
	
	document.getElementById("stPrice").value = "";
	document.getElementById("enPrice").value = "";
	document.getElementById("ijiasg").value = "";
	hrefgo('1');
}

function lujiaGo() {
	var lusprice = trim(document.getElementById("ilusprice").value);
	var lueprice = trim(document.getElementById("ilueprice").value);
	if(lusprice != "" || lueprice != "") { //填写了筛选框中的价格,以此为准:
		document.getElementById("ijiasg").value = "10"; //手填价格;
		document.getElementById("stPrice").value = lusprice;
		document.getElementById("enPrice").value = lueprice;
	}else {
		var jiasg = document.getElementById("ijiasg").value;
    	if(jiasg == "10") { //筛选-取消:
    		document.getElementById("stPrice").value = "";
        	document.getElementById("enPrice").value = "";
    		document.getElementById("ijiasg").value = "";
    	}
	}
	hrefgo('1');
}

function xinYuGo(xinyu) {
	if(xinyu != "") {
		var xn = trim(document.getElementById("xinyu").value);
		if(xn == xinyu) { //选中之后的再次点击,则取消
			xinyu = "";
			$('#xyfrom').val(""); //范围值回到两端;
	        $('#ixyto').val("");
		}else {
			if(xinyu == "2") {
				$('#xyfrom').val("0");
		        $('#ixyto').val("4");
			}else if(xinyu == "3") {
				$('#xyfrom').val("5");
		        $('#ixyto').val("9");
			}else if(xinyu == "4") {
				$('#xyfrom').val("10");
		        $('#ixyto').val("14");
			}
		}
	}else {
		//清空:
		$('#xyfrom').val("");
        $('#ixyto').val("");
	}
	document.getElementById("xinyu").value = xinyu;
	hrefgo('1');
}
function xinYuXn(xinyu) {
	//$('#ixinyu'+xinyu).addClass('cur').siblings('a').removeClass('cur');
	
	var xyfrom = trim(document.getElementById("xyfrom").value);
	var xyto = trim(document.getElementById("ixyto").value);
	var sres = 0;
	if(xinyu == "2") { //钻:
		if(xyfrom == "0" && xyto == "4") {
			sres = 1;
		}
	}else if(xinyu == "3") { //皇冠:
		if(xyfrom == "5" && xyto == "9") {
			sres = 1;
		}
	}else if(xinyu == "4") { //金冠:
		if(xyfrom == "10" && xyto == "14") {
			sres = 1;
		}
	}
	if(sres == 1) {
		$('#ixinyu'+xinyu).addClass('cur');
	}
}

function leimuGo(leimu) {
	if(leimu != "") {
		var xn = trim(document.getElementById("isp_sort").value);
		if(xn == leimu) { //选中之后的再次点击,则取消
			leimu = "";
		}
	}
	document.getElementById("isp_sort").value = leimu;
	hrefgo('1');
}

function leverRangeGo() {
	var xyfrom = trim(document.getElementById("xyfrom").value);
	var xyto = trim(document.getElementById("ixyto").value);
	if(xyfrom == "" && xyto == "") {
		$('#xyfrom').val("0");
        $('#ixyto').val("14");
	}
	hrefgo('1');
}

//2015-09-22:
function qiType(qtype) {
	if(qtype != "") {
		var xn = trim(document.getElementById("iqitype").value);
		if(xn == qtype) { //选中之后的再次点击,则取消
			$('#iqitype').val("");
		}else {
			$('#iqitype').val(qtype);
		}
	}else {
		$('#iqitype').val("");
	}
	hrefgo('1');
}
function qiGohu(qgohu) {
	if(qgohu != "") {
		var xn = trim(document.getElementById("iqigohu").value);
		if(xn == qgohu) { //选中之后的再次点击,则取消
			$('#iqigohu').val("");
		}else {
			$('#iqigohu').val(qgohu);
		}
	}else {
		$('#iqigohu').val("");
	}
	hrefgo('1');
}
/*********************其它*******************/
function showRangeRuler(xvalf,xvalt) {
	$("#range").ionRangeSlider({
    	type: "double",
        grid: true,
        grid_num: 1,
        step: 1,
        from: (xvalf!='')?xvalf:0,
        to: (xvalt!='')?xvalt:14,
        hide_min_max: true,
        values: [
            "1钻", "2钻", "3钻", "4钻", "5钻",
            "1皇冠", "2皇冠", "3皇冠", "4皇冠", "5皇冠",
            "1金冠", "2金冠", "3金冠", "4金冠", "5金冠"
        ],
        b_values: [
            "钻<img src=\"images/zuan.png\">", "", "", "", "",
            "皇冠<img src=\"images/guan.png\">", "", "", "", "",
            "金冠<img src=\"images/guan02.png\">", "", "", "", ""
        ],
        onFinish: function (data) {
        	var fval = data.from;
        	var tval = data.to;
            console.log(fval);
            console.log(tval);
            $('#xyfrom').val(fval);
            $('#ixyto').val(tval);
        }
    });
}
function hideRangeRuler() {
    $('.scopeCredit').toggle();
    $('.levelRangeOk').toggle();
    //选择信用范围:
    if($('.scopeCredit').css('display') == 'block') {
    	$('#xnyuzk').val('1');
        //$('.scopeCredit').after('<input class="levelRangeOk" type="button" value="确认" onclick="hrefgo(\'1\')" />');
    }else {
    	$('#xnyuzk').val('2');
    	//$('.levelRangeOk').remove();
    }
    rImgResetH2();
}
function noRangeRuler() {
    
	$('.scopeCredit').toggle();
    $('.levelRangeOk').toggle();
}
function showRangeRes(xvalf,xvalt) {
	
	if(xvalf == "" || xvalt == "") {
		return ;
	}
	
	xvalf = caseRuler(xvalf);
	xvalt = caseRuler(xvalt);
	if(xvalf != "" && xvalf == xvalt) {
		return xvalf;
	}else if(xvalf != "" && xvalt != "" && xvalf != xvalt) {
		return xvalf+"-"+xvalt;
	}	
}
function caseRuler(casev) {
	var cres = "";
	switch (casev) {
		case "0":
			cres = "1钻";
			break;
		case "1":
			cres = "2钻";
			break;
		case "2":
			cres = "3钻";
			break;
		case "3":
			cres = "4钻";
			break;
		case "4":
			cres = "5钻";
			break;
		case "5":
			cres = "1皇冠";
			break;
		case "6":
			cres = "2皇冠";
			break;
		case "7":
			cres = "3皇冠";
			break;
		case "8":
			cres = "4皇冠";
			break;
		case "9":
			cres = "5皇冠";
			break;
		case "10":
			cres = "1金冠";
			break;
		case "11":
			cres = "2金冠";
			break;
		case "12":
			cres = "3金冠";
			break;
		case "13":
			cres = "4金冠";
			break;
		case "14":
			cres = "5金冠";
			break;
	}
	return cres;
}

function showQiType(qtype) {
	var rtnStr = "";
	if(qtype == "1") {
		rtnStr = "等待升级企业店铺";
	}else if(qtype == "2") {
		rtnStr = "已是企业店铺";
	}
	return rtnStr;
}
function showQiGohu(qgohu) {
	var rtnStr = "";
	if(qgohu == "2") {
		rtnStr = "正常过户";
	}else if(qgohu == "3") {
		rtnStr = "公司已注销";
	}else if(qgohu == "4") {
		rtnStr = "公司正常但不提供过户";
	}
	return rtnStr;
}

function okBusiDate() {    
    var sval = $('#startDateBusi').val();
    var eval = $('#endDateBusi').val();
    var xval = "";
    if(sval != "" || eval != "") {
    	if(sval != "" && eval != "") {
    		var isval = parseInt(sval);
    		var ieval = parseInt(eval);
    		if(ieval < isval) {
    			alert("搜索结束日期不能早于起始日期！");
    			return ;
    		}
    		sval = sval.substring(2);
    		eval = eval.substring(2);
    	}
    	xval = sval+"~"+eval;
    }
    $('#ishopHour').val(xval);
    hrefgo('1');
}
//您的选择:
function yourSel() {
    //选择值之后显示:
    if($('.yourSel').css('display') == 'none') {
    	$('.yourSel').css('display','block');
    }
}
//2015-08-07:
function rdMoval(sg,val) {
	
	if(sg == "1") {
		document.getElementById("isdaih").value = val;
	}else if(sg == "2") {
		document.getElementById("ishuoy").value = val;
	}
}

/*********************搜索*******************/
//New150315,确定搜索:
function searchQue() {
	
	hrefgo('1');
}
//2015-08-07:
function searchQueMb() {
	
	var stZhnbi = trim(document.getElementById("stZhnbi").value);
	var enZhnbi = trim(document.getElementById("enZhnbi").value);
	if(stZhnbi != "" || enZhnbi != "") {
		document.getElementById("ixunibi").value = stZhnbi+"%~"+enZhnbi+"%"; //eg:1%~10%
	}
	hrefgo('1');
}
function shopsCheck() {
	
	/*var sid = trim(document.getElementById("sid").value);
	if(isNaN(sid) || sid.indexOf(' ') > -1) {
	    alert('请正确填写编号！');
	    return false;
	}*/ //2013-05-02;
	
	var stPrice = trim(document.getElementById("stPrice").value);
	var enPrice = trim(document.getElementById("enPrice").value);
	if(isNaN(stPrice) || isNaN(enPrice)) {
	    alert('价格请填写数字！');
	    return false;
	}
  return true;
}

function hrefgo(pcflag)
{
	if(shopsCheck() == false) {
		return false;
	}
	
	var actionurl = trim(document.getElementById("index").action); //eg:transIndexNew.html
	actionurl = actionurl.replace(".html","");
	
	var spType = trim(document.getElementById("spType").value);
	var hrefurl = actionurl + "-"+spType;
	
	var xinyu = trim(document.getElementById("xinyu").value);
	hrefurl += "-"+xinyu;
	
	var xyfrom = trim(document.getElementById("xyfrom").value);
	hrefurl += "-"+xyfrom;
	
	var xyto = trim(document.getElementById("ixyto").value);
	hrefurl += "-"+xyto;
	
	var xnyuzk = trim(document.getElementById("xnyuzk").value);
	hrefurl += "-"+xnyuzk;
	
	var isp_sort = trim(document.getElementById("isp_sort").value);
	hrefurl += "-"+isp_sort;
	
	var stPrice = trim(document.getElementById("stPrice").value);
	hrefurl += "-"+stPrice;
	
	var enPrice = trim(document.getElementById("enPrice").value);
	hrefurl += "-"+enPrice;
	
	var ijiasg = trim(document.getElementById("ijiasg").value); //价格标签标识;
	hrefurl += "-"+ijiasg;
	
	var isarea = trim(document.getElementById("isarea").value);
	if(isarea == "地区范围" || isarea == "地区不限") {
		isarea = "";
	}
	hrefurl += "-"+((isarea != "") ? encodeURI(encodeURI(isarea)) : "");
	
	var ishopHour = trim(document.getElementById("ishopHour").value);
	if(ishopHour == "创店时间" || ishopHour == null) {
		ishopHour = "";
	}
	hrefurl += "-"+ishopHour;
	
	var stHaopn = trim(document.getElementById("stHaopn").value);
	if(stHaopn == "好评率" || stHaopn == "不限好评") {
		stHaopn = "";
	}
	if(stHaopn != "") {
		stHaopn = stHaopn.replace(/%/g, "");
	}
	hrefurl += "-"+((stHaopn != "") ? encodeURI(encodeURI(stHaopn)) : "");
	
	var ixunibi = trim(document.getElementById("ixunibi").value);
	if(ixunibi == "虚拟比例" || ixunibi == "不限") {
		ixunibi = "";
	}
	if(ixunibi != "") {
		ixunibi = ixunibi.replace(/%/g, "");
	}
	hrefurl += "-"+((ixunibi != "") ? encodeURI(encodeURI(ixunibi)) : "");
	
	var ispingf = trim(document.getElementById("ispingf").value);
	if(ispingf == "动态评分" || ispingf == "不限") {
		ispingf = "";
	}
	if(ispingf != "") {
		ispingf = ispingf.replace("分以上", "");
		ispingf = ispingf.replace("分", "");
	}
	hrefurl += "-"+ispingf;
	
	var iskouf = trim(document.getElementById("iskouf").value);
	if(iskouf == "扣分情况" || iskouf == "不限") {
		iskouf = "";
	}
	hrefurl += "-"+((iskouf != "") ? encodeURI(encodeURI(iskouf)) : "");
	
	var isdaih = trim(document.getElementById("isdaih").value);
	if(isdaih == "是否带货" || isdaih == "不限") {
		isdaih = "";
	}
	hrefurl += "-"+((isdaih != "") ? encodeURI(encodeURI(isdaih)) : "");
	
	var ishuoy = trim(document.getElementById("ishuoy").value);
	if(ishuoy == "提供货源" || ishuoy == "不限") {
		ishuoy = "";
	}
	hrefurl += "-"+((ishuoy != "") ? encodeURI(encodeURI(ishuoy)) : "");
	
	//关键字/编号:
	var sid = trim(document.getElementById("sid").value);
	if(sid == "填写关键词或网店编号") {
		sid = "";
	}
	hrefurl += "-"+((sid != "") ? encodeURI(encodeURI(sid)) : "");
	
	//'更多'展开:
	var izhank = trim(document.getElementById("izhank").value);
	hrefurl += "-"+izhank;
	
	//多选:
	hrefurl += "-";
	
	//特殊资质,预留:
	hrefurl += "-";
	
	//排序,信用等级:
	var xinyuOrder = trim(document.getElementById("xinyuOrder").value);
	hrefurl += "-"+xinyuOrder;
	
	//出售价格:
	var pxfs = trim(document.getElementById("pxfs").value);
	hrefurl += "-"+pxfs;
	
	//上架时间:
	var sjpx = trim(document.getElementById("sjpx").value);
	hrefurl += "-"+sjpx;
	
	//利润排序,预留:
	hrefurl += "-";
	
	//营业额排序,预留:
	hrefurl += "-";
	
	//店铺状态,2015-09-22:
	var qitype = trim(document.getElementById("iqitype").value);
	hrefurl += "-"+qitype;
	//actionurl = actionurl+"?ssBean.qitype="+qitype;
	//过户配合:
	var qigohu = trim(document.getElementById("iqigohu").value);
	hrefurl += "-"+qigohu;
	//actionurl = actionurl+"&ssBean.qigohu="+qigohu;
	
	//分页码:
	if(pcflag != null && pcflag == "1") {
		//hrefurl += "&page=1";
		hrefurl += "-1";
	}else {
		var pageNo = trim(document.getElementById("pageNo").value);
		//hrefurl += (pageNo != "") ? "&page="+pageNo : "";
		hrefurl += "-"+pageNo;
	}
	hrefurl += ".html";	
	//61019:
	if(sid != "") {
		try{
			dwr.engine.setAsync(false);
			spIndexDwr.SaveSearchRec("6","4",sid,
			{
		      callback:function(data) {}
			});
		}catch(e){}
	}
	window.location.href = hrefurl;
}

//数据返回值:
function ziStr(zval,rdef) {
	if(zval != null && zval != "" && zval != "null") {
		return zval;
	}else {
		return rdef;
	}
}
function szStr(zval,zhz,rdef) {
	if(zval != null && zval > 0) {
		return zval+zhz;
	}else {
		return rdef;
	}
}

//精选,2015-05-12:
/*DWREngine.setAsync = function(async) {
    DWREngine._async = async;
};*/

var pageNo = 0;
function ShowTopShops(shopStr) {
	
	//DWREngine.setAsync(false);
	dwr.engine.setAsync(false);
	pageNo ++;
	spIndexDwr.queryJingShops(shopStr,'2',pageNo,
	{
	      callback:function(datalist) {

			var str = "";
			if(datalist != null && datalist.length > 0) {
				
				var imgstr = "";
				var titStr = "";
				for(var i=0;i<datalist.length;i++) {

					imgstr = "";
					if(datalist[i].sellLevImage != null && datalist[i].sellLevImage != '') {		
						titStr = "";
						if(datalist[i].sellerCredit != null && datalist[i].sellerCredit > 0) {
							titStr = " title=\""+datalist[i].sellerCredit+"\"";
						}
						imgstr = "<img src=\"images/"+datalist[i].sellLevImage+"\""+titStr+" />";
					}
					
					str += "<div class=\"listItem\">";
					str += "<a class=\"leftPrice\" href=\"shopsGet-"+datalist[i].id+".html\" target=\"_blank\"><span class=\"price\">￥<br/>"+datalist[i].csprice+"</span><i class=\"tjIco\"></i></a>";
					str += "<div class=\"rightBox\">";
					str += "    <h2 class=\"linkTitle\"><a href=\"shopsGet-"+datalist[i].id+".html\" title=\""+datalist[i].spTitle+"\" target=\"_blank\">"+datalist[i].spTitle+"</a>"+imgstr+"</h2>";
					str += "    <ul><li><span>所属行业</span>"+datalist[i].typeName+"</li><li><span>好 评 率</span>"+szStr(datalist[i].sellerPosFeed,"%","-")+"</li></ul>";
					str += "    <ul><li><span>网店信誉</span>"+szStr(datalist[i].sellerCredit,"","-")+"</li><li><span>动态评分</span><div class=\"dtpfxht\"><i class=\""+ziStr(datalist[i].msBi,"default")+"\"></i><i class=\""+ziStr(datalist[i].fwBi,"default")+"\"></i><i class=\""+ziStr(datalist[i].fhBi,"default")+"\"></i></div> "+ziStr(datalist[i].ratingNewsOne,"")+" - "+ziStr(datalist[i].ratingNewsTwo,"")+" - "+ziStr(datalist[i].ratingNewsThree,"")+"</li></ul>";
					str += "    <ul><li><span>创店时间</span>"+datalist[i].shopHours+"</li><li><span>老客户数</span>"+szStr(datalist[i].kehu,"","-")+"</li></ul>";
					str += "    <ul><li><span>消 保 金</span>"+szStr(datalist[i].xbMoney,"元","-")+"</li><li><span>收 藏 量</span>"+szStr(datalist[i].collectionSize,"","-")+"</li></ul>";
					str += "    <ul><li><span>虚拟占比</span>"+((datalist[i].virtualTrad!=null)?datalist[i].virtualTrad+"%":"-")+"</li><li><span>违规扣分</span><b>"+ziStr(datalist[i].koufenA,"")+" - "+ziStr(datalist[i].koufenB,"")+" - "+ziStr(datalist[i].koufenC,"")+"</b></li></ul>";
					str += "</div>";
					str += "</div>";
				}
				
				$('#itopshopdiv').css('display','block');
				document.getElementById("itopshop").innerHTML = str;

			 }else {
				 $('#itopshopdiv').css('display','none');
			 }
		  }
	});
}

function queryConditionOhter() {
	
	$('.otherFlt .fltTabTo .selectBox a').click(function() {
		var i = $(this).closest('.fltTabTo').index('.otherFlt .fltTabTo');		
		$('#otherQueryItem dd').each(function(index) {
			if($(this).css('display') == 'block') {
				if(i == index) {
					$('#otherQueryItem dd').css('display','none');
					$('#otherQueryItem').eq(index).css('display','block');
					$('#izhank').val('');
					return false;
				}
			}
			if(index >= ($('#otherQueryItem dd').length - 1)) {
				$('#otherQueryItem').css('display','block');
				$('#otherQueryItem dd').css('display','none');
				$('#otherQueryItem dd').eq(i).css('display','block');
				$('#izhank').val('1');
			}
		})
	});
	
	//点击传值:
	$('#otherQueryItem dd li a').click(function() {
		$(this).closest('ul').find('a').removeClass('cur');
		$(this).addClass('cur');
		if($(this).closest('ul').next('.otherVal').val() == $(this).text()) {
			$(this).closest('ul').next('.otherVal').val("");
		}else {
			$(this).closest('ul').next('.otherVal').val($(this).text());
		}
		hrefgo('1');
	});
}

function kdsjValShow(tval) {

    var sjsz = tval.split("~");
    var sval = sjsz[0];
    var eval = sjsz[1];
	if(sval.length == 2) {
		sval = "20"+sval;
	}
	if(eval.length == 2) {
		eval = "20"+eval;
	}
	if(sval != "") {
		xuan(sval,document.getElementById("startDateBusi"));
	}
	if(eval != "") {
		xuan(eval,document.getElementById("endDateBusi"));
	}
}
function setClkValShow(tval,tfg) {
	
	if(tfg == "2") { //好评率:
		if(tval.indexOf("以") > 0) {
			tval = tval.replace(/以/g, "%以");
		}			
	}else if(tfg == "3") { //虚拟比:
		if(tval.indexOf("~") > 0) {
			tval = tval.replace(/~/g, "%~")+"%";
		}			
	}else if(tfg == "4") { //动态评分:
		if(tval == "5") {
			tval = tval+"分";
		}else if(tval != "" && tval != "不限") {
			tval = tval+"分以上";
		}		
	}
	
	$('#otherQueryItem dd li a').each(function(index) {
		if($(this).text() == tval) {
			$(this).closest('ul').find('a').removeClass('cur');
			$(this).addClass('cur');
		}
	});
}

//70726:
function showOtherSearch() {
	
	var sarea = trim($('#isarea').val());
	var shopHour = trim($('#ishopHour').val());
	var stHaopn = trim($('#stHaopn').val());
	var xunibi = trim($('#ixunibi').val());
	var spingf = trim($('#ispingf').val());
	var skouf = trim($('#iskouf').val());
	var sdaih = trim($('#isdaih').val());
	var shuoy = trim($('#ishuoy').val());
	
	if(sarea != null && sarea != '') {
		$('#isareaDd').css('display','block');
		setClkValShow(sarea,"1");
	}else if(shopHour != null && shopHour != '') {
		$('#ishopHourDd').css('display','block');
		kdsjValShow(shopHour);
	}else if(stHaopn != null && stHaopn != '') {
		$('#stHaopnDd').css('display','block');
		setClkValShow(stHaopn,"2");
	}else if(xunibi != null && xunibi != '') {
		$('#ixunibiDd').css('display','block');
		setClkValShow(xunibi,"3");
	}else if(spingf != null && spingf != '') {
		$('#ispingfDd').css('display','block');
		setClkValShow(spingf,"4");
	}else if(skouf != null && skouf != '') {
		$('#iskoufDd').css('display','block');
		setClkValShow(skouf,"5");
	}else if(sdaih != null && sdaih != '') {
		$('#isdaihDd').css('display','block');
		setClkValShow(sdaih,"6");
	}else if(shuoy != null && shuoy != '') {
		$('#ishuoyDd').css('display','block');
		setClkValShow(shuoy,"7");
	}
}
