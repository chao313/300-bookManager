<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.dao.ReaderDAO"%>
<%@ page import="com.actionForm.ReaderForm"%>
<%@ page import="java.util.*"%>
<%@ page import="com.core.ChStr"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	Collection coll = (Collection) request.getAttribute("reader");
	ChStr chStr = new ChStr();
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
	width: 1050px;
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
	
}

a:visited {
	/* color: white */
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
					<li><a href="index.jsp">读者管理</a></li>
					<li>></li>
					<li>读者档案管理</li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<%
					if (coll == null || coll.isEmpty()) {
				%>
				<table id="table1" border="0" cellspacing="" cellpadding="">
					<tr>
						<td align="center"><a href="reader_add.jsp" style="color:white;">
							<button type="button" id="orangeButton">添加读者信息</button></a>
						</td>
					</tr>
					<tr>
						<td>哎呦，没有读者类型啦，请添加读者档案！</td>
					</tr>
				</table>
				<%
					} else {
						//通过迭代方式显示数据
						Iterator it = coll.iterator();
						int ID = 0;
						String name = "";
						String typename = "";
						String barcode = "";
						String paperType = "";
						String paperNO = "";
						String tel = "";
						String email = "";
				%>
				<table id="table1" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="right"><a href="reader_add.jsp" style="color:white;"><button
									type="button" id="orangeButton">添加读者信息</a>
							</button></td>
					</tr>
					<tr>
						<td>
							<table id="table2" border="1px" cellspacing="0" cellpadding="0">
								<tr align="center" bgcolor="#e3F4F7">
									<th width="13%" bgcolor="#00a9da">条形码</th>
									<th width="7%" bgcolor="#00a9da">姓名</th>
									<th width="8%" bgcolor="#00a9da">读者类型</th>
									<th width="10%" bgcolor="#00a9da">证件类型</th>
									<th width="20%" bgcolor="#00a9da">证件号码</th>
									<th width="12%" bgcolor="#00a9da">电话</th>
									<th width="15%" bgcolor="#00a9da">Email</th>
									<th width="15%" bgcolor="#00a9da">操作</th>
								</tr>
								<%
									while (it.hasNext()) {
											ReaderForm readerForm = (ReaderForm) it.next();
											ID = readerForm.getId().intValue();
											name = readerForm.getName();
											barcode = readerForm.getBarcode();
											typename = chStr.nullToString(readerForm.getTypename(),
													"&nbsp;");
											paperType = readerForm.getPaperType();
											paperNO = chStr.nullToString(readerForm.getPaperNO(),
													"&nbsp;");
											tel = chStr.nullToString(readerForm.getTel(), "&nbsp;");
											email = chStr.nullToString(readerForm.getEmail(), "&nbsp;");
								%>
								<tr>

									<td style="padding:5px;"><%=barcode%></td>
									<td style="padding:5px; text-color:black;"><a
										href="reader?action=readerDetail&ID=<%=ID%>"><%=name%></a></td>
									<td style="padding:5px;"><%=typename%></td>
									<td align="center"><%=paperType%></td>
									<td align="center"><%=paperNO%></td>
									<td align="center"><%=tel%></td>
									<td align="center"><%=email%></td>
									<td align="center"><a
										href="reader?action=readerModifyQuery&ID=<%=ID%>"><button
												type="button" id="blueButton">修改</button></a> &nbsp <a
										href="reader?action=readerDel&ID=<%=ID%>"><button
												type="button" id="redButton">删除</button></a></td>
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
