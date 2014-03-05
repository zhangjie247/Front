<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>
<title>File List</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="css/public.css" rel="stylesheet" type="text/css" />
<link href="css/control.css" rel="stylesheet" type="text/css" />

<script src="js/jquery-1.2.6.js" type="text/javascript"></script>
<script src="js/jquery.blockUI.js?v2.23" type="text/javascript" ></script>
<script src="js/fileoperator.js" type="text/javascript"></script>

<script language="javascript">
$(document).ready(function(){
	var currentPath = $("#currentPath").attr("value");
	var act = $("#act").attr("value");

	$(".dirParent").attr("href",function(n,v){
		var nameStr = this.id.toString();
		var fileName = nameStr.substring(0,nameStr.length - 4);
		return "javascript:listsub('" + currentPath + fileName + "','" + act + "','yes')";
	});
	$(".dirPath").attr("href",function(n,v){
		var nameStr = this.id.toString();
		var fileName = nameStr.substring(0,nameStr.length - 4);
		return "javascript:listsub('" + currentPath + fileName + "','" + act + "','no')";
	});
	
	if(act == 'f'){
	$(".dirMove").attr("href",function(n,v){
		var nameStr = this.id.toString();
		var fileName = nameStr.substring(0,nameStr.length - 4);
		return "javascript:move('" + currentPath +  "','" + fileName + "');";
	});
	$(".dirRen").attr("href",function(n,v){
		var nameStr = this.id.toString();
		var fileName = nameStr.substring(0,nameStr.length - 4);
		return "javascript:ren('" + currentPath +  "','" + fileName + "');";
	});
	$(".dirDel").attr("href",function(n,v){
		var nameStr = this.id.toString();
		var fileName = nameStr.substring(0,nameStr.length - 4);
		return "javascript:del('" + fileName + "');";
	});
	}else{
	$(".dirChoose").attr("href",function(n,v){
		var nameStr = this.id.toString();
		var fileName = nameStr.substring(0,nameStr.length - 4);
		return "javascript:chooseFile('" + fileName + "');";
	});
	}
	//当前路径和操作类型保存在currentPath控件中
	$("#currentPath").attr("value",currentPath);
	$("#act").attr("value",act);
});
</script>
</head>

<body>		
		<div id="mydiv" class="pardiv" style="width: 500px; padding-top: 5px">
			<img src="images/folder.gif" />
			&nbsp;
			<span style="font-size: 14px; font-weight: bold">/<s:property value="%{in_output}"/>/<s:property value="%{currPath}"/></span>
			&nbsp;&nbsp;
		</div>

		<div id="filetab" class="filediv"
			style="width: 720px; overflow: auto; height: 324px;">

			<table width="100%" id="filest" class="filetable">

			<thead>
				<tr>
				<td>文件名</td><td>大小</td><td>修改时间</td><td>操作</td></tr>
			</thead>
			
				<tr>
					<td>
						<img src="images/folder-closed.gif" />
						<s:a id="%{fileDisc[#stat.index].fileName}" cssClass="dirParent" theme="simple" title="To parent folder">[.&nbsp;.]</s:a>
					</td>
					<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
				</tr>
				
				<s:iterator value="fileDisc" status="stat" >
				<tr>
					<td>
						<s:if test='fileDisc[#stat.index].isDirectory == "true"'>
						<img src="images/folder-closed.gif" />
						<s:a  id="%{fileDisc[#stat.index].fileName + '_fid'}" cssClass="dirPath" theme="simple">
							<s:property value="%{fileDisc[#stat.index].fileName}"/>
						</s:a>
						</s:if>
						<s:else>
						<s:property value="%{fileDisc[#stat.index].fileName}"/>
						</s:else>
					</td>

					<td><s:property  value="%{fileDisc[#stat.index].size}"/></td>
					<td><s:date name="fileDisc[#stat.index].lastModified" format="yyyy-MM-dd HH:mm:ss"/></td>
					<td>
						<s:if test='act == "f"'>
							<s:a id="%{fileDisc[#stat.index].fileName + '_mov'}" cssClass="dirMove" theme="simple">移动</s:a>|
							<s:a id="%{fileDisc[#stat.index].fileName + '_ren'}" cssClass="dirRen" theme="simple">重命名</s:a>|
							<s:a id="%{fileDisc[#stat.index].fileName + '_dir'}" cssClass="dirDel" theme="simple">删除</s:a>
						</s:if>
						<s:else>
							<s:a id="%{fileDisc[#stat.index].fileName + '_cho'}" cssClass="dirChoose" theme="simple">选择</s:a>
						</s:else>
					</td>

				</tr>
				</s:iterator>
				
			</table>
		</div>
		
		<!--存储当前路径-->
		<s:hidden name="currentPath" id="currentPath" cssClass="currentPath" value="%{currPath}"></s:hidden>
		<s:hidden name="act" id="act" cssClass="act" value="%{act}"></s:hidden>

	</body>

</html>

