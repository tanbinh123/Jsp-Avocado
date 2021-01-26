<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.QnaDao" %>
<%
  QnaDao dao = new QnaDao();

	
	String post_no 	= request.getParameter("t_no");
	String email	= request.getParameter("t_sessionEmail");
	String no 		= dao.getLikeStackNo();

	int result = dao.saveLikeStack(post_no, email, no);
	String msg="";
	if (result == 1) {
		msg =" 공감하셨습니다. ";
	} else {
		msg=" 실패. ";
	}
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="/board/qna/qnaView.jsp?t_no=<%=post_no%>";
</script>
</head>
<body>

</body>
</html>