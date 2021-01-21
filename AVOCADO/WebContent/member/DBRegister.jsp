<%@page import="oracle.sql.CharacterSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDao,dto.MemberDto,common.*" %>
<%
	request.setCharacterEncoding("utf-8"); 
	MemberDao dao = new MemberDao();
	
	String member_no = dao.getMemberNo();
	String member_name = request.getParameter("t_name");
	String member_email = request.getParameter("t_email");
	String member_password_raw = request.getParameter("t_password");
	String member_password = commonUtil.encoding(member_password_raw);
	String member_phoneNumber = request.getParameter("t_phoneNumber");
	String member_regDate = commonUtil.getToday();
	String member_lastRentDate = "";
	int member_money = 0;
	int member_useTimes = 0;
	String member_rank = "브론즈";
	int member_useCount = 0;
	int member_accept = 0; //면허여부
	
	MemberDto dto = new MemberDto(member_no, member_name, member_email,
	      member_phoneNumber, member_password, member_lastRentDate,
	      member_money, member_useTimes, member_rank, member_regDate, member_useCount,
	      member_accept);
	
	int result = dao.joinMember(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script type="text/javascript">
<% if(result == 1){%>
alert('회원가입 완료되었습니다.');
<%}%>
location.href="/member/login.jsp";
</script>
</head>
<body>

</body>
</html>