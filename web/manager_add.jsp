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

<title>图书管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/button.css" />
<script language="javascript">
	function check(form) {
		if (form.name.value == "") {
			alert("请输入管理员名称!");
			form.name.focus();
			return;
		}
		if (form.pwd.value == "") {
			alert("请输入管理员密码!");
			form.pwd.focus();
			return;
		}
		if (form.pwd1.value == "") {
			alert("请确认管理员密码!");
			form.pwd1.focus();
			return;
		}
		if (form.pwd.value != form.pwd1.value) {
			alert("您两次输入的管理员密码不一致，请重新输入!");
			form.pwd.focus();
			return;
		}
		form.submit();
	}
</script>
</head>

<body>
	<form name="form1" method="post" action="manager?action=managerAdd">
		<table border="0px" style="width:290px;height:120px;">
			<tr>
				<td width="200px" aling="center"><font size="3" color="blue">管理员名称：</font></td>
				<td><input name="name" type="text"></td>
			</tr>
			<tr>
				<td width="200px" aling="center"><font size="3" color="blue">管理员密码：</font></td>
				<td><input name="pwd" type="password"></td>
			</tr>
			<tr>
				<td width="200px" aling="center"><font size="3" color="blue">确认&nbsp密码：</font></td>
				<td><input name="pwd1" type="password"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input name="Button"
					type="button" id="blueButton" onClick="check(form1)" value="保存">&nbsp;
					<input name="Submit2" type="button" id="redButton" value="关闭"
					onClick="window.close();"></td>
			</tr>
		</table>
	</form>
</body>
</html>
