<%@page import="com.actionForm.ManagerForm"%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	ManagerForm managerForm = (ManagerForm) request
			.getAttribute("managerQueryif");
	int ID = managerForm.getId().intValue();
	String name = managerForm.getName();
	int sysset = managerForm.getSysset();
	int readerset = managerForm.getReaderset();
	int bookset = managerForm.getBookset();
	int borrowback = managerForm.getBorrowback();
	int sysquery = managerForm.getSysquery();
%>
<html>
<head>
<base href="<%=basePath%>">

<title>权限设置</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/button.css" />
</head>

<body>
	<form name="form1" method="post" action="manager?action=managerModify">
		<table border="0px" style="width:350px;height:120px;">
			<tr>
				<td style="width:30%" aling="center"><font size="3" color="blue">管理员名称：</font></td>
				<td> <input name="id" type="hidden" value="<%=ID%>"><input name="name" type="text" readonly="yes" value="<%=name%>"></td>
			</tr>
			<tr>
				<td width="200px" aling="center"><font size="3" color="blue">拥有的权限：</font></td>
				<td>
					<table width="100%" height="67px">
						<tr>
							<td width="47%"><input name="sysset" type="checkbox"
								class="noborder" id="sysset" value="1"
								<%if (sysset == 1) {
				out.println("checked");
			}%>>
								系统设置</td>
							<td width="53%"><input name="readerset" type="checkbox"
								class="noborder" id="readerset" value="1"
								<%if (readerset == 1) {
				out.println("checked");
			}%>>
								读者管理</td>
						</tr>
						<tr>
							<td><input name="bookset" type="checkbox" class="noborder"
								id="bookset" value="1"
								<%if (bookset == 1) {
				out.println("checked");
			}%>>
								图书管理</td>
							<td><input name="borrowback" type="checkbox"
								class="noborder" id="borrowback" value="1"
								<%if (borrowback == 1) {
				out.println("checked");
			}%>>
								图书借还</td>
						</tr>
						<tr>
							<td height="23"><input name="sysquery" type="checkbox"
								class="noborder" id="sysquery" value="1"
								<%if (sysquery == 1) {
				out.println("checked");
			}%>>
								系统查询</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input name="Button"
					type="submit" id="blueButton" value="保存">&nbsp;
					<input name="Submit2" type="button" id="redButton" value="关闭"
					onClick="window.close();"></td>
			</tr>
		</table>
	</form>
</body>
</html>
