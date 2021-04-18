<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="com.dao.ReaderDAO"%>
<%@ page import="com.dao.ReaderTypeDAO"%>
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
			.getAttribute("readerDetail");
%><script language="jscript">
	
	
function check(form){
	if(form.name.value==""){
		alert("请输入读者姓名!");form.name.focus();return false;
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
	#table1{
	margin: auto;
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
					<li>读者详细信息</li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<table  width="100%" height="493" border="0" cellpadding="0"
					cellspacing="0">
					<tr>
						<td align="center" valign="top">
							<%
								int ID = 0;
								String name = readerForm.getName();
								String sex = readerForm.getSex();
								String barcode = readerForm.getBarcode();
								String vocation = readerForm.getVocation();
								String birthday = readerForm.getBirthday();
								String paperType = readerForm.getPaperType();
								String paperNO = readerForm.getPaperNO();
								String tel = readerForm.getTel();
								String email = readerForm.getEmail();
								String createDate = readerForm.getCreateDate();
								String remark = readerForm.getRemark();
								String operator = readerForm.getOperator();
								int typeid = readerForm.getTypeid();
								String typename = readerForm.getTypename();
							%>
							<table id="table1" width="600" height="432" border="0" cellpadding="0"
								cellspacing="0" bgcolor="#FFFFFF">
								<tr>
									<td width="173" height="30" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
									<td width="427" height="39"><input name="name" type="text"
										value="<%=name%>"></td>
								</tr>
								<tr>
									<td width="173" height="30" align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
									<td height="35"><input name="name" type="text"
										value="<%=sex%>"></td>
								</tr>
								<tr>
									<td height="30" align="center">条&nbsp;形&nbsp;码：</td>
									<td><input name="barcode" type="text" id="barcode"
										value="<%=barcode%>"></td>
								</tr>
								<tr>
									<td height="30" align="center">读者类型：</td>
									<td><input name="vocation" type="text" id="vocation"
										value="<%=typename%>"></td>
								</tr>
								<tr>
									<td height="30" align="center">职&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
									<td><input name="vocation" type="text" id="vocation"
										value="<%=vocation%>"></td>
								</tr>
								<tr>
									<td height="30" align="center">出生日期：</td>
									<td><input name="birthday" type="text" id="birthday"
										value="<%=birthday%>"></td>
								</tr>
								<tr>
									<td height="30" align="center">有效证件：</td>
									<td><input name="paperType" type="text"
										value="<%=paperType%>"></td>
								</tr>
								<tr>
									<td height="30" align="center">证件号码：</td>
									<td><input name="paperNO" type="text" id="paperNO"
										value="<%=paperNO%>"></td>
								</tr>
								<tr>
									<td height="30" align="center">登记日期：</td>
									<td><input name="paperNO2" type="text" id="paperNO2"
										value="<%=createDate%>"></td>
								</tr>
								<tr>
									<td height="30" align="center">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
									<td><input name="tel" type="text" id="tel"
										value="<%=tel%>"></td>
								</tr>
								<tr>
									<td height="30" align="center">Email：</td>
									<td><input name="email" type="text" id="email"
										value="<%=email%>" size="50"></td>
								</tr>
								<tr>
									<td height="30" align="center">操&nbsp;作&nbsp;员：</td>
									<td><input name="operator" type="text" id="operator"
										value="<%=operator%>"></td>
								</tr>
								<tr>
									<td align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
									<td><textarea name="remark" cols="50" rows="5"
											class="wenbenkuang" id="remark"><%=remark%></textarea></td>
								</tr>
								<tr>
									<td align="center">&nbsp;</td>
									<td>&nbsp; <input name="Submit2" type="button"
										class="btn_grey" value="返回" onClick="history.back()"></td>
								</tr>
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
