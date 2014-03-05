/* 文件操作js脚本
 * Version 0.1 (16-MAY-2012)
 * @requires jQuery v1.2.3 or later
 * 注意！在引用本脚本前必须先引用jQuery
 */


//显示要上传的文件
function showFile(){
	//alert(tr_id);
	var str = "<tr><td>"  + $("#file").attr("value") + "</td><td >&nbsp;</td><td>&nbsp;</td></tr>";
	if($("#filebox tr").size() > 1) {
        $("#filebox tr:last").remove();
    }
	$("#filebox").append(str);
}

//检查并提交文件上传表单
function submitAndUpload(){
	var fileName = $("#file").attr("value");
	if(fileName == null||fileName==''){
		alert("请选择文件！");	
	}else{
		document.getElementById('fileUpForm').submit();
		process();
	}
}
//处理文件上传进度信息
 function process(){
		 	var xmlHttp = new XMLHttpRequest();//创建ajax对象
			xmlHttp.open("post","processController.action",false);//创建发送的url
			//新启动一个线程，调用该function
			//0:没有open,//1.没有 //2.发送，服务器未接受 //3.服务器接受了，但没有做出相应 //4服务器相应了，本地也接收了相应
			xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8'); 
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4){
					var p = xmlHttp.responseText;
					$("#tableid").css("border","1");
					$("#process").css("width",p*3);
					$("#process").html(p + "%");
					if (p == 100){
						$("#process").html("finish!");
					} else {
						setTimeout("process()",100);
		 			}
				}
			}
			xmlHttp.send();
}

 //打开窗口，浏览并选择文件
function cf(inputTo,act){
	act = act || 'c';
	$("#inputTo").attr("value",inputTo);
	$("#cfilecontainer").load("fexplorer!exp.action",{"path":'',"act":act,"pre":'no'},function(){
		$("#cfilecontainer").removeClass();
		$("#filest tr").mouseover(function(){
		$(this).css({background:"#E2E2E2"});
		}).mouseout(function(){
			$(this).css({background:"#ffffff"});
		});
		blockU("cfile_nav",780,450);
	})
	
}

//处理当前选中文件
function chooseFile(name){
	var ccho = document.getElementById(name + '_cho');
	var csize = ccho.parentNode.parentNode.childNodes[3].innerHTML;
	var cdate = ccho.parentNode.parentNode.childNodes[5].innerHTML;
	$("#fileName").attr("value",name);
	var currentPath = $("#currentPath").val();
	$("#filePath").attr("value",currentPath);
	var str = "<tr><td>"  + name + "</td><td >" + csize + "</td><td>" + cdate + "</td></tr>";
	if($("#filebox tr").size() > 1) {
        $("#filebox tr:last").remove();
    }
	$("#filebox").append(str);
}

//确定选择文件，提交给服务器
function cfsub(){
	var fileName = $("#fileName").attr("value");
	if(fileName == ""||fileName == null){
		alert("请先选择文件！");
	}else{
		var inputTo = $("#inputTo").attr("value");
		var filePath = $("#filePath").attr("value");
		document.getElementById(inputTo).setAttribute("value",filePath + fileName);
		$.unblockUI();
	}
}


//浏览文件目录
function listsub(val,act,pre){
		
	if(val == "init"){
		val="";
	}
	//location.href=href;
	var fcontainer;
	if(act == 'c'){
		fcontainer = $("#cfilecontainer");
	}else
		fcontainer = $("#filecontainer");
	
	fcontainer.load("fexplorer!exp.action",{"path":val,"act":act,"pre":pre},function(){
		fcontainer.removeClass();		
		$("#filest tr").mouseover(function(){
		$(this).css({background:"#E2E2E2"});
		}).mouseout(function(){
			$(this).css({background:"#ffffff"});
		});

	});	
}

/*刷新单前目录*/
function refr(){
	var val = $("#currentPath").val();
	var act = $("#act").val();
	//var	href = "/fexplorer.action?path=" + val + "&act="+ act + "&pre=n" ;
	//location.href=href;
		$("#filecontainer").html("<img src='images/loading.gif' style='margin-top:50px; margin-left:300px' />");
		$("#filecontainer").load("fexplorer!exp.action",{"path":val,"act":act,"pre":"n"},function(){
		$("#filecontainer").removeClass();		
		$("#filest tr").mouseover(function(){
		$(this).css({background:"#E2E2E2"});
		}).mouseout(function(){
			$(this).css({background:"#ffffff"});
		});
		
	});	
}


//处理重命名事件
function ren(currentPath,name){
	$("#ren_name_new_tip").html("&nbsp;");
	$("#ren_name_new").val(name);
	$("#source_path").val(currentPath+name);
	blockU("renDiv",300,120);		
}

//处理重命名面板确定点击事件
function rensub(){
	var renval = $("#ren_name_new").val();
	var path = $("#source_path").val();
	if(renval==null || renval==""){
		$("#ren_name_new_tip").html("Error");
	}else{
		$.post('ajaxAction!han.action', {path:path,act:"han.rename",newName:renval},renFun,'json');
		$.unblockUI();
	}
	
}


function renFun(data){
	var renval = $("#ren_name_new").val("");
	if(data.msg=="success"){
		//listsub(data.path,data.act,"yes");
		refr();
	}else{
		alert(data.msg);
		//alert(data.msg);
	}
}

function del(val){
	if(confirm("确定要删除"+val+"?")){
		var path = $("#currentPath").val();
		path = path + val;
		$.post('ajaxAction!han.action', {path:path,act:"han.del"},delFun,'json');
		$.unblockUI();
	}
}
function delFun(data){
	if(data.msg=="success"){
		//listsub(data.path,data.act,"yes");
		refr();
		
	}else{
		alert(data.msg);
	}
}

function mk(val){
	blockU("mkDiv",300,120);	
}

function mkSub(){
	var path = $("#currentPath").val();
	var mkval = $("#mkdir_name").val();
	if(mkval == null || mkval==""){
		$("#mkdir_name_tip").html("error");
	}else{
		$.post('ajaxAction!mk.action', {path:path,act:"han.mkdir",newName:mkval},mkFun,'json');
		$.unblockUI();
	}
}

function mkFun(data){
	if(data.msg == "success"){
		//listsub(data.path,data.act,data.pre);
		refr();
	}else{
		alert(data.msg);
	}

}

function move(currentPath,fileName){

	$("#source_path").val(currentPath + fileName);
	$("#target_path").val("/" + currentPath);
	blockU("moveDiv",300,120);
}

function moveSub(){
	var path = $("#source_path").val();
	var tarpath = $("#target_path").val();
	if(tarpath == null || tarpath ==""){
		alert("目标文件夹不能为空");
	}else{
		$.post('ajaxAction!move.action', {path:path,targetPath:tarpath},moveFun,'json');
		$.unblockUI();
	}
	
}

function moveFun(data){
	if(data.msg == "success"){		

		//listsub(data.path,data.act,"");
		refr();
	}else{
		alert(data.msg);
	}
}


function unp(path,name){
		
		if(confirm("确定要解压此文件 ？\n"+name)){
			var rnd = Math.round(Math.random()*1000000);
			$.post('/ajaxAction!unp.action', {"path":path,"name":name,"rnd":rnd},unpFun,'json');
			$("#unpLogDiv").html("<img src='images/loading.gif'/>");	
			blockU("unpDiv",500,420);
			setTimeout(function (){unplog(path,name,rnd)},3000);
		}
}
function unpFun(data){}

function unplog(path,name,rnd){

	$.post('/ajaxAction!unplog.action', {"path":path,"name":name,"rnd":rnd},unplogFun,'json');
}

function unplogFun(data){
	var str = data.msg;
	if(str==null || str==""){
		$("#unpLogDiv").html("<img src='images/loading.gif'/>");	
		setTimeout(function (){unplog(data.path,data.name,data.rnd)},3000);
		
	}else if(str.endWith("myrdbus_unpackdone")){
		var t = str.lastIndexOf("myrdbus_unpackdone");
		str = str.substring(0,t);			
		$("#unpLogDiv").html(str);	
		$("#nextBtn").show();
	}else{
		$("#unpLogDiv").html(str);
		setTimeout(function (){unplog(data.path,data.name,data.rnd)},3000);
		
	}
}


function blockU(divName,width,height){
		$.blockUI.defaults.applyPlatformOpacityRules = false;
		$.blockUI.defaults.overlayCSS.backgroundColor = '#999999';
		$.blockUI.defaults.overlayCSS.opacity = '0.3';
		
		$.blockUI({ message: $('#'+divName) ,
				css: { 
					top:  ($(window).height() - height) /2 + 'px', 
					left: ($(window).width() - width) /2 + 'px', 
					width: width+'px' ,
					height:height+'px',
					cursor:'default'
				}
		});

}
function quit(){
	$.unblockUI();
	
}
function quit_(){
	refr();
	$.unblockUI();
	
}

function block(){
	$.blockUI.defaults.applyPlatformOpacityRules = false;
	$.blockUI.defaults.overlayCSS.backgroundColor = '#999999';
	$.blockUI.defaults.overlayCSS.opacity = '0.3';	
	$.blockUI({ message: $('#filecontainer') ,
			css: { 
				top:  ($(window).height() - 265) /2 + 'px', 
				left: ($(window).width() - 600) /2 + 'px', 
				width: '600px' ,
				height:'265px',
				cursor:'default'
			}
	});
}



function openfile(){
	$("#filecontainer").show();
}

 
 function refre(){
 	var val = $("#fatherpath").val();
	if(val == "/input"){
		listsub("init");
	}else{
		var a = val.indexOf("input")*1+"input".length;
		var str=val.substring(a,val.length);
		
		listsub(str);
	}
	
 }
 
function ok(){
	$.unblockUI();
}

function cancelBtn(){
	//$("#dispath").val("/input/" );
	$.unblockUI();
}