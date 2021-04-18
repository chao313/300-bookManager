<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.actionForm.BookTypeForm"%>
<%@ page import="com.core.ChStr"%>
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

<title>修改图书类型信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/button.css" />
</head>

<body>
	<%
		BookTypeForm bookTypeForm = (BookTypeForm) request
				.getAttribute("bookTypeQueryif");
		ChStr chStr = new ChStr();
	%>
	<form name="form1" method="post"
		action="bookType?action=bookTypeModify">
		<input name="id" type="hidden" size="50" value="<%=bookTypeForm.getId()%>">
		<table border="0px" style="width:270px;height:120px;">
			<tr>
				<td width="35%">类型名称：</td>
				<td><input name="typeName" type="text"
					value="<%=bookTypeForm.getTypeName()%>"></td>
			</tr>
			<tr>
				<td>可借天数：</td>
				<td><input name="days" type="text" size="13px"
					value="<%=bookTypeForm.getDays()%>"> (天)</td>
			</tr>
			<tr>
			<tr>
				<td colspan="2" align="center"><input name="Submit"
					type="submit" id="blueButton" value="保存">&nbsp;<input
					name="Submit2" type="reset" id="orangeButton" value="重置">&nbsp;<input
					name="Submit3" type="button" id="redButton"
					onClick="window.close()" value="关闭"></td>
			</tr>
		</table>
	</form>
</body>
</html>
