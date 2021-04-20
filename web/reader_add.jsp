<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.dao.ReaderDAO"%>
<%@ page import="com.dao.ReaderTypeDAO"%>
<%@ page import="com.actionForm.ReaderForm"%>
<%@ page import="com.actionForm.ReaderTypeForm"%>
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
	ReaderTypeDAO readerTypeDAO = new ReaderTypeDAO();
	Collection coll = (Collection) readerTypeDAO.query(str);
	if (coll == null || coll.isEmpty()) {
		out.println("<script>alert('请先录入读者类型信息!');history.back(-1);</script>");
	} else {
		Iterator it = coll.iterator();
		int ID = 0;
		String name = "";
%>
<script language="jscript">
	
	
function check(form){
	if(form.name.value==""){
		alert("请输入读者姓名!");form.name.focus();return false;
	}
	if(form.barcode.value==""){
		alert("请输入条形码!");form.barcode.focus();return false;
	}
	if(form.paperNO.value==""){
		alert("请输入证件号码!");form.paperNO.focus();return false;
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
					<li><a href="index.jsp">读者管理</a></li>
					<li>></li>
					<li>读者档案管理</li>
					<li>></li>
					<li>添加读者信息</li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<form name="form1" method="post" action="reader?action=readerAdd">
					<table id="table1" border="0" cellpadding="0" cellspacing="0"
						bgcolor="#FFFFFF">
						<tr>
							<td width="173" align="center">姓名：</td>
							<td width="427" height="39"><input name="name" type="text">
								*</td>
						</tr>
						<tr>
							<td width="173" align="center">性别：</td>
							<td height="35"><input name="sex" type="radio"
								class="noborder" id="radiobutton" value="男" checked> <label
								for="radiobutton">男 </label> <label> <input name="sex"
									type="radio" class="noborder" value="女"> 女
							</label></td>
						</tr>
						<tr>
							<td align="center">条形码：</td>
							<td><input name="barcode" type="text" id="barcode">
								*</td>
						</tr>
						<tr>
							<td align="center">读者类型：</td>
							<td><select name="typeid" class="wenbenkuang" id="typeid">
									<%
										while (it.hasNext()) {
												ReaderTypeForm readerTypeForm = (ReaderTypeForm) it.next();
												ID = readerTypeForm.getId().intValue();
												name = readerTypeForm.getName();
									%>
									<option value="<%=ID%>"><%=name%></option>
									<%
										}
										}
									%>
							</select></td>
						</tr>
						<tr>
							<td align="center">职业：</td>
							<td><input name="vocation" type="text" id="vocation"></td>
						</tr>
						<tr>
							<td align="center">出生日期：</td>
							<td><input name="birthday" type="text" id="birthday"></td>
						</tr>
						<tr>
							<td align="center">有效证件：</td>
							<td><select name="paperType" class="wenbenkuang"
								id="paperType">
									<option value="身份证" selected>身份证</option>
									<option value="学生证">学生证</option>
									<option value="军官证">军官证</option>
									<option value="工作证">工作证</option>
							</select></td>
						</tr>
						<tr>
							<td align="center">证件号码：</td>
							<td><input name="paperNO" type="text" id="paperNO">
								*</td>
						</tr>
						<tr>
							<td align="center">电话：</td>
							<td><input name="tel" type="text" id="tel"></td>
						</tr>
						<tr>
							<td align="center">Email：</td>
							<td><input name="email" type="text" id="email" size="50">
								<%-- <input name="operator" type="hidden" id="operator"
								value="<%=manager%>"> --%></td>
						</tr>
						<tr>
							<td align="center">备注：</td>
							<td><textarea name="remark" cols="50" rows="5"
									class="wenbenkuang" id="remark"></textarea></td>
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
