<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>redirecting...</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script src="js/jquery-1.2.6.js" type="text/javascript"></script>
	<script language="javascript">
	$(document).ready(function(){
		countDown(3);
	})
	
	function countDown(secs){
  		$("#timer").html(secs);
  		if(--secs>0){
       		setTimeout("countDown("+secs+")",1000);
    	}else{
    		var url = "<%=basePath%><%=session.getAttribute("goingToUrl")%>";
    		window.top.location.href = url;
    	}
  		
  }
	</script>
  </head>
  
  <body>
  <br/><br/><br/><br/>
    <h2 align="center">正在为您跳转...<span id="timer">4</span></h2><br>
  </body>
</html>
