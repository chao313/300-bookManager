<%@page import="com.actionForm.ParameterForm"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	ParameterForm form = (ParameterForm) request
			.getAttribute("parameterModifyif");
	int cost = 0;
	int validity = 0;
%>
<head>
<base href="<%=basePath%>">

<title>图书馆管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
s
<style>
#left {
	border: 0px solid blue;
	width: 300px;
	float: left;
}

#right {
	border: 0px solid green;
	width: 1060px;
	float: right;
}

#table {
	border: 0px solid red;
	width: 400px;
	height: 150px;
	margin: auto;
	text-align: center;
	margin-top: 20px;
	background-color: wheat;
}
</style>
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
					<li><a href="#">系统设置</a></li>
					<li>></li>
					<li><a href="#"> 参数设置</a></li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<form name="form1" method="post"
					action="parameter?action=parameterModify">
					<%
						if (form != null) {
							cost = form.getCost();
							validity = form.getValidity();
						}
					%>
					<table id="table" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="100px">办证费：</td>
							<td align="left"><input name="cost" type="text" id="cost"
								value="<%=cost%>" size="30"> (元)</td>
						</tr>
						<tr>
							<td>有效期限：</td>
							<td align="left"><input name="validity" type="text"
								id="validity" size="30" value="<%=validity%>"> (月)</td>
						</tr>
						<tr>
							<td colspan="2"><input name="Submit" type="submit"
								class="btn_grey" value="保存">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="Submit2"
								type="reset" class="btn_grey" value="取消"></td>
						</tr>
					</table>
					<!-- </form> -->
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
