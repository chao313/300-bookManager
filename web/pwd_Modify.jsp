<%@page import="com.actionForm.ManagerForm"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	ManagerForm managerForm = (ManagerForm) request
			.getAttribute("pwdQueryif");
%>
<head>
<base href="<%=basePath%>">

<title>图书管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/button.css" />
<style>
#table1 {
	border: 0px solid red;
	width: 400px;
	margin: auto;
	margin-top: 20px;
	padding: 0px;
}

#table1 td {
	padding: 0px;
}

a:link {
	color: white;
}

a:visited {
	color: white
}
</style>
<script language="javascript">
	function checkForm(form) {
		if (form.oldpwd.value == "") {
			alert("请输入的原密码!");
			form.oldpwd.focus();
			return false;
		}
		if (form.oldpwd.value != form.holdpwd.value) {
			alert("您输入的原密码不正确，请重新输入!");
			form.oldpwd.value = "";
			form.oldpwd.focus();
			return false;
		}
		if (form.pwd.value == "") {
			alert("请输入的新密码!");
			form.pwd.focus();
			return false;
		}
		if (form.pwd1.value == "") {
			alert("请确认新密码!");
			form.pwd1.focus();
			return false;
		}
		if (form.pwd.value != form.pwd1.value) {
			alert("您两次输入的新密码不一致，请重新输入!");
			form.pwd.value = "";
			form.pwd1.value = "";
			form.pwd.focus();
			return false;
		}
	}
</script>
</head>

<body>
	<div class="top"></div>
	<jsp:include page="header.jsp" />
	<div id="content">
		<div id="left">
			<jsp:include page="left_menu.jsp" />
		</div>
		<div id="right">
			<div class="right-nav">
				<ul>
					<li><img src="images/home.png"></li>
					<li style="margin-left: 25px;">您当前的位置：</li>
					<li><a href="index.jsp">密码设置</a></li>
					<li>></li>
					<li>更改口令</li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<form name="form1" method="post" action="manager?action=modifypwd">
					<table id="table1">
						<tr align="center">
							<td width="27%" align="left" style="padding:5px;">管理员名称：</td>
							<td width="73%" align="left"><input name="name" type="text"
								id="name" value="<%=managerForm.getName()%>" readonly="yes"
								size="30"></td>
						<tr>
							<td align="left" style="padding:5px;">原密码：</td>
							<td align="left"><input name="oldpwd" type="password"
								id="oldpwd" size="30"> <input name="holdpwd"
								type="hidden" id="holdpwd" value="<%=managerForm.getPwd()%>"></td>
						</tr>
						<tr>
							<td align="left" style="padding:5px;">新密码：</td>
							<td align="left"><input name="pwd" type="password" id="pwd"
								size="30"></td>
						</tr>
						<tr>
							<td align="left" style="padding:5px;">确认新密码：</td>
							<td align="left"><input name="pwd1" type="password"
								id="pwd1" size="30"></td>
						</tr>
						<tr>
							<td height="65" align="left" style="padding:5px;">&nbsp;</td>
							<td><input name="Submit" type="submit" id="blueButton"
								value="保存" onClick="return checkForm(form1)"> &nbsp; <input
								name="Submit2" type="reset" id="redButton" value="取消"></td>
						</tr>
					</table>
				</form>
			</div>
			<div
				style="border:0px solid red;width:500px; margin: auto;margin-left: 300px; ">
				<table style="width:100%;">
					<tr>
						<td rowspan="2"><img alt="'" src="images/youqingtixing.gif"><td><font size="12" color="orange">温馨提示!</font></td></td>
					</tr>
					<tr>
						<td style="padding-top: 0px">为了密码的安全，请定期修改密码！</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="bottom"></div>
	<jsp:include page="footer.jsp" />
	<script>
		navList(12);
	</script>
</body>
</html>
