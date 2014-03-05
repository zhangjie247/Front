<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
session.setAttribute("currentMenu","3");
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
		云计算数据分析平台简介
    &nbsp;</div>
  </div>
  
  <div class="CBody">
  	<table>
   	<tr>
        <td>
        <center>
                <img src='images/about.jpg'>
          </center>
        </td>
    </tr>
   </table>
  <center><b>云计算数据分析平台简介</b></center><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;云计算数据分析平台是基于云计算架构的大量数据处理分析平台。主要实现数据挖掘等功能，有效支持各种数据的分析。主要适合用户为企业尤其拥有大量数据并需要进行数据分析处理的互联网企业和运营商。
         此外，对大量数据分析和研究的科研机构也是潜在用户。 <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;云计算数据分析平台的主要特点是自助式服务和强大处理能力。<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b></>自助式服务</b><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;云计算平台采用友好的Web界面操作方式，支持工作流方式的定制化数据分析，用户可以根据自身需求，选择不同的数据分析方式，制定满足需求的工作流。支持用户任务的提交、查看、取消、重启等操作，实现真正的完全自助式数据分析服务。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>强大处理能力</b><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;云计算平台基于开源的云计算架构，将分散的计算资源和储存空间整合为一个巨大的资源集群，能够处理从GB级到PB级的数据，支持各种复杂的数据分析方式。并支持多个任务的并发运行，系统自动调用资源集群进行优化分配，保证各个任务正确高效的运转。
    
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