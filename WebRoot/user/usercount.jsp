<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
session.setAttribute("currentMenu","2");
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
 
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/control.css" rel="stylesheet" type="text/css" />

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>

<script language="JavaScript"> 
function update(){ 
	var userLoginForm = document.getElementById("userLoginForm");
	if(userLoginForm.newPassword.value != userLoginForm.againPassword.value) { 
		alert("两次密码输入不一致，请重新输入"); 
		return false; 
	} 
	userLoginForm.submit();
} 

function back() { 
	location.href="customerManager.action"; 
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
		用户管理
    &nbsp;</div>
  </div>
  
  <div class="CBody">
  <div class="main_content">    
    <!--content---------------------->	
	<br><span class="mustin"></span><br>
  	
	
	<form id="userLoginForm" name="userLoginForm" method="post" onsubmit="return true;" action="modifyPassword.action"> 
		<table border="0" cellpadding="0" cellspacing="0" width="750"> 
		<tbody>
			<tr>
				<td height="59" colspan="3" align="left">
					<b  style="color: white; background-color:#525D76;">账号管理--修改密码</b>
					&nbsp;			</td>
			</tr>
		
			<tr> 
			<td width="120" height="40">用户名:<%=session.getAttribute("loginUser")%></td> 
			</tr> 
			
			<tr>
			<td height="40" bgcolor="#FFFFFF" class="loginconli1"><font color="#2065b0">原始密码:</font></td>
			<td bgcolor="#FFFFFF">
			<input type="password" class="logininput1" id="oldPassword" style="width:180px" name="oldPassword" value=""></td>
		  	<td><div id="oldPasswordTip" style="width:350px; float:left" class="onShow">&nbsp;</div></td>
			</tr>
			
			<tr>
			<td height="40" bgcolor="#FFFFFF" class="loginconli1"><font color="#2065b0">新密码:</font></td>
			<td bgcolor="#FFFFFF">
			<input type="password" class="logininput1" id="newPassword" style="width:180px" name="newPassword" value=""></td>
		  	<td><div id="newPasswordTip" style="width:350px; float:left" class="onShow">&nbsp;</div></td>
			</tr>
			
			<tr>
			<td height="40" bgcolor="#FFFFFF" class="loginconli1"><font color="#2065b0">验证新密码:</font></td>
			<td bgcolor="#FFFFFF">
			<input type="password" class="logininput1" id="againPassword" style="width:180px" name="againPassword" value=""></td>
		  	<td><div id="againPasswordTip" style="width:350px; float:left" class="onShow">&nbsp;</div></td>
			</tr>
			
			<tr> 
			<td><input type="hidden" name="password"></td> 
			</tr> 
			
			<tr align="center"> 
			<td><font color="#FF0000"><html:errors bundle="system" property="error" /></font></td> 
			</tr> 
			
			<tr> 
			<td><input type="button"  class="mbtn" value="修  改" onclick="update()">&nbsp;&nbsp; 
			    <input type="button"  class="mbtn" value="取  消" onclick="back()">
			</td> 
			</tr> 
		</tbody></table> 
	</form> 
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