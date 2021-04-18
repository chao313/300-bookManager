<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
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
	Iterator it = coll.iterator();
	ReaderForm readerForm = (ReaderForm) request
			.getAttribute("readerQueryif");
%>
<script language="jscript">
	
	
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
#table1 {
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
					<li>修改读者信息</li>
				</ul>
			</div>
			<div id="right-buttom" style="overflow: auto;">
				<%
					int ID = readerForm.getId().intValue();
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
					String typeName = "";
					int typeID = 0;
				%>
				<form name="form1" method="post" action="reader?action=readerModify">
					<table id="table1" width="600" height="432" border="0" cellpadding="0"
						cellspacing="0" bgcolor="#FFFFFF">
						<tr>
							<td width="173" align="center">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
							<td width="427" height="39"><input name="name" type="text"
								value="<%=name%>" readonly="yes"> * <input name="id"
								type="hidden" id="id" value="<%=ID%>"></td>
						</tr>
						<tr>
							<td width="173" align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
							<td height="35"><input name="sex" type="radio"
								class="noborder" id="radiobutton" value="男"
								<%if ("男".equals(sex))
				out.println("checked");%>> <label
								for="radiobutton">男 </label> <label> <input name="sex"
									type="radio" class="noborder" value="女"
									<%if ("女".equals(sex))
				out.println("checked");%>> 女
							</label></td>
						</tr>
						<tr>
							<td align="center">条&nbsp;形&nbsp;码：</td>
							<td><input name="barcode" type="text" id="barcode"
								value="<%=barcode%>" readonly="yes"></td>
						</tr>
						<tr>
							<td align="center">读者类型：</td>
							<td><select name="typeid" class="wenbenkuang" id="typeid">
									<%
										while (it.hasNext()) {
											ReaderTypeForm readerTypeForm = (ReaderTypeForm) it.next();
											typeID = readerTypeForm.getId().intValue();
											typeName = readerTypeForm.getName();
									%>

									<option value="<%=typeID%>"
										<%if (typeid == typeID)
					out.println("selected");%>><%=typeName%></option>
									<%
										}
									%>
							</select></td>
						</tr>
						<tr>
							<td align="center">职&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
							<td><input name="vocation" type="text" id="vocation"
								value="<%=vocation%>"></td>
						</tr>
						<tr>
							<td align="center">出生日期：</td>
							<td><input name="birthday" type="text" id="birthday"
								value="<%=birthday%>"></td>
						</tr>
						<tr>
							<td align="center">有效证件：</td>
							<td><select name="paperType" class="wenbenkuang"
								id="paperType">
									<option value="身份证"
										<%if ("身份证".equals(paperType))
				out.println(" selected");%>>身份证</option>
									<option value="学生证"
										<%if ("学生证".equals(paperType))
				out.println(" selected");%>>学生证</option>
									<option value="军官证"
										<%if ("军官证".equals(paperType))
				out.println(" selected");%>>军官证</option>
									<option value="工作证"
										<%if ("工作证".equals(paperType))
				out.println(" selected");%>>工作证</option>
							</select></td>
						</tr>
						<tr>
							<td align="center">证件号码：</td>
							<td><input name="paperNO" type="text" id="paperNO"
								value="<%=paperNO%>"> *</td>
						</tr>
						<tr>
							<td align="center">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
							<td><input name="tel" type="text" id="tel" value="<%=tel%>"></td>
						</tr>
						<tr>
							<td align="center">Email：</td>
							<td><input name="email" type="text" id="email"
								value="<%=email%>" size="50"> <input name="operator"
								type="hidden" id="operator" value="<%=operator%>"></td>
						</tr>
						<tr>
							<td height="30" align="center">操&nbsp;作&nbsp;员：</td>
							<td><input name="operator" type="text" id="operator"
								value="<%=operator%>" readonly="yes"></td>
						</tr>
						<tr>
							<td align="center">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
							<td><textarea name="remark" cols="50" rows="5"
									class="wenbenkuang" id="remark"><%=remark%></textarea></td>
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
