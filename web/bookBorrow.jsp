<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.dao.BorrowDAO"%>
<%@ page import="com.actionForm.BorrowForm"%>
<%@ page import="com.actionForm.ReaderForm"%>
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
	ReaderForm readerForm = (ReaderForm) request
			.getAttribute("readerinfo");
	Collection coll = (Collection) request.getAttribute("borrowinfo");
	int borrowNumber = 0;
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
<style type="text/css">
#table1 {
	margin: auto;
	margin-top: 20px;
}
</style>
<script language="javascript">
	function checkreader(form) {
		if (form.barcode.value == "") {
			alert("请输入读者条形码!");
			form.barcode.focus();
			return;
		}
		form.submit();
	}
	function checkbook(form) {
		if (form.barcode.value == "") {
			alert("请输入读者条形码!");
			form.barcode.focus();
			return;
		}
		if (form.inputkey.value == "") {
			alert("请输入查询关键字!");
			form.inputkey.focus();
			return;
		}

		if (form.number.value - form.borrowNumber.value <= 0) {
			alert("您不能再借阅其他图书了!");
			return;
		}
		form.submit();
	}
</script>
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
					<li><a href="index.jsp">图书借还</a></li>
					<li>></li>
					<li>图书借阅</li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<table id="table1" width="990" border="0" cellspacing="0"
					cellpadding="0">
					<form name="form1" method="post" action="borrow?action=bookborrow">
						<tr>
							<td height="47" background="images/borrowBackRenew1.gif">&nbsp;</td>
						</tr>
						<tr>
							<td height="72" align="center" valign="top"
								background="images/main_booksort_1.gif" bgcolor="#F8BF73"><table
									width="96%" border="0" cellpadding="1" cellspacing="0"
									bordercolor="#FFFFFF" bgcolor="#F8BF73">
									<tr>
										<td valign="top" bgcolor="#00a9da">
											<%
												int ID = 0;
												String name = "";
												String sex = "";
												String barcode = "";
												String birthday = "";
												String paperType = "";
												String paperNO = "";
												int number = 0;
												String typename = "";
												if (readerForm != null) {
													ID = readerForm.getId().intValue();
													name = readerForm.getName();
													sex = readerForm.getSex();
													barcode = readerForm.getBarcode();
													birthday = readerForm.getBirthday();
													paperType = readerForm.getPaperType();
													paperNO = readerForm.getPaperNO();
													number = readerForm.getNumber();
													typename = readerForm.getTypename();
												}
											%>
											<table width="100%" border="0" cellpadding="0"
												cellspacing="0" bgcolor="#FFFFFF">


												<tr>
													<td><table width="90%" height="21" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td width="24%" height="18"
																	style="padding-left:7px;padding-top:7px;"><img
																	src="images/reader_checkbg.jpg" width="142" height="18"></td>
																<td width="76%" style="padding-top:7px;">读者条形码： <input
																	name="barcode" type="text" id="barcode"
																	value="<%=barcode%>" size="24"> &nbsp; <input
																	name="Button" id="blueButton" type="button" class="btn_grey" value="确定"
																	onClick="checkreader(form1)"></td>
															</tr>
														</table></td>
												</tr>
												<tr>
													<td height="13" align="left" style="padding-left:7px;"><hr
															width="90%" size="1"></td>
												</tr>
												<tr>
													<td align="center"><table width="96%" border="0"
															cellpadding="0" cellspacing="0">
															<tr>
																<td height="27">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：
																	<input name="readername" type="text" id="readername"
																	value="<%=name%>">
																</td>
																<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别： <input
																	name="sex" type="text" id="sex" value="<%=sex%>"></td>
																<td>读者类型： <input name="readerType" type="text"
																	id="readerType" value="<%=typename%>"></td>
															</tr>
															<tr>
																<td height="27">证件类型： <input name="paperType"
																	type="text" id="paperType" value="<%=paperType%>"></td>
																<td>证件号码： <input name="paperNo" type="text"
																	id="paperNo" value="<%=paperNO%>"></td>
																<td>可借数量： <input name="number" type="text"
																	id="number" value="<%=number%>"> (册) &nbsp;
																</td>
															</tr>
														</table></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td height="32" background="images/borrow_if (2).gif">&nbsp;添加的依据：
											<input name="f" type="radio" class="noborder" value="barcode"
											checked> 图书条形码 &nbsp;&nbsp; <input name="f"
											type="radio" class="noborder" value="bookname">
											图书名称&nbsp;&nbsp; <input name="inputkey" type="text"
											id="inputkey" size="50"> <input name="Submit2"
											type="button" id="blueButton" class="btn_grey" value="确定"
											onClick="checkbook(form1)"> <%-- <input name="operator"
											type="hidden" id="operator" value="<%=manager%>"> --%> <input
											name="Button" id="orangeButton" type="button" class="btn_grey" value="完成借阅"
											onClick="window.location.href='bookBorrow.jsp'">
										</td>
									</tr>
									<tr>
										<td valign="top" bgcolor="#00a9da" style="padding:5px"><table
												width="99%" border="1" cellpadding="0" cellspacing="0"
												bordercolor="#FFFFFF" bordercolorlight="#FFFFFF"
												bordercolordark="#F6B83B" bgcolor="#FFFFFF">
												<tr align="center" bgcolor="#00a9da">
													<td width="29%" height="25">图书名称</td>
													<td width="12%">借阅时间</td>
													<td width="14%">应还时间</td>
													<td width="17%">出版社</td>
													<td width="14%">书架</td>
													<td colspan="2">定价(元)</td>
												</tr>
												<%
													String bookname = "";
													String borrowTime = "";
													String backTime = "";
													Float price = new Float(0);
													String pubname = "";
													String bookcase = "";
													if (coll != null && !coll.isEmpty()) {
														borrowNumber = coll.size();
														Iterator it = coll.iterator();
														while (it.hasNext()) {
															BorrowForm borrowForm = (BorrowForm) it.next();
															bookname = borrowForm.getBookName();
															borrowTime = borrowForm.getBorrowTime();
															backTime = borrowForm.getBackTime();
															price = borrowForm.getPrice();
															pubname = borrowForm.getPubName();
															bookcase = borrowForm.getBookcaseName();
												%>
												<tr>
													<td height="25" style="padding:5px;">&nbsp;<%=bookname%></td>
													<td style="padding:5px;">&nbsp;<%=borrowTime%></td>
													<td style="padding:5px;">&nbsp;<%=backTime%></td>
													<td align="center">&nbsp;<%=pubname%></td>
													<td align="center">&nbsp;<%=bookcase%></td>
													<td width="14%" align="center">&nbsp;<%=price%></td>
												</tr>
												<%
													}
													}
												%>
												<input name="borrowNumber" type="hidden" id="borrowNumber"
													value="<%=borrowNumber%>">
											</table></td>
									</tr>

								</table></td>

						</tr>
						<tr>
							<td height="19" background="images/main_booksort_2.gif">&nbsp;</td>
						</tr>
					</form>
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
