<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="keywords" content="云计算平台,CBL,数据挖掘,主页">
<title>303实验室云端数据分析平台</title>
<link href="css/public.css" rel="stylesheet" type="text/css">
<link href="css/jqbanner.css" rel="stylesheet" type="text/css">

<link rel="shortcut icon" href="http://www.renderbus.com/favicon.ico">
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/jqbanner.js" type="text/javascript"></script>
</head>

<body>

<jsp:include page="/cloudcenter/mesh_nav.jsp"></jsp:include>

<!--div id="notice"></div-->
<div id="s_main">
  <div id="jqb_object">

		<div class="jqb_slides">
			<div class="jqb_slide" style="z-index:9"><a href="advantage.php"><img src="images/1.jpg" /></a></div>
			<div class="jqb_slide" ><a href="hardware.php"><img src="images/2.jpg" /></a></div>
			<div class="jqb_slide" ><a href="price.php"><img src="images/3.jpg" /></a></div>
		    <div class="jqb_slide" ><a href="software.php"><img src="images/4.jpg" /></a></div>  
		</div>

		<div class="jqb_bar">	
			<div id="btn_next" class="jqb_btn jqb_btn_next"></div>
			<div id="btn_pauseplay" class="jqb_btn jqb_btn_pause"></div>
			<div id="btn_prev" class="jqb_btn jqb_btn_prev"></div>
		</div>

	</div>


  <!---------render------------->
  <div id="Vcenter">
    <div class="BCorner"><b class="Bline1"></b><b class="Bline2"><b></b></b><b class="Bline3"><b></b></b><b class="Bline4"><b></b></b></div>
    <!--content---------------------->
    
    <div class="CBody_index">
      <div class="main_content">
        <ul class="indexLink">
          <li style="list-style:none; font-weight:bold; margin-left:0px;">支持的数据挖掘算法</li>
          <li>决策树</li>
          <li>神经网络</li>
          <li style="list-style:none; font-weight:bold; margin-left:0px;">支持的文件类型</li>
          <li>TXT文本</li>
          <li>EXCLE表格</li>
          <li>数据库文件</li>
        </ul>
        <ul class="indexLink">
          <li style="list-style:none; font-weight:bold; margin-left:0px;">每节点机硬件配置</li>
          <li>CPU：至强E5645两颗, 24核 </li>
          <li>内存：24G</li>
          <li>内网速度：InfiniBand 20G</li>
          <li>FTP下载速度：100M光纤</li>
          <li>存储：20T Raid5</li>
          <li>共500台节点机</li>
          <li style="list-style:none;margin-left:0px;"><a href="http://www.renderbus.com/hardware.php">详细硬件配置</a></li>
        </ul>
        <ul class="indexLink">
          <li style="list-style:none; font-weight:bold; margin-left:0px;">新用户导航</li>
          <li><a href="http://www.renderbus.com/maxrender.php" style="color:#333333">快速提交任务</a></li>
          <li><a href="http://www.renderbus.com/fee.php" style="color:#333333">计费方式</a></li>
          <li><a href="http://www.renderbus.com/xunlei.php" style="color:#333333">迅雷高速下载分析结果</a></li>          
          <li style="list-style:none;margin-left:0px;"><a href="http://www.renderbus.com/about.php">更多指引</a></li>
        </ul>
		<div id="cpuload">
		<iframe src="cpuload.htm" width="160px" height="60px" frameborder="0" scrolling="no" style="background-color:#eeeeee"></iframe>
		</div>
		<div id="submmitBtContainer" style="padding-top:20px">
		<div id="bottomContainer">
        </div>
	
		</div>
		
		
      </div>
      <div class="clear"></div>
    </div>
    <!-------------------content----->
    <div class="line_solid"></div>
    <div class="BCorner"><b class="TBline4"><b></b></b> <b class="Bline3"><b></b></b><b class="Bline2"><b></b></b><b class="Bline1"></b> </div>
  </div>
  
  <div class="f_c"></div>
  
</div>
<!---end of s_main------>

<div class="s_footer">
<jsp:include page="cloudcenter/mesh_footer.jsp"></jsp:include>
</div>


</body></html>