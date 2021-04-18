<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>添加读者类型信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/button.css" />
<script language="jscript">
	
	
function check(form){
	if(form.name.value==""){
		alert("请输入类型名称!");form.name.focus();return false;
	}
	if(form.number.value==""){
		alert("请输入可借数量!");form.number.focus();return false;
	}	
}


</script>
</head>

<body>
	<form name="form1" method="post" action="readerType?action=readerTypeAdd">
		<table border="0px" style="width:270px;height:120px;">
			<tr>
				<td width="180px" align="center"><font size="3" color="blue">类型名称：</font></td>
				<td><input name="name" type="text" size="20"></td>
			</tr>
			<tr>
				<td align="center"><font size="3" color="blue">可借数量：</font></td>
				<td height="35"><input name="number" type="text" id="number" size="14">(本)</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input name="Submit1"
					type="submit" id="blueButton" value="保存" onClick="return check(form1)">&nbsp; <input
					name="Submit2" type="button" id="redButton" value="关闭"
					onClick="window.close();"></td>
			</tr>
		</table>
	</form>
</body>
</html>
