<%@page import="oracle.sql.CharacterSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDao,dto.MemberDto,common.*" %>
<%
	request.setCharacterEncoding("utf-8"); 

	MemberDao dao = new MemberDao();
	
	String member_email = request.getParameter("t_email");
	String member_password = commonUtil.encoding(request.getParameter("t_password"));
	
	String name = dao.getLoginName(member_email, member_password);
	String msg ="";
	if(name.equals("")){
		msg =" 이메일이나 비밀번호가 맞지 않습니다. ";
	} else {
		msg = name +"님 환영합니다. ";
		session.setAttribute("sessionName",name);
		session.setAttribute("sessionEmail",member_email);
		if(member_email.equals("admin@avocado.com") || member_email.equals("test12345@avocado.com")) {
			session.setAttribute("sessionLevel","top");
		}
		session.setMaxInactiveInterval(60*60*1);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script type="text/javascript">
	alert("<%=msg%>");
<%	if(name.equals("")){ %>	
		location.href="/member/login.jsp";
<%  } else { %>
		location.href="/index.jsp";
<%  }  %>	
</script>
</head>
<body>

</body>
</html>