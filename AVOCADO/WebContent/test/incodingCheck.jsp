<%@page import="common.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>암호화 메소드 테스트</h1>
	<hr>
	<%
		String sourceString = "12341234";
		String encodeString = commonUtil.encoding(sourceString);
	%>
	<p>암호화 전 문자열 : <%=sourceString %></p>
	<p>암호화 후 문자열 : <%=encodeString %></p>
</body>
</html>