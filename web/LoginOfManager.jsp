<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>图书馆后台管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
body {
	background-color: #F1F5FA;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
}

img {
	border: 0px;
}

.wz {
	font-family: "宋体";
	font-size: 14px;
	color: #0C4B7A;
}

.boy {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #A1A3A6;
}

.STYLE3 {
	font-size: 9pt
}

.form-input {
	width: 130px;
	border: 1px solid #2278c1;
}
</style>
<script>
	function check(form) {
		if (form.name.value == "") {
			alert("请输入管理员名称!");
			form.name.focus();
			return false;
		}
		if (form.pwd.value == "") {
			alert("请输入密码!");
			form.pwd.focus();
			return false;
		}
	}
</script>
</head>

<body>
	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>
				<!--main-table开始-->
				<table width="711" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td colspan="4"><img src="img/login_top.gif" width="711"
							height="12" /></td>
					</tr>
					<tr>
						<td width="12"><img src="img/login_le.gif" width="12"
							height="302" /></td>
						<td width="418"><img src="img/tp2.jpg" width="418"
							height="302" /></td>
						<td width="269" valign="top" background="img/logo_bj.jpg">
							<!--login开始-->
							<form name="form1" method="post" action="manager?action=login">
								<table width="92%" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="47" colspan="3">&nbsp;</td>
									</tr>
									<tr>
										<td colspan="3"><img src="img/logo_1.gif" width="244"
											height="26"></td>
									</tr>
									<tr>
										<td height="33" colspan="3">&nbsp;</td>
									</tr>
									<tr>
										<td width="13%"><img src="img/yh.gif" width="25"
											height="29"></td>
										<td width="27%" align="center" class="wz">用户名:</td>
										<td align="left"><input name="name" type="text"
											class="form-input" id="name"></td>
									</tr>
									<tr>
										<td height="14" colspan="3"></td>
									</tr>
									<tr>
										<td width="13%"><img src="img/mm.gif" width="25"
											height="29"></td>
										<td width="27%" align="center" class="wz">密 码:</td>
										<td align="left"><input name="pwd" type="password"
											class="form-input" id="pwd"></td>
									</tr>
									<tr>
										<td height="14" colspan="3"></td>
									</tr>
									<tr>
										<td height="22" colspan="2">&nbsp;</td>
										<td height="34" valign="top"><!-- <input type="checkbox"><span
											class="STYLE3">记住密码</span> --></td>
									</tr>
									<tr>
										<td colspan="2" align="center"></td>
										<!-- <td align="left"><a href="main.htm"><img src="img/dl.gif"></a></td>-->
										<td align="left"><input type="submit" id="button"
											name="Submit" class="btn_grey" onClick="return check(form1)"
											style="background:url('img/dl.gif') no-repeat;width:80px;height:28px;"
											value=""></td>
									</tr>
								</table>
							</form> <!--login结束-->
						</td>
						<td width="12"><img src="img/login_ri.gif" width="12"
							height="302" /></td>
					</tr>
					<tr>
						<td colspan="4"><img src="img/login_dow.gif" width="711"
							height="12" /></td>
					</tr>
				</table> <!--main-table结束--> <!--foot开始-->
				<table width="711" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td align="center" class="boy">版权所有:xxxx</td>
					</tr>
				</table> <!--foot结束-->
			</td>
		</tr>
	</table>
</body>
</html>
