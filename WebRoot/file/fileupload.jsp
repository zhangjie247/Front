<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>">
 
 <style>
body{
	background:url(images/bg_nav.gif) repeat-x left 32px #fff;
	text-align:center;
}
 </style>
 
 
<title>File List</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/control.css" rel="stylesheet" type="text/css" />

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style>
.mbtn {
	border:solid 1px #7b9ebd;
	text-align:center;
}



</style>
<script src="js/jquery-1.2.6.js" type="text/javascript"></script>
<script src="js/jquery.blockUI.js?v2.23" type="text/javascript" ></script>
<script src="js/fileoperator.js" type="text/javascript"></script>

<script language="javascript">
$.ajaxSetup ({
    cache: false //关闭AJAX相应的缓存
});
String.prototype.endWith=function(oString){   
  var   reg=new   RegExp(oString+"$");   
  return   reg.test(this); 
} 
$(document).ready(function(){
	listsub("","f","");
});

</script>

</head>

<body>

<!-- header start -->

<jsp:include page="/cloudcenter/mesh_nav.jsp"></jsp:include>

<div id="s_main">

<div id="Vleft" >
<jsp:include page="/cloudcenter/mesh_vleft.jsp"></jsp:include>
</div>
  
<div id="Vcenter">
   	<div class="BCorner"><b class="Bline1"></b><b class="Bline2"><b></b></b><b class="Bline3"><b></b></b><b class="Bline4"><b></b></b></div>

<div class="BCBody">
	<div class="stitle">上传文件到服务器&nbsp;</div>
</div>

<div class="CBody" >
	<div class="main_content" id="main_content">    
<!--content---------------------->	

<!-- 文件操作窗口 -->
<div id="filecontainer" style="width:750px; height:350px;">&nbsp;

  <img src="images/loading.gif" style="margin-top:50px; margin-left:300px" />

</div>


<br/>
<div style="margin-bottom:5px;">
<div style="float:left; width:300px;" id="upbtnDiv">
	<input class="mbtn" type="button" value="开始上传" onClick="submitAndUpload();" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<div style="float:left; width:200px;" id="otbtnDiv">
	<input class="mbtn"  type="button" value="创建目录" onClick="mk()"/>&nbsp;
	<input class="mbtn" type="button" onClick="javascript:refr();" value="刷新"/>
</div>
		
	<br />
</div>

<div id="upDiv"  style="width:780px;">
	<table class="filetable" style="margin-top:5px" id="filebox" width="90%">
	<thead>
		<tr>
			<td>Files to be uploaded</td>
			<td>Size</td>
			<td>Status</td>
		</tr>
	</thead>
	</table>
<br/>
</div>

<form id="fileUpForm" action ="fileUpload.action" method ="POST" enctype ="multipart/form-data">
    <input type="file" name="myFile" id="file" onchange="showFile()"/>
</form>
    <table bordercolor="#cccccc"  width="302px" height="22px" id="tableid">
    	<tr>
    		<td>
    			<div id="process" style="background-color:#4b9500; height:20px; width:0px;"></div>
    		</td>
    	</tr>
   		 
   </table>


<!-- 弹出窗口部分 -->
<div id="renDiv" style="display:none;padding:15 15 10 10;">
	 新名称:<br>
	<input type="text" name="ren_name_new" id="ren_name_new" size="40"/>	
	 
	<div id="ren_name_new_tip" style="color:#FF0000;">&nbsp;</div>
	 
	<input class="mbtn" type="button" name="ren_name_sub"  onclick="rensub();" value="确定"/>&nbsp;&nbsp;&nbsp;
	<input class="mbtn" type="button" name="ren_name_quit"  onclick="quit();" value="取消"/>

</div>


<div id="mkDiv" style="display:none;padding:15 15 10 10;">
请输入要创建的目录名:<br />
<input type="text" name="mkdir_name" id="mkdir_name" size="40"/>

	<div id="mkdir_name_tip" style="color:#FF0000;">&nbsp;</div>
	
	<input class="mbtn" type="button"  onclick="mkSub();" value="确定"/>&nbsp;&nbsp;&nbsp;
	<input class="mbtn" type="button"  onclick="quit();" value="取消"/>
</div>


<div id="moveDiv" style="display:none;padding:15 15 10 10;">
	移动到:<br />
	/input<input type="text" id="target_path" name="target_path" size="40"/>
	<div id="target_path_tip" style="color:#FF0000;">&nbsp;</div>
	<input class="mbtn" type="button"  onclick="moveSub();" value="确定"/>&nbsp;&nbsp;&nbsp;
	<input class="mbtn" type="button"  onclick="quit();" value="取消"/>
</div>

<div id="unpDiv" style="display:none; ">
	<div style="overflow:auto; height:400px; width:500px;"  id="unpLogDiv">&nbsp;<img src="images/loading.gif"/></div>
	<div style="text-align:center;display:none;"  id="nextBtn"><input class="mbtn" type="button" value=" &nbsp;&nbsp; 确定 &nbsp;&nbsp; " onClick="quit_();"/></div>
</div>

<input type="hidden" name="source_path" id="source_path"/>
  	

</div><!-- end of maincontent -->

<div class="clear"></div>

</div><!-- end of CBody -->

    <div class="line_solid"></div>
	<div class="BCorner"><b class="TBline4"><b></b></b> <b class="Bline3"><b></b></b><b class="Bline2"><b></b></b><b class="Bline1"></b> </div>

</div><!-- end of VCenter -->
</div>  

<!---------render------------->




<div class="f_c"></div>


<div class="s_footer">
<jsp:include page="/cloudcenter/mesh_footer.jsp"></jsp:include>  
</div>

</body>
</html>
