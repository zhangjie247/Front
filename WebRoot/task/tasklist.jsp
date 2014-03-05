<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
session.setAttribute("currentMenu","1");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <base href="<%=basePath%>">
 <style>
body{
	background:url(images/bg_nav.gif) repeat-x left 32px #fff;
	text-align:center;
}
 </style>
 
 
<title>查看您的任务信息</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/control.css" rel="stylesheet" type="text/css" />

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script src="js/jquery-1.2.6.js" type="text/javascript"></script>

<script language="javascript">
$(document).ready(function(){
	$(".filetable tr").mouseover(function(){
		$(this).css({background:"#E2E2E2"});
		}).mouseout(function(){
			$(this).css({background:"#ffffff"});
		});
	
	$(".task_detail").attr("href",function(n,v){
		return "DMTaskManager!list.action?taskID=" + this.id;
	});
	$(".rtask_stop").attr("href",function(n,v){
		return "DMTaskManager!stop.action?taskID=" + this.id;
	});
	$(".ftask_del").attr("href",function(n,v){
		return "DMTaskManager!del.action?taskID=" + this.id;
	});
	$(".ftask_result").attr("href",function(n,v){
		return "DMTaskManager!result.action?taskID=" + this.id;
	});
	$(".ftask_download").attr("href",function(n,v){
		return "DMTaskManager!download.action?taskID=" + this.id;
	});
	
});
</script>

</head>

<body>

<jsp:include page="/cloudcenter/mesh_nav.jsp"></jsp:include>

<div id="s_main">

<div id="Vleft" >
<jsp:include page="/cloudcenter/mesh_vleft.jsp"></jsp:include>
</div>

<div id="Vcenter">
  <div class="BCorner"><b class="Bline1"></b><b class="Bline2"><b></b></b><b class="Bline3"><b></b></b><b class="Bline4"><b></b></b></div>

  <div class="BCBody">
    <div class="stitle">
		<%=session.getAttribute("loginUser")%>，查看您的任务进度。
    &nbsp;</div>
  </div>
  
  <div class="CBody">
 
 <div class="main_content" style="width:750px; height:350px;">    
    <!--content---------------------->	
	<br><span class="mustin"></span><br>
	
	
  <div id="runtaskDiv"  style="width:780px;">
    <div style="height:59; colspan:3; align:left;">
		<b style="color:white; background-color:#525D76">正在运行的任务：</b>
    </div>
		
	<table class="filetable" style="margin-top:5px" id="runtask" width="90%">
	  <thead>
		<tr>
			<td style="width:200px;">任务ID</td>
			<td>提交时间</td>
			<td>当前费用</td>
			<td>操作</td>
		</tr>
	  </thead>
	  
	  <s:iterator value="tasklist" status="stat">
	  	<s:if test='tasklist[#stat.index].status != "finish"'>
	  	<tr>
	  		<td><s:property value="%{tasklist[#stat.index].taskID}"/></td>
	  		<td><s:property value="%{tasklist[#stat.index].addingDateStr}"/></td>
	  		<td><s:property value="%{tasklist[#stat.index].fee}"/></td>
	  		<td>
	  			<s:a cssClass="task_detail" id="%{tasklist[#stat.index].taskID}" theme="simple">详细信息</s:a>|
	  			<s:a cssClass="rtask_stop" id="%{tasklist[#stat.index].taskID}" theme="simple">停止</s:a>
	  		</td>
	  	</tr>
	  	</s:if>
	  </s:iterator>
	  
	</table>
	<br/>
  </div>
  <br><br><br>
  
  
  <div id="histaskDiv"  style="width:780px;">
    <div style="height:59; colspan:3; align:left;">
		<b style="color:white; background-color:#525D76">历史任务：</b>
    </div>
	<table class="filetable" style="margin-top:5px" id="histask" width="90%">
	<thead>
		<tr>
			<td style="width:200px;">任务ID</td>
			<td>提交时间</td>
			<td>结束时间</td>
			<td>费用</td>
			<td>操作</td>
		</tr>
	</thead>
	
	<s:iterator value="tasklist" status="stat">
	  	<s:if test='tasklist[#stat.index].status == "finish"'>
	  	<tr>
	  		<td><s:property value="%{tasklist[#stat.index].taskID}"/></td>
	  		<td><s:property value="%{tasklist[#stat.index].addingDateStr}"/></td>
	  		<td><s:property value="%{tasklist[#stat.index].finishDateStr}"/></td>
	  		<td><s:property value="%{tasklist[#stat.index].fee}"/></td>
	  		<td>
	  			<s:a cssClass="task_detail" id="%{tasklist[#stat.index].taskID}" theme="simple">详细信息</s:a>|
	  			<s:a cssClass="ftask_del" id="%{tasklist[#stat.index].taskID}" theme="simple">删除</s:a>|
	  			<s:a cssClass="ftask_result" id="%{tasklist[#stat.index].taskID}" theme="simple">查看结果</s:a>|
	  			<s:a cssClass="ftask_download" id="%{tasklist[#stat.index].taskID}" theme="simple">结果导出</s:a>
	  		</td>
	  	</tr>
	  	</s:if>
	  </s:iterator>
	  
	</table>
	<br/>
  </div>
	
 </div>
 
  <div class="clear"></div>
    
  </div>
  
  <div class="line_solid"></div>
  <div class="BCorner"><b class="TBline4"><b></b></b> <b class="Bline3"><b></b></b><b class="Bline2"><b></b></b><b class="Bline1"></b> </div>

</div>

<div class="f_c"></div>

<div class="s_footer">
<jsp:include page="/cloudcenter/mesh_footer.jsp"></jsp:include>
</div>

</div>

</body>
</html>