<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="s_nav_login">
<%
String user = (String)session.getAttribute("loginUser");
String workGroup = (String)session.getAttribute("workGroup");
if(user == null || user.equals(null) || user.equals("")){
%>
	<a href="customerManager!registerIn.action" style="color:#33aa00; text-decoration:none;">
		免费注册</a>&nbsp;
				
	<a href="loginIn.action" style="color:#33aa00; text-decoration:none;">
		登录</a>&nbsp;	
<%
}else{
%>
		欢迎光临:<%=user %> (<%=workGroup %>)&nbsp;
			
		<a href="logout.action" style="color:#33aa00; text-decoration:none;">退出</a>&nbsp;	
<%}%>
</div>
 
<div class="s_nav_inner">
  <div class="logo"> 
  <a href="index.jsp"> <img src="images/logo.png"></a>
  <br>
  <div class="slogan">云端数据分析平台</div> 
  </div>
  <ul class="navBar">
    <li id="link1"> <a href="DMTaskManager!list.action"> <span class="navTab">任务控制</span> </a></li>    
    <li id="link2"> <a href="customerManager.action"><span class="navTab">账号管理</span></a> </li>
    <li id="link3"> <a href="about.jsp"><span class="navTab">平台简介</span></a> </li>
  </ul>
</div>

<script language="javascript">
var currentMenu = <%=session.getAttribute("currentMenu")%>;
if(currentMenu != "null" && currentMenu != null){
	var link = document.getElementById("link" + currentMenu);
	link.setAttribute("class","current");
}
</script>
