<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.dao.BorrowDAO"%>
<%@ page import="com.actionForm.BorrowForm"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	Collection coll = (Collection) request.getAttribute("Bremind");
%>
<head>
<base href="<%=basePath%>">

<title>图书馆管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
					<li><a href="index.jsp">系统查询</a></li>
					<li>></li>
					<li>借阅到期提醒</li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<%
					if (coll == null || coll.isEmpty()) {
				%>
				<table width="100%" height="30" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="36" align="center">暂无到期提醒信息！</td>
					</tr>
				</table>
				<%
					} else {
						//通过迭代方式显示数据
						Iterator it = coll.iterator();
						String bookname = "";
						String bookbarcode = "";
						String readerbar = "";
						String readername = "";
						String borrowTime = "";
						String backTime = "";
				%>
				<table width="98%" border="1" cellpadding="0" cellspacing="0"
					bordercolor="#FFFFFF" bordercolordark="#F6B83B"
					bordercolorlight="#FFFFFF">
					<tr align="center" bgcolor="#e3F4F7">
						<td width="15%" bgcolor="#00a9da">图书条形码</td>
						<td width="28%" bgcolor="#00a9da">图书名称</td>
						<td width="17%" bgcolor="#00a9da">读者条形码</td>
						<td width="9%" bgcolor="#00a9da">读者名称</td>
						<td width="15%" bgcolor="#00a9da">借阅时间</td>
						<td width="16%" bgcolor="#00a9da">应还时间</td>
					</tr>
					<%
						while (it.hasNext()) {
								BorrowForm borrowForm = (BorrowForm) it.next();
								bookname = borrowForm.getBookName();
								bookbarcode = borrowForm.getBookBarcode();
								readerbar = borrowForm.getReaderBarcode();
								readername = borrowForm.getReaderName();
								borrowTime = borrowForm.getBorrowTime();
								backTime = borrowForm.getBackTime();
					%>
					<tr>
						<td style="padding:5px;">&nbsp;<%=bookbarcode%></td>
						<td style="padding:5px;"><%=bookname%></td>
						<td style="padding:5px;">&nbsp;<%=readerbar%></td>
						<td style="padding:5px;">&nbsp;<%=readername%></td>
						<td style="padding:5px;">&nbsp;<%=borrowTime%></td>
						<td style="padding:5px;">&nbsp;<%=backTime%></td>
					</tr>
					<%
						}
						}
					%>
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
