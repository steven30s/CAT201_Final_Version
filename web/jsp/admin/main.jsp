<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>main</title>
	<style type="text/css">
		*{
		margin:0;
		padding:0;
		}
		body{
			background:#eee;
		}
		h2{
			text-align:center;
			position:absolute;
			left:0;
			right:0;
			top:40%;
		}

	</style>
</head>
<body>
	<h2>欢迎登陆E-commerce backend management system</h2>
</body>
</html>
