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

<title>图书管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<script src="js/onclock.JS"></script>
<%
	String manager = (String) session.getAttribute("manager");
	//验证用户是否登录
	if (manager == null || "".equals(manager)) {
		response.sendRedirect("login.jsp");
	}
%>
<script language="javascript">
	function quit() {
		if (confirm("真的要退出系统吗?")) {
			window.location.href = "logout.jsp";
		}
	}
</script>
<style>
#bgclock {
	border: 0px solid red;
	margin-top: 0px;
	margin-buttom: 0px;
	width: 240px;
	height: 40px;
}
</style>
</head>

<body onload="clockon(bgclock)">
	<div id="header">
		<div class="logo">图书馆后台管理系统</div>

		<iframe name="sinaWeatherTool"
			src="http://weather.news.sina.com.cn/chajian/iframe/weatherStyle2.html?city=%E6%B3%B0%E5%B7%9E"
			width="200" height="20" marginwidth="0" marginheight="0" hspace="0"
			vspace="0" frameborder="0" scrolling="no"style="margin-top:25px ;float:left"></iframe>
			
		<div id="bgclock" style="color:white; float:left; "></div>
		<div id=""></div>

		<div class="navigation">
			<ul>
				<li>欢迎您！</li>
				<li><a href=""><%=manager%></a></li>
				<li><a href="manager?action=querypwd">修改密码</a></li>
				<li><a href="index.jsp">首页</a></li>
				<li><a onClick="quit()">退出</a></li>
			</ul>
		</div>
		<marquee scrollAmount=2 width=200 style="color: black;">欢迎来到图书馆后台管理系统！</marquee>
	</div>
</body>
</html>
