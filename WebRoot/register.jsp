<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
session.removeAttribute("currentMenu");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <base href="<%=basePath%>">
 <style>
body{
	background:repeat-x left 32px #fff ;
	text-align:center;
}
 </style>
 
 
<title>注册</title>
<link href="css/public.css" rel="stylesheet" type="text/css">
<link href="css/control.css" rel="stylesheet" type="text/css">
<link href="css/validator.css" type="text/css" rel="stylesheet">
<link href="css/vindex.css" rel="stylesheet" type="text/css">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="云计算平台,CBL,数据挖掘,注册">
<meta http-equiv="description" content="description">

<script src="js/jquery_last.js" type="text/javascript"></script>
<script src="js/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
		

</head>


<body>

<jsp:include page="cloudcenter/mesh_nav.jsp"></jsp:include>		

<div id="s_main">
  <div id="Vleft">
	<jsp:include page="/cloudcenter/mesh_vleft.jsp"></jsp:include>
  </div>
  
<div id="Vcenter">
<div class="BCorner"><b class="Bline1"></b><b class="Bline2"><b></b></b><b class="Bline3"><b></b></b><b class="Bline4"><b></b></b></div>

<div class="BCBody">
	<div class="stitle">
		客户操作
		--
		注册
&nbsp;</div>
</div>

<div class="CBody">
	<div class="main_content">    
<!--content---------------------->	
	<br><span class="mustin"></span><br>
					
	<s:actionerror/>			
<form id="customerForm" name="customer" onsubmit="return true;" action="customerManager!register.action" method="post">
	
	<table border="0" cellpadding="0" cellspacing="0" width="750">
		<tbody>
		<tr>
			<td height="59" colspan="3" align="left">
				<b>欢迎注册303实验室云计算分析平台</b>
				&nbsp;			</td>
		</tr>
		
		<tr>
		  <td width="120" height="40">用户名:</td>
		  <td width="200">
	  	  <input type="text" class="logininput1" id="registerName" style="width:180px" name="customer.userName" value=""></td>
		  <td><div id="registerNameTip" style="width:350px" class="onShow">&nbsp;</div></td>
		  
		</tr>
		<tr>
			<td height="40" bgcolor="#FFFFFF" class="loginconli1" align="center"><font color="#2065b0">密码:</font></td>
			<td bgcolor="#FFFFFF">
			<input type="password" class="logininput1" id="password" style="width:180px" name="customer.password"></td>
		  	<td><div id="passwordTip" style="width:350px; float:left" class="onShow">&nbsp;</div></td>
		</tr>
		<tr>
			<td height="40" bgcolor="#FFFFFF" class="loginconli1"><font color="#2065b0">确认密码:</font></td>
			<td bgcolor="#FFFFFF">
			<input type="password" class="logininput1" id="confirmPassword" style="width:180px" name="confirmPassword"></td>
		  	<td><div id="passwordTip" style="width:350px; float:left" class="onShow">&nbsp;</div></td>
		</tr>
		<tr>
			<td height="40" bgcolor="#FFFFFF" class="loginconli1"><font color="#2065b0">邮箱:</font></td>
			<td bgcolor="#FFFFFF">
			<input type="text" class="logininput1" id="mailbox" style="width:180px" name="customer.email"></td>
		  	<td><div id="passwordTip" style="width:350px; float:left" class="onShow">&nbsp;</div></td>
		</tr>
		<tr>
			<td height="40" bgcolor="#FFFFFF" class="loginconli1"><font color="#2065b0">年龄:</font></td>
			<td bgcolor="#FFFFFF">
			<input type="text" class="logininput1" id="age" style="width:180px" name="customer.age"></td>
		  	<td><div id="passwordTip" style="width:350px; float:left" class="onShow">&nbsp;</div></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="2" bgcolor="#FFFFFF">
				<s:checkbox key="readPolicy" theme="simple"></s:checkbox>
				<label for="readPolicy"><b>我已阅读并同意xxx协议</b></label>				
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		 	<td>
			<div style="width:2px; height:2px; overflow:hidden" >
					
					<input type="image" src="images/login_btn_cn.gif">
				
			</div>
			&nbsp;	
			<div class="btn4">
				<div class="btn_text3" onClick="document.getElementById('customerForm').submit();">	注册	</div>
			</div>

			</td>
		 	<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		 	<td>&nbsp;
			
			</td>
		 	<td>&nbsp;</td>
		</tr>
		
		<tr>
		  <td colspan="3" align="left">
			<input type="hidden" name="goingToUrl" value="">
		</td></tr>
	</tbody></table>
</form>




<br><br><br><br><br>


 
<!-------------------content----->    			
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