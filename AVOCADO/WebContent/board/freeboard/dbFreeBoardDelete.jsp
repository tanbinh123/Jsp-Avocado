<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.FreeboardDao" %>
<%
	FreeboardDao dao = new FreeboardDao();
	String no 		 = request.getParameter("t_no");
	
	int result = dao.deleteFreeboard(no);
	String msg="";
	if(result == 1) msg ="  삭제 되었습니다. ";
	else msg="  삭제 실패~ ";


%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="freeboard_list.jsp";
</script>
</head>
<body>

</body>
</html>