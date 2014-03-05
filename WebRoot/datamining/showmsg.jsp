<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";

%>

<%
String lastLogin = (String)session.getAttribute("lastLogin");
session.removeAttribute("lastLogin");
String workGroup = (String)session.getAttribute("workGroup");
session.setAttribute("currentMenu","1");
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
 </style>
 
 
<title>show message</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/control.css" rel="stylesheet" type="text/css" />

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>
</head>

<body>
<!-- nav begin -->

<jsp:include page="/cloudcenter/mesh_nav.jsp"></jsp:include>

<div id="s_main">

<div id="Vleft" >
<jsp:include page="/cloudcenter/mesh_vleft.jsp"></jsp:include>
</div>

<div id="Vcenter">
 <div class="BCorner"><b class="Bline1"></b><b class="Bline2"><b></b></b><b class="Bline3"><b></b></b><b class="Bline4"><b></b></b></div>

  <div class="BCBody">
    <div class="stitle">
		<%=session.getAttribute("loginUser")%>,欢迎登陆。上一次登陆时间：<%=lastLogin %>
    &nbsp;</div>
  </div>
  
  <div class="CBody">
	<div class="main_content" style="width:750px; height:350px;">    
    <!--content---------------------->	
	<br><span class="mustin"></span><br>
				
  <div style="width:320px; height:65px; border:solid 1px #999999; background-color:#eeeeee; margin-left:20px; padding:5px; float:left">
	我的任务: 
	正在运行:0
	历史任务:0 
	<a href="DMTaskManager!list.action">查看</a>
	<br>
	我的余额: 
	RMB:1234567
	<br>
	我的等级: <%=workGroup %>
	</div>

  <div style="width:320px; height:65px;border:solid 1px #999999; background-color:#eeeeee; margin-left:20px;  padding:5px; float:left">
  	农场运行的任务:17<br>
 	农场繁忙程度: <b>闲</b>

	<!--div id="loadbar" style="background-color:#CCCCCC; text-align:left; width:200px;">

	<strong id="bar" style="display:block; font-family:arial; font-size:8px; background-color:red;text-align:center;width:15%">&nbsp;</strong>

	</div-->
	<div>
	系统时间:<s:date name="currentTime" format="yyyy-MM-dd HH:mm:ss"/> 
    </div>
	
	<br><br><br><br><br>
  </div><br><br><br><br><br><br>
  

    
  <div style="width:320px; height:65px; border:solid 1px #999999; background-color:#eeeeee; margin-left:20px; padding:5px; float:left">
	用户名：<s:property value="customer.userName"/><br>
	邮箱：<s:property value="customer.email"/><br>
	用户组：<%=workGroup %>
  </div>
  
  </div>
    <div class="clear"></div>
    
  </div>
  
  <div class="line_solid"></div>
  <div class="BCorner"><b class="TBline4"><b></b></b> <b class="Bline3"><b></b></b><b class="Bline2"><b></b></b><b class="Bline1"></b> </div>

  </div>
</div>
<div class="f_c"></div>

<div class="s_footer">
<jsp:include page="/cloudcenter/mesh_footer.jsp"></jsp:include>
</div>

</body>
</html>