<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
 
 
<title>任务提交--参数选择</title>
<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/control.css" rel="stylesheet" type="text/css" />

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script src="js/jquery-1.2.6.js" type="text/javascript"></script>
<script src="js/jquery.blockUI.js?v2.23" type="text/javascript"></script>
<script src="js/fileoperator.js" type="text/javascript"></script>

<script language="javascript">

$(document).ready(function(){
	$("#kmeansForm").show();
	$("#currAlog").attr("value","kmeans");
	
});

function changeAlog(){
	var oldSelected = $("#currAlog").attr("value");
	var selector = document.getElementById("alogSelector"); 
	var selected = selector.options[selector.selectedIndex].value;
	var oldForm = $("#" + oldSelected + "Form");
	var newForm = $("#" + selected + "Form");
	oldForm.slideUp("normal",function(){
		newForm.slideDown();
	});

	$("#currAlog").attr("value",selected);
};

function switchParam(method){
	var btn = $("#switch_btn_" + method);
	var value = btn.attr("value");
	if(value == "高级参数"){
		$(".seniorParam_" + method).show();
		$(".tip").show();
		$("#switch_btn_" + method).attr("value","隐藏");
	}else{
		$(".tip").hide();
		$(".seniorParam_" + method).hide();
		$("#switch_btn_" + method).attr("value","高级参数");
	}
}

</script>

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
		任务提交
		--
		参数选择
    &nbsp;</div>
  </div>
	
  <div class="CBody">
	<div class="main_content">    
    <!--content---------------------->	
	<br><span class="mustin"></span><br>
	
	<form id="alogForm">
	请选择算法:<select name="cars" id="alogSelector" onchange="changeAlog()">
	<option value="kmeans" selected="selected">kmeans</option>
	<option value="fpgrowth">fpgrowth</option>
	<option value="itembased">itembased</option>
	</select>
	</form>

	<!--Kmeans  -->
    <s:form id="kmeansForm" cssStyle="display:none; width:90%" name="kmeansParam" onsubmit="return true;" action="processDMParam" method="post" theme="simple">
	
	  <table border="0" cellpadding="0" cellspacing="0" width="750">
		<tbody>
		<tr>
			<td height="59" colspan="3" align="left">
				<b>可以填入默认参数</b>
				&nbsp;			</td>
		</tr>
		
		<%--
		<!-- 算法需要的文件 -->
		<s:iterator value="kmeansFileDisc" status="stat">
		<tr>
			<td width="200" height="40"><s:property value="%{kmeansFileDisc[#stat.index].tip}"/></td>
			<td width="200">
		  	<s:textfield id="%{'kmeans' + kmeansFileDisc[#stat.index].name}" cssClass="logininput1" cssStyle="width:180px" name="%{'paramKmeans.' + kmeansFileDisc[#stat.index].name}" value="">
		  	</s:textfield></td>	
		  	<td><input class="mbtn" type="button" onclick="cf('kl_input','c');" value="浏览"/></td>
		</tr>
		</s:iterator>
		 --%>
		 
		<tr>
			<td width="200" height="40">本地输入文件</td>
			<td width="200">
		  	<input class="logininput1" id="kl_input" style="width:180px" name="paramKmeans.input_file" value=""></input></td>	
		  	<td><input class="mbtn" type="button" onclick="javascript:cf('kl_input','c');" value="浏览"/></td>
		</tr>
		<tr>
			<td width="200" height="40">结果保存本地文件</td>
			<td width="200">
		  	<input class="logininput1" id="kl_output" style="width:180px" name="paramKmeans.output_result" value=""></input></td>	
		  	<td><input class="mbtn" type="button" onclick="javascript:cf('kl_output','o');" value="浏览"/></td>
		</tr>
		
		<!-- 算法参数必填字段 -->
		<s:iterator value="kmeansDisc" status="stat">
		<s:if test='kmeansDisc[#stat.index].type == "param"'>
		<s:if test='kmeansDisc[#stat.index].required == "yes"'>
		<tr>
			<td width="200" height="40"><s:property value="%{kmeansDisc[#stat.index].name}"/></td>
			<td width="200">
			<s:textfield cssClass="logininput1" cssStyle="width:180px" name="%{'paramKmeans.' + kmeansDisc[#stat.index].name}" value="%{kmeansDisc[#stat.index].defaultValue}"></s:textfield></td>	
			<td><s:div id="%{kmeansDisc[#stat.index].name + '_alert'}" cssStyle="width:350px" cssClass="onShow">&nbsp;</s:div></td>
		</tr>
		<tr>
		  <td width="200">&nbsp;</td>
		  <td width="200" style="color:#999"><s:property value="%{kmeansDisc[#stat.index].tip}"/></td>
		</tr>
		</s:if>
		</s:if>
		</s:iterator>
		
		
				
		<tr>
			<td><input id="switch_btn_kmeans" class="mbtn" type="button" onClick="switchParam('kmeans');" value="高级参数"/></td>
		</tr>
		
		<!-- 算法参数高级字段 -->
		<s:iterator value="kmeansDisc" status="stat">	
		<s:if test='kmeansDisc[#stat.index].type == "param"'>
		<s:if test='kmeansDisc[#stat.index].required != "yes"'>
		<tr class="seniorParam_kmeans" style="display: none;">
		  <td width="200" height="40"><s:property value="%{kmeansDisc[#stat.index].name}"/></td>	  
		  <td width="200">
		  <s:textfield cssClass="logininput1" cssStyle="width:180px" name="%{'paramKmeans.' + kmeansDisc[#stat.index].name}" value="%{kmeansDisc[#stat.index].defaultValue}"></s:textfield></td>	  
		  <td><s:div id="%{kmeansDisc[#stat.index].name + '_alert'}" cssStyle="width:350px" cssClass="onShow">&nbsp;</s:div></td>
		</tr>
		<tr class="seniorParam_kmeans" style="display: none;">
		  <td width="200">&nbsp;</td>
		  <td style="width:200px; color:#999;"><s:property value="%{kmeansDisc[#stat.index].tip}"/></td>
		</tr>		
		</s:if>
		</s:if>
		</s:iterator>
		
		<tr>
			<td>&nbsp;</td>
		 	<td>
			<div style="width:2px; height:2px; overflow:hidden" >
					
					<input type="image" name="button" src="images/login_btn_cn.gif">
				
			</div>
			&nbsp;	
			<div class="btn4">
				<div class="btn_text3" onClick="document.getElementById('kmeansForm').submit();">提交	</div>
			</div>

			</td>
		 	<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		 	<td>&nbsp;
				<input type="hidden" id="kmeansMethod" name="task.method" value="kmeans"/>
			</td>
		 	<td>&nbsp;</td>
		</tr>

		</tbody></table>
    </s:form>

	<!-- fpgrowth -->
 	<s:form id="fpgrowthForm" cssStyle="display:none;" name="fpgrowthparam" onsubmit="return true;" action="processDMParam" method="post" theme="simple">
	
	  <table border="0" cellpadding="0" cellspacing="0" width="750">
		<tbody>
		<tr>
			<td height="59" colspan="3" align="left">
				<b>可以填入默认参数</b>
				&nbsp;			</td>
		</tr>
		
		<tr>
			<td width="200" height="40">本地输入文件</td>
			<td width="200">
		  	<input class="logininput1" id="fl_input" style="width:180px" name="paramFpgrowth.input_file" value=""></input></td>	
		  	<td><input class="mbtn" type="button" onclick="javascript:cf('fl_input','c');" value="浏览"/></td>
		</tr>
		
		<tr>
			<td width="200" height="40">结果保存本地文件</td>
			<td width="200">
		  	<input class="logininput1" id="fl_output" style="width:180px" name="paramFpgrowth.output_result" value=""></input></td>	
		  	<td><input class="mbtn" type="button" onclick="javascript:cf('fl_output','o');" value="浏览"/></td>
		</tr>
		
		<!-- 算法参数必填字段 -->
		<s:iterator value="fpgrowthDisc" status="stat">
		<s:if test='fpgrowthDisc[#stat.index].type == "param"'>
		<s:if test='fpgrowthDisc[#stat.index].required == "yes"'>
		<tr>
			<td width="200" height="40"><s:property value="%{fpgrowthDisc[#stat.index].name}"/></td>
			<td width="200">
			<s:textfield cssClass="logininput1" cssStyle="width:180px" name="%{'paramFpgrowth.' + fpgrowthDisc[#stat.index].name}" value="%{fpgrowthDisc[#stat.index].defaultValue}"></s:textfield></td>	
			<td><s:div id="%{fpgrowthDisc[#stat.index].name + '_alert'}" cssStyle="width:350px" cssClass="onShow">&nbsp;</s:div></td>
		</tr>
		<tr>
		  <td width="200">&nbsp;</td>
		  <td width="200" style="color:#999"><s:property value="%{fpgrowthDisc[#stat.index].tip}"/></td>
		</tr>
		</s:if>
		</s:if>
		</s:iterator>
		
		
				
		<tr>
			<td><input id="switch_btn_fpgrowth" class="mbtn" type="button" onClick="switchParam('fpgrowth');" value="高级参数"/></td>
		</tr>
		
		<!-- 算法参数高级字段 -->
		<s:iterator value="fpgrowthDisc" status="stat">	
		<s:if test='fpgrowthDisc[#stat.index].type == "param"'>
		<s:if test='fpgrowthDisc[#stat.index].required != "yes"'>
		<tr class="seniorParam_fpgrowth" style="display: none;">
		  <td width="200" height="40"><s:property value="%{fpgrowthDisc[#stat.index].name}"/></td>	  
		  <td width="200">
		  <s:textfield cssClass="logininput1" cssStyle="width:180px" name="%{'paramFpgrowth.' + fpgrowthDisc[#stat.index].name}" value="%{fpgrowthDisc[#stat.index].defaultValue}"></s:textfield></td>	  
		  <td><s:div id="%{fpgrowthDisc[#stat.index].name + '_alert'}" cssStyle="width:350px" cssClass="onShow">&nbsp;</s:div></td>
		</tr>
		<tr class="seniorParam_fpgrowth" style="display: none;">
		  <td width="200">&nbsp;</td>
		  <td style="width:200px; color:#999;"><s:property value="%{fpgrowthDisc[#stat.index].tip}"/></td>
		</tr>		
		</s:if>
		</s:if>
		</s:iterator>

		<tr>
			<td>&nbsp;</td>
		 	<td>
			<div style="width:2px; height:2px; overflow:hidden" >
					
					<input type="image" name="button" src="images/login_btn_cn.gif">
				
			</div>
			&nbsp;	
			<div class="btn4">
				<div class="btn_text3" onClick="document.getElementById('fpgrowthForm').submit();">提交	</div>
			</div>

			</td>
		 	<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		 	<td>&nbsp;
				<input type="hidden" id="fpgrowthMethod" name="task.method" value="fpgrowth"/>
			</td>
		 	<td>&nbsp;</td>
		</tr>
		
		</tbody></table>
    </s:form>
    
    <!-- itembased -->
    <s:form id="itembasedForm" cssStyle="display:none;" name="itembasedparam" onsubmit="return true;" action="processDMParam" method="post" theme="simple">
	
	  <table border="0" cellpadding="0" cellspacing="0" width="750">
		<tbody>
		<tr>
			<td height="59" colspan="3" align="left">
				<b>可以填入默认参数</b>
				&nbsp;			</td>
		</tr>
		
		<tr>
			<td width="200" height="40">本地输入文件</td>
			<td width="200">
		  	<input class="logininput1" id="il_input" style="width:180px" name="paramItembased.input_file" value=""></input></td>	
		  	<td><input class="mbtn" type="button" onclick="javascript:cf('il_input','c');" value="浏览"/></td>
		</tr>
		
		<tr>
			<td width="200" height="40">本地用户名文件</td>
			<td width="200">
		  	<input class="logininput1" id="il_username" style="width:180px" name="paramItembased.itembased_usersFile" value=""></input></td>	
		  	<td><input class="mbtn" type="button" onclick="javascript:cf('il_username','c');" value="浏览"/></td>
		</tr>
		
		<tr>
			<td width="200" height="40">本地项目ID文件</td>
			<td width="200">
		  	<input class="logininput1" id="il_projid" style="width:180px" name="paramItembased.itembased_itemsFile" value=""></input></td>	
		  	<td><input class="mbtn" type="button" onclick="javascript:cf('il_projid','c');" value="浏览"/></td>
		</tr>
		
		<tr>
			<td width="200" height="40">本地排除项文件</td>
			<td width="200">
		  	<input class="logininput1" id="il_exfid" style="width:180px" name="paramItembased.itembased_filterFile" value=""></input></td>	
		  	<td><input class="mbtn" type="button" onclick="javascript:cf('il_exfid','c');" value="浏览"/></td>
		</tr>
		
		<tr>
			<td width="200" height="40">结果保存本地文件</td>
			<td width="200">
		  	<input class="logininput1" id="il_output" style="width:180px" name="paramItembased.output_result" value=""></input></td>	
		  	<td><input class="mbtn" type="button" onclick="javascript:cf('il_output','o');" value="浏览"/></td>
		</tr>
		
		<!-- 算法参数必填字段 -->
		<s:iterator value="itembasedDisc" status="stat">
		<s:if test='itembasedDisc[#stat.index].type == "param"'>
		<s:if test='itembasedDisc[#stat.index].required == "yes"'>
		<tr>
			<td width="200" height="40"><s:property value="%{itembasedDisc[#stat.index].name}"/></td>
			<td width="200">
			<s:textfield cssClass="logininput1" cssStyle="width:180px" name="%{'paramItembased.' + itembasedDisc[#stat.index].name}" value="%{itembasedDisc[#stat.index].defaultValue}"></s:textfield></td>	
			<td><s:div id="%{itembasedDisc[#stat.index].name + '_alert'}" cssStyle="width:350px" cssClass="onShow">&nbsp;</s:div></td>
		</tr>
		<tr>
		  <td width="200">&nbsp;</td>
		  <td width="200" style="color:#999"><s:property value="%{itembasedDisc[#stat.index].tip"/></td>
		</tr>
		</s:if>
		</s:if>
		</s:iterator>
		
		
				
		<tr>
			<td><input id="switch_btn_itembased" class="mbtn" type="button" onClick="switchParam('itembased');" value="高级参数"/></td>
		</tr>
		
		<!-- 算法参数高级字段 -->
		<s:iterator value="itembasedDisc" status="stat">	
		<s:if test='itembasedDisc[#stat.index].type == "param"'>
		<s:if test='itembasedDisc[#stat.index].required != "yes"'>
		<tr class="seniorParam_itembased" style="display: none;">
		  <td width="200" height="40"><s:property value="%{itembasedDisc[#stat.index].name}"/></td>	  
		  <td width="200">
		  <s:textfield cssClass="logininput1" cssStyle="width:180px" name="%{'paramItembased.' + itembasedDisc[#stat.index].name}" value="%{itembasedDisc[#stat.index].defaultValue}"></s:textfield></td>	  
		  <td><s:div id="%{itembasedDisc[#stat.index].name + '_alert'}" cssStyle="width:350px" cssClass="onShow">&nbsp;</s:div></td>
		</tr>
		<tr class="seniorParam_itembased" style="display: none;">
		  <td width="200">&nbsp;</td>
		  <td style="width:200px; color:#999;"><s:property value="%{itembasedDisc[#stat.index].tip}"/></td>
		</tr>		
		</s:if>
		</s:if>
		</s:iterator>

		<tr>
			<td>&nbsp;</td>
		 	<td>
			<div style="width:2px; height:2px; overflow:hidden" >
					
					<input type="image" name="button" src="images/login_btn_cn.gif">
				
			</div>
			&nbsp;	
			<div class="btn4">
				<div class="btn_text3" onClick="document.getElementById('itembasedForm').submit();">提交	</div>
			</div>

			</td>
		 	<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		 	<td>&nbsp;
				<input type="hidden" id="itembasedMethod" name="task.method" value="itembased"/>
			</td>
		 	<td>&nbsp;</td>
		</tr>
		
		</tbody></table>
    </s:form>

<br>

<!-- 选择文件操作窗口 -->
<div id="cfile_nav" style="display:none;padding:15 15 10 10;">

  <!-- 文件浏览窗口 -->
  <div id="cfilecontainer" style="width:750px; height:350px;">&nbsp;
  	<img src="images/loading.gif" style="margin-top:50px; margin-left:300px" />
  </div>

  <!-- 所选择文件信息显示窗口 -->
  <div id="upDiv"  style="width:780px;">
	<table class="filetable" style="margin-top:5px" id="filebox" width="90%">
	<thead>
		<tr>
			<td>Files been chosen</td>
			<td>Size</td>
			<td>Status</td>
		</tr>
	</thead>
	</table>
	<br/>
  </div>

<!-- 确定/取消按钮 -->
  <div id="unpDiv" style="margin-bottom:5px;">
    <div style="float:left; width:200px;" id="otbtnDiv">
	  <input class="mbtn"  type="button" value="确定" onClick="cfsub();"/>&nbsp;&nbsp;&nbsp;&nbsp;
	  <input class="mbtn" type="button"  value="取消" onClick="quit();"/>
    </div>
  </div>

</div>

<!-- 保存运行中的一些页面变量 -->
<input type="hidden" name="currAlog" id="currAlog" value="" />
<input type="hidden" name="inputTo" id="inputTo" value="" />
<input type="hidden" name="filePath" id="filePath" size="40" value=""/>
<input type="hidden" name="fileName" id="fileName" size="40" value=""/>
  			
</div><!-------------------content----->  

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