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
	background:url(images/bg_nav.gif) repeat-x left 32px #fff;
	text-align:center;
}
 </style>
 
 
<title>登录</title>
<link href="css/public.css" rel="stylesheet" type="text/css">
<link href="css/control.css" rel="stylesheet" type="text/css">
<link href="css/validator.css" type="text/css" rel="stylesheet">
<link href="css/vindex.css" rel="stylesheet" type="text/css">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="云计算平台,CBL,数据挖掘,登录">
<meta http-equiv="description" content="description">

<script src="js/jquery-1.2.6.js" type="text/javascript"></script>
<script src="js/formValidator.js" type="text/javascript" charset="UTF-8"></script>
<script src="js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
		
<script language="javascript">			
$(document).ready(function(){			
	$.formValidator.initConfig({formid:"customerForm",onerror:function(msg){alert(msg)}});
	$("#loginName").formValidator({onshow:"&nbsp;",onfocus:"&nbsp;",oncorrect:"&nbsp;"}).inputValidator({min:3,max:20,onerror:"用户名只能由数字、下划线，字母组成，且6到20个"});
	$("#password").formValidator({onshow:"&nbsp;",onfocus:"&nbsp;",oncorrect:"&nbsp;"}).regexValidator({regexp:"notempty",datatype:"enum",onerror:"密码格式不正确"});
});

function getCookie(name){
					
	var ck = document.cookie;
	var search = name + "=" 
   	if(ck.length > 0) 
    { 
       	offset = ck.indexOf(search) 
        if(offset != -1) 
        { 
            offset += search.length 
            end = ck.indexOf(";", offset) 
            if(end == -1) end = ck.length 
            	return unescape(ck.substring(offset, end)) 
        }	 
        else 
        	return "" 
    }
}

function setCookie(name, value) 
{ 
    var argv = setCookie.arguments; 
    var argc = setCookie.arguments.length; 
    var expires = (argc > 2) ? argv[2] : null; 
    if(expires!=null) 
    { 
        var LargeExpDate = new Date (); 
        LargeExpDate.setTime(LargeExpDate.getTime() + (expires*1000*3600*24));         
    } 
    document.cookie = name + "=" + escape (value)+((expires == null) ? "" : ("; expires=" +LargeExpDate.toGMTString())); 
}

function deleteCookie(name) 
{ 
    var expdate = new Date(); 
    expdate.setTime(expdate.getTime() - (86400 * 1000 * 1)); 
    setCookie(name, "", expdate); 
}
</script>


</head>


<body>

<jsp:include page="/cloudcenter/mesh_nav.jsp"></jsp:include>

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
		登录
&nbsp;</div>
</div>

<div class="CBody">
	<div class="main_content">    
<!--content---------------------->	
	<br><span class="mustin"></span><br>				
				
<form id="customerForm" name="customer" onsubmit="return true;" action="login.action" method="post">
	
	<table border="0" cellpadding="0" cellspacing="0" width="750">
		<tbody>
		<tr>
			<td height="59" colspan="3" align="left">
				<b>帐号登录</b>
				&nbsp;			</td>
		</tr>
		
		<tr>
		  <td width="120" height="40">登录帐号 / 邮箱:</td>
		  <td width="200">
	  	  <input type="text" class="logininput1" id="loginName" style="width:180px" name="customer.userName" value=""></td>
		  <td><div id="loginNameTip" style="width:350px" class="onShow">&nbsp;</div></td>
		  
		</tr>
		<tr>
			<td height="40" bgcolor="#FFFFFF" class="loginconli1"><font color="#2065b0">密码:</font></td>
			<td bgcolor="#FFFFFF">
			<input type="password" class="logininput1" id="password" style="width:180px" name="customer.password" value=""></td>
		  	<td><div id="passwordTip" style="width:350px; float:left" class="onShow">&nbsp;</div></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="2" bgcolor="#FFFFFF">
				<s:checkbox key="rememberMe" theme="simple"></s:checkbox>
				<label for="rememberMe"><b>记住我的信息</b></label>
				&nbsp;
				
				
				<a href="customerForgetPwd!in.action">忘记密码</a>
				
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		 	<td>
			<div style="width:2px; height:2px; overflow:hidden" >
					
					<input type="image"  src="images/login_btn_cn.gif">
				
			</div>
			&nbsp;	
			<div class="btn4">
				<div class="btn_text3" onClick="document.getElementById('customerForm').submit();">	帐号登录	</div>
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

</body></html>