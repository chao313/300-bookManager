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
<%
	Collection coll = (Collection) request.getAttribute("bookcase");
%>
<head>
<base href="<%=basePath%>">

<title>图书馆管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/button.css" />
<style>

#table1 {
	border: 0px solid red;
	width: 500px;
	margin: auto;
	margin-top: 20px;
	padding: 0px;

}

#table1 td {
	padding: 0px;
}

#table2 {
	border: 0px solid #0099cc;
	width: 100%;
	/* box-shadow: 10px 10px 5px #888888; */
}

#table2 th {
	color: white;
	text-align: center;
	background-color: #0099cc;
}

#table2 td {
	padding: 2px;
	color:black;
}

a:link {
	color: white;
}

a:visited {
	color: white
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
					<li><a href="#"> 书架设置</a></li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<%
					if (coll == null || coll.isEmpty()) {
				%>
				<table id="table1" border="0" cellspacing="" cellpadding="">
					<tr>
						<td align="center">
							<button type="button" id="orangeButton">添加书架
							
						</td>
					</tr>
					<tr>
						<td>暂无书架信息！请添加书架</td>
					</tr>
				</table>
				<%
					} else {
						//通过迭代方式显示数据
						Iterator it = coll.iterator();
						int ID = 0;
						String name = "";
				%>
				<table id="table1" border="0" cellspacing="" cellpadding="">
					<tr>
						<td align="right"><a
							onClick="window.open('bookcase_add.jsp','','width=292,height=160,top=250,left=550')"><button
									type="button" id="orangeButton">添加书架信息</a>
							</button></td>
					</tr>
					<tr>
						<td>
							<table id="table2" border="1" cellspacing="0" cellpadding="0">
								<tr>
									<th width="60%" align="center">书架名称</th>
									<th>操作</th>
									</td>
								</tr>
								<%
									while (it.hasNext()) {
											BookCaseForm bookCaseForm = (BookCaseForm) it.next();
											ID = bookCaseForm.getId().intValue();
											name = bookCaseForm.getName();
								%>
								<tr>
									<td><%=name%></td>
									<td align="center">
										<button type="button" id="blueButton">
											<a
												onClick="window.open('bookCase?action=bookCaseModifyQuery&ID=<%=ID%>','','width=292,height=175,top=250,left=550')">修改</a></a>
										</button>
										<button type="button" id="redButton">
											<a href="bookCase?action=bookCaseDel&ID=<%=ID%>">删除</a>
										</button>
									</td>
								</tr>
								<%
									}
									}
								%>
							</table>
						</td>
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
