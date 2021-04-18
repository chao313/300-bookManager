<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.dao.ManagerDAO"%>
<%@ page import="com.actionForm.ManagerForm"%>
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
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<%
	String power = (String) session.getAttribute("power");//通过获得该管理员的姓名获得该管理员的权限
	ManagerDAO managerDAO = new ManagerDAO();
	ManagerForm form1 = (ManagerForm) managerDAO.query_p(power);
	int sysset1 = 0;
	int readerset1 = 0;
	int bookset1 = 0;
	int borrowback1 = 0;
	int sysquery1 = 0;
	if (form1 != null) {
		sysset1 = form1.getSysset();
		readerset1 = form1.getReaderset();
		bookset1 = form1.getBookset();
		borrowback1 = form1.getBorrowback();
		sysquery1 = form1.getSysquery();
	}
%>
</head>

<body>
	<div class="left_menu">
		<ul id="nav_dot">
			<%!String d = "false";%>
			 <%if(sysset1==1){%>
			<li style=" display:<%=d%>;">
				<h4 class="M1">
					<span></span>系统设置
				</h4>
				<div class="list-item none">
					<a href="library?action=libraryQuery">图书馆信息</a> <a
						href='manager?action=managerQuery'>管理员设置</a> <a
						href="parameter?action=parameterQuery">参数设置</a> <a
						href='bookCase?action=bookCaseQuery'>书架设置</a>
				</div>
			</li>
			<%}%><%if(readerset1==1){%>
			<li>
				<h4 class="M2">
					<span></span>读者管理
				</h4>
				<div class="list-item none">
					<a href="readerType?action=readerTypeQuery">读者类型管理</a> <a
						href="reader?action=readerQuery">读者档案管理</a>
				</div>
			</li>
			<%}%><%if(bookset1==1){%>
			<li>
				<h4 class="M3">
					<span></span>图书管理
				</h4>
				<div class="list-item none">
					<a href="bookType?action=bookTypeQuery">图书类型管理</a> <a
						href="book?action=bookQuery">图书档案管理</a>
				</div>
			</li>
			<%}%><%if(borrowback1==1){%>
			<li>
				<h4 class="M4">
					<span></span>图书借还
				</h4>
				<div class="list-item none">
					<a href="bookBorrow.jsp">图书借阅</a> <a href="bookRenew.jsp">图书续借</a>
					<a href="bookBack.jsp">图书归还</a>
				</div>
			</li>
			<%}%><%if(sysquery1==1){%>
			<li>
				<h4 class="M5">
					<span></span>系统查询
				</h4>
				<div class="list-item none">
					<a href="book?action=bookifQuery">图书档案查询</a> <a
						href="borrow?action=borrowQuery">图书借阅查询</a> <a
						href="borrow?action=Bremind">借阅到期提醒</a>
				</div>
			</li>
			 <%}%>
			<!-- <li>
				<h4 class="M6">
					<span></span>数据统计
				</h4>
				<div class="list-item none">
					<a href=''>数据统计1</a> <a href=''>数据统计2</a> <a href=''>数据统计3</a>
				</div>
			</li>
			<li>
				<h4 class="M7">
					<span></span>奖励管理
				</h4>
				<div class="list-item none">
					<a href=''>奖励管理1</a> <a href=''>奖励管理2</a> <a href=''>奖励管理3</a>
				</div>
			</li>
			<li>
				<h4 class="M8">
					<span></span>字典维护
				</h4>
				<div class="list-item none">
					<a href=''>字典维护1</a> <a href=''>字典维护2</a> <a href=''>字典维护3</a> <a
						href=''>字典维护4</a> <a href=''>字典维护5</a> <a href=''>字典维护6</a> <a
						href=''>字典维护7</a> <a href=''>字典维护8</a> <a href=''>字典维护9</a> <a
						href=''>字典维护4</a> <a href=''>字典维护5</a> <a href=''>字典维护6</a> <a
						href=''>字典维护7</a> <a href=''>字典维护8</a> <a href=''>字典维护9</a>
				</div>
			</li>
			<li>
				<h4 class="M9">
					<span></span>内容管理
				</h4>
				<div class="list-item none">
					<a href=''>内容管理1</a> <a href=''>内容管理2</a> <a href=''>内容管理3</a>
				</div>
			</li>
			<li>
				<h4 class="M10">
					<span></span>系统管理
				</h4>
				<div class="list-item none">
					<a href=''>系统管理1</a> <a href=''>系统管理2</a> <a href=''>系统管理3</a>
				</div>
			</li> -->
		</ul>
	</div>
</body>
</html>
