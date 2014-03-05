<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <base href="<%=basePath%>">
  
<style>
body{
	background:url(images/bg_nav.gif) repeat-x left 32px #fff;
	text-align:center;
}
.mbtn {
	border:solid 1px #7b9ebd;
	text-align:center;
}
</style>
 
 
<title>任务提交--确认</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/control.css" rel="stylesheet" type="text/css" />

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script src="js/jquery-1.2.6.js" type="text/javascript"></script>
<script language="javascript">
function detail(){
	$("#miningParam").slideDown();
}
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
		任务提交--确认
    &nbsp;</div>
  </div>
  
  <div class="CBody">
	<div class="main_content">    
    <!--content---------------------->	
	<br><span class="mustin"></span><br>
				
      <h4>参数:&nbsp;</h4>
      <table class="filetable" style="margin-top:5px" id="taskParam" width="60%">
      <thead>
		<tr>
			<td>Parameter name</td>
			<td>value</td>
		</tr>	
	  </thead>
	  <tbody>
	  	<tr>
	  		<td>用户名</td>
	  		<td><s:property value="%{task.username}"/></td>
	  	</tr>
	  	
	  	<tr>
	  		<td>添加时间</td>
	  		<td><s:property value="%{task.addingDateStr}"/></td>
	  	</tr>
	  	
	  	<tr>
	  		<td>挖掘算法</td>
	  		<td><s:property value="%{task.method}"/></td>
	  	</tr>
	  </tbody>
      </table>
      <br><br>
      

	<input id="switch_btn_kmeans" class="mbtn" type="button" onClick="detail();" value="算法具体信息"/>
	<br/><br/>
		
	<div id="miningParam" style="display:none;">
	<div align="left"><b>数据挖掘算法具体参数信息</b></div>
	
      <table class="filetable" style="margin-top:5px;"  width="90%">
      <thead>
		<tr>
			<td>Parameter name</td>
			<td>Value</td>
			<td>Description</td>
		</tr>	
	  </thead>

	  <s:iterator value="task.param.paramValueArray" status="stat">
	  	<tr>
	  		<td><s:property value="%{task.param.paramValueArray[#stat.index].name}"/></td>
	  		<td><s:property value="%{task.param.paramValueArray[#stat.index].value}"/></td>
	  		<td><s:property value="%{task.param.paramValueArray[#stat.index].tip}"/></td>
	  	</tr>
	  </s:iterator>
	  
      </table>
      </div>
      <br/><br/>
      <input type="button" class="mbtn" value="确认提交" onClick="window.location.href='taskSubmit.action'">&nbsp;&nbsp;&nbsp;
      <input type="button" class="mbtn" value="返回" onClick="window.location.href='addTask.action'">
      
	  <br><br><br><br><br>
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