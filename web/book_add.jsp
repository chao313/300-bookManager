<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.dao.BookDAO"%>
<%@ page import="com.dao.BookTypeDAO"%>
<%@ page import="com.actionForm.BookForm"%>
<%@ page import="com.actionForm.BookTypeForm"%>
<%@ page import="com.dao.BookCaseDAO"%>
<%@ page import="com.actionForm.BookCaseForm"%>
<%@ page import="com.dao.PublishingDAO"%>
<%@ page import="com.actionForm.PublishingForm"%>
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
	String str = null;
	BookTypeDAO bookTypeDAO = new BookTypeDAO();
	Collection coll_type = (Collection) bookTypeDAO.query(str);
	if (coll_type == null || coll_type.isEmpty()) {
		out.println("<script>alert('请先录入图书类型信息!');history.back(-1);</script>");
	} else {
		Iterator it_type = coll_type.iterator();
		int typeID = 0;
		String typename = "";
		BookCaseDAO bookcaseDAO = new BookCaseDAO();
		String str1 = null;
		Collection coll_bookcase = (Collection) bookcaseDAO.query(str1);
		if (coll_bookcase == null || coll_bookcase.isEmpty()) {
			out.println("<script>alert('请先录入书架信息!');history.back(-1);</script>");
		} else {
			Iterator it_bookcase = coll_bookcase.iterator();
			int bookcaseID = 0;
			String bookcasename = "";
			PublishingDAO pubDAO = new PublishingDAO();
			String str2 = null;
			Collection coll_pub = (Collection) pubDAO.query(str2);
			if (coll_pub == null || coll_pub.isEmpty()) {
				out.println("<script>alert('请先录入出版社信息!');history.back(-1);</script>");
			} else {
				Iterator it_pub = coll_pub.iterator();
				String isbn = "";
				String pubname = "";
%>
<script language="jscript">
	
	
	
		
function check(form){
	if(form.barcode.value==""){
		alert("请输入条形码!");form.barcode.focus();return false;
	}
	if(form.bookName.value==""){
		alert("请输入图书名称!");form.bookName.focus();return false;
	}
	if(form.price.value==""){
		alert("请输入图书定价!");form.price.focus();return false;
	}
}




</script>
<head>
<base href="<%=basePath%>">

<title>图书馆管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
#table1 {
	width: 600px;
	height: 432px;
	margin: auto;
	margin-top: 20px;
	padding: 0px;
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
					<li><a href="index.jsp">图书管理</a></li>
					<li>></li>
					<li>图书档案管理</li>
					<li>></li>
					<li>添加图书信息</li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<form name="form1" method="post" action="book?action=bookAdd">
					<table id="table1" width="600" height="432" border="0" cellpadding="0"
						cellspacing="0" bgcolor="#FFFFFF">
						<tr>
							<td width="173" align="center">条&nbsp;形&nbsp;码：</td>
							<td width="427" height="39"><input name="barcode"
								type="text" id="barcode"> *</td>
						</tr>
						<tr>
							<td align="center">图书名称：</td>
							<td height="39"><input name="bookName" type="text"
								id="bookName" size="50"> *</td>
						</tr>
						<tr>
							<td align="center">图书类型：</td>
							<td><select name="typeId" class="wenbenkuang" id="typeId">
									<%
										while (it_type.hasNext()) {
														BookTypeForm bookTypeForm = (BookTypeForm) it_type
																.next();
														typeID = bookTypeForm.getId().intValue();
														typename = bookTypeForm.getTypeName();
									%>

									<option value="<%=typeID%>"><%=typename%></option>
									<%
										}
									%>
							</select></td>
						</tr>
						<tr>
							<td align="center">作者：</td>
							<td><input name="author" type="text" id="author" size="40"></td>
						</tr>
						<tr>
							<td align="center">译者：</td>
							<td><input name="translator" type="text" id="translator"
								size="40"></td>
						</tr>
						<tr>
							<td align="center">出版社：</td>
							<td><select name="isbn" class="wenbenkuang">
									<%
										while (it_pub.hasNext()) {
														PublishingForm pubForm = (PublishingForm) it_pub
																.next();
														isbn = pubForm.getIsbn();
														pubname = pubForm.getPubname();
									%>

									<option value="<%=isbn%>"><%=pubname%></option>
									<%
										}
												}
									%>
							</select></td>
						</tr>
						<tr>
							<td align="center">价格：</td>
							<td><input name="price" type="text" id="price"> (元)
								*</td>
						</tr>
						<tr>
							<td align="center">页码：</td>
							<td><input name="page" type="text" id="page"></td>
						</tr>
						<tr>
							<td align="center">书架：</td>
							<td><select name="bookcaseid" class="wenbenkuang"
								id="bookcaseid">
									<%
										while (it_bookcase.hasNext()) {
													BookCaseForm bookCaseForm = (BookCaseForm) it_bookcase
															.next();
													bookcaseID = bookCaseForm.getId().intValue();
													bookcasename = bookCaseForm.getName();
									%>

									<option value="<%=bookcaseID%>"><%=bookcasename%></option>
									<%
										}
											}
										}
									%>
							</select> <%-- <input name="operator" type="hidden" id="operator"
								value="<%=manager%>"> --%></td>
						</tr>
						<tr>
							<td align="center">&nbsp;</td>
							<td><input name="Submit" type="submit" class="btn_grey"
								value="保存" onClick="return check(form1)"> &nbsp; <input
								name="Submit2" type="button" class="btn_grey" value="返回"
								onClick="history.back()"></td>
						</tr>
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
