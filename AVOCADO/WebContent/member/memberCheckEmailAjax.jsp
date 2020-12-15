  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>    
<%
	MemberDao dao = new MemberDao();
	String id = request.getParameter("t_email");
	int checkEmail = dao.idCheckCount(id);
	if(checkEmail == 0){ 
		out.print("사용가능한 이메일 입니다.");
	} else { 
		out.print("중복된 이메일입니다.");
 	} 
%>