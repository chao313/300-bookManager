<%@page import="com.actionForm.BookCaseForm"%>
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

<title>修改书架信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/button.css" />

</head>

<body>
	<%
		BookCaseForm bookCaseForm = (BookCaseForm) request
				.getAttribute("bookCaseQueryif");
	%>
	<form name="form1" method="post"
		action="bookCase?action=bookCaseModify">
		<table border="0px" style="width:270px;height:120px;">
			<tr>
				<td width="200px" aling="center"><font size="3" color="blue">书架名称：</font></td>
				<td><input name="id" type="hidden" size="50"
					value="<%=bookCaseForm.getId()%>"> <input name="name"
					type="text" value="<%=bookCaseForm.getName()%>"></td>
			</tr>
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
