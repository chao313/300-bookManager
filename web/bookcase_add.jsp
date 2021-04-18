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

<title>添加书架信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/button.css" />
</head>

<body>
	<form name="form1" method="post" action="bookCase?action=bookCaseAdd">
		<table border="0px" style="width:270px;height:120px;">
			<tr>
				<td width="200px" aling="center"><font size="3" color="blue">书架名称：</font></td>
				<td><input name="name" type="text" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input name="Submit3" type="submit" id="blueButton"
					value="保存">&nbsp;
				<input name="Submit22" type="button" id="redButton"
					value="关闭" onClick="window.close();"></td>
			</tr>
		</table>
	</form>
</body>
</html>
