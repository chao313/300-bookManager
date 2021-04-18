<%@page import="com.actionForm.ManagerForm"%>
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
	String flag = "mr";
	Collection coll = (Collection) request.getAttribute("managerQuery");
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
	width: 1000px;
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
	color: black;
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
					<li><a href="#">管理员设置</a></li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<%
					if (coll == null || coll.isEmpty()) {
				%>
				<table id="table1" border="0" cellspacing="" cellpadding="">
					<tr>
						<td align="center">
							<button type="button" id="orangeButton">添加管理员信息
						</td>
					</tr>
					<tr>
						<td>暂无管理员信息！请添加管理员</td>
					</tr>
				</table>
				<%
					} else {
						//通过迭代方式显示数据
						Iterator it = coll.iterator();
						int ID = 0;
						String name = "";
						int sysset = 0;
						int readerset = 0;
						int bookset = 0;
						int borrowback = 0;
						int sysquery = 0;
				%>
				<table id="table1" border="0" cellspacing="" cellpadding="">
					<tr>
						<td align="right"><button type="button" id="orangeButton">
								<a
									onClick="window.open('manager_add.jsp','','width=320,height=160,top=250,left=550')">添加管理员信息</a>
							</button></td>
					</tr>
					<tr>
						<td>
							<table id="table2" border="1" cellspacing="0" cellpadding="0">
								<tr align="center" bgcolor="#e3F4F7">
									<th width="23%">管理员名称</th>
									<th width="12%">系统设置</th>
									<th width="12%">读者管理</th>
									<th width="12%">图书管理</th>
									<th width="11%">图书借还</th>
									<th width="10%">系统查询</th>
									<th width="20%">操作</th>
								</tr>
								<%
									while (it.hasNext()) {

											ManagerForm managerForm = (ManagerForm) it.next();
											ID = managerForm.getId().intValue();
											name = managerForm.getName();
											sysset = managerForm.getSysset();
											readerset = managerForm.getReaderset();
											bookset = managerForm.getBookset();
											borrowback = managerForm.getBorrowback();
											sysquery = managerForm.getSysquery();
								%>
								<tr>
									<td align="center" style="padding:5px;"><%=name%></td>
									<td align="center"><input name="checkbox" type="checkbox"
										class="noborder" value="checkbox" disabled="disabled"
										<%if (sysset == 1) {
						out.println("checked");
					}%>></td>
									<td align="center"><input name="checkbox" type="checkbox"
										class="noborder" value="checkbox" disabled="disabled"
										<%if (readerset == 1) {
						out.println("checked");
					}%>></td>
									<td align="center"><input name="checkbox" type="checkbox"
										class="noborder" value="checkbox" disabled
										<%if (bookset == 1) {
						out.println("checked");
					}%>></td>
									<td align="center"><input name="checkbox" type="checkbox"
										class="noborder" value="checkbox" disabled
										<%if (borrowback == 1) {
						out.println("checked");
					}%>></td>
									<td align="center"><input name="checkbox" type="checkbox"
										class="noborder" value="checkbox" disabled
										<%if (sysquery == 1) {
						out.println("checked");
					}%>></td>
									<td align="center">
										<%
											if (!name.equals(flag)) {
										%><button type="button" id="blueButton">
											<a
												onClick="window.open('manager?action=managerModifyQuery&id=<%=ID%>','','width=370,height=180,top=250,left=550')">权限设置</a>
										</button>&nbsp&nbsp&nbsp
										<button type="button" id="redButton">
											<a href="manager?action=managerDel&id=<%=ID%>">删除</a>
										</button> <%
 	} else {
 %>&nbsp;<%
 	}
 %>
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
