<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
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
  <iframe src="http://192.168.0.121:50030/jobtracker.jsp" style="width:810px; height:2000px;"></iframe>
	
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