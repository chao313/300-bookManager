<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>操作成功!</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
		int para = Integer.parseInt(request.getParameter("para"));
		switch (para) {
			case 1 :
	%>
	<script language="javascript">
		alert("图书信息添加成功!");
		window.location.href = "book?action=bookQuery";
	</script>
	<%
		break;
			case 2 :
	%>
	<script language="javascript">
		alert("图书信息修改成功!");
		window.location.href = "book?action=bookQuery";
	</script>
	<%
		break;
			case 3 :
	%>
	<script language="javascript">
		alert("图书信息删除成功!");
		window.location.href = "book?action=bookQuery";
	</script>
	<%
		break;
		}
	%>
</body>
</html>
