<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.dao.BookDAO"%>
<%@ page import="com.actionForm.BookForm"%>
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
	Collection coll = (Collection) request.getAttribute("ifbook");
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
					<li>图书档案查询</li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<form action="" method="post" name="form1">
					<table width="98%" height="38" border="0" cellpadding="0"
						cellspacing="0" bgcolor="#E3F4F7" class="tableBorder_gray">
						<tr>
							<td align="center" bgcolor="#00a9da">&nbsp;<img
								src="images/search3.gif" width="45" height="28"></td>
							<td bgcolor="#00a9da">请选择查询依据： <select name="f"
								class="wenbenkuang" id="f">
									<option value="barcode">条形码</option>
									<option value="typename">类别</option>
									<option value="bookname" selected>书名</option>
									<option value="author">作者</option>
									<option value="publishing">出版社</option>
									<option value="bookcasename">书架</option>
							</select> <input name="key" type="text" id="key" size="50"> <input
								name="Submit" id="redbuttons" type="submit" class="btn_grey" value="查询"></td>
						</tr>
					</table>
					<%
						if (coll == null || coll.isEmpty()) {
					%>
					<table width="100%" height="30" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="36" align="center">暂无图书信息！</td>
						</tr>
					</table>
					<%
						} else {
							//通过迭代方式显示数据
							Iterator it = coll.iterator();
							int ID = 0;
							String bookname = "";
							String barcode = "";
							String typename = "";
							String publishing = "";
							String bookcase = "";
							int storage = 0;
					%>
					<table width="98%" border="1" cellpadding="0" cellspacing="0"
						bordercolor="#FFFFFF" bordercolordark="#F6B83B"
						bordercolorlight="#FFFFFF">
						<tr align="center" bgcolor="#e3F4F7">
							<td width="17%" bgcolor="#00a9da">条形码</td>
							<td width="31%" bgcolor="#00a9da">图书名称</td>
							<td width="18%" bgcolor="#00a9da">图书类型</td>
							<td width="19%" bgcolor="#00a9da">出版社</td>
							<td width="15%" bgcolor="#00a9da">书架</td>
						</tr>
						<%
							while (it.hasNext()) {
									BookForm bookForm = (BookForm) it.next();
									ID = bookForm.getId().intValue();
									bookname = bookForm.getBookName();
									barcode = bookForm.getBarcode();
									if (barcode == null)
										barcode = "";
									typename = bookForm.getTypeName();
									publishing = bookForm.getPublishing();
									bookcase = bookForm.getBookcaseName();
						%>
						<tr>
							<td style="padding:5px;">&nbsp;<%=barcode%></td>
							<td style="padding:5px;"><a
								href="book?action=bookDetail&ID=<%=ID%>"><%=bookname%></a></td>
							<td style="padding:5px;">&nbsp;<%=typename%></td>
							<td style="padding:5px;">&nbsp;<%=publishing%></td>
							<td style="padding:5px;">&nbsp;<%=bookcase%></td>
						</tr>
						<%
							}
							}
						%>
					</table>
				</form>
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
