<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*, common.*"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/common/sessionInfo.jsp" %>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
Table, td, th{
border : 1px solid gray;
}
</style>
</head>
<body>
<% if (sessionLevel.equals("top")) {%>
	<h1>관리자 페이지</h1>
	<h2>새로운 킥보드 등록</h2>
	<form name="addKickboard">
		킥보드 이름 : <input type="text" name="t_name" value = "아보카도킥보드"/><br>
		킥보드 종류 : <select name="t_type">
			<option value="NQ-01Plus">NQ-01Plus</option>
			<option value="LGO-C550">LGO-C550</option>
			<option value="NinebotMax">NinebotMax</option>
		</select><br>
		킥보드 위도 : <input type="text" name="t_latitude" /><br>
		킥보드 경도 : <input type="text" name="t_longitude" /><br>
		<button onclick="goAddKickboard()">등록</button>
	</form>

	
	<h2>현재 서비스 이용 정보 </h2>
	<% AdminDao dao = new AdminDao();
	ArrayList<RentDto> usingServiceUserArray = dao.getUsingServiceUser();
	
	if (usingServiceUserArray.size() == 0) {
	  out.print("서비스를 이용중인 유저가 없습니다.");
	}else {%>
			<table>
			<tr>
			<th>렌트 번호</th><th>멤버 번호</th><th>킥보드 번호</th><th>서비스 이용 시작 시간</th>
			</tr>
			<tr>
		<% for (int i = 0; i < usingServiceUserArray.size(); i++) { %>
			<td><%=usingServiceUserArray.get(i).getRent_no() %></td>
			<td><%=usingServiceUserArray.get(i).getRent_member_no() %></td>
			<td><%=usingServiceUserArray.get(i).getRent_kickboard_no() %></td>
			<td><%=usingServiceUserArray.get(i).getRent_startdate() %></td>
	<% }%>
	</table>
		<%} %>
		
	<h2>멤버 검색</h2>
	<form name="searchUser">
	멤버 번호 : <input type="text" name="t_member_no"/><br>
	<button onclick="searchUser()">검색</button>
	</form>
	<%
	ArrayList<MemberDto> UserArray = dao.getUser(request.getParameter("t_member_no"));
		if (UserArray.size() == 0) {
		  out.print("");
		}else {%>
				<table>
				<tr>
				<th>번호</th><th>성명</th><th>이메일</th><th>전화번호</th><th>마지막 이용 날짜</th><th>서비스이용횟수</th><th>충전금</th><th>면허여부</th><th>총 이용시간(초)</th><th>등급</th><th>가입일</th>
				</tr>
				<tr>
			<% for (int i = 0; i < UserArray.size(); i++) { %>
				<td><%=UserArray.get(i).getMember_no() %></td>
				<td><%=UserArray.get(i).getMember_name() %></td>
				<td><%=UserArray.get(i).getMember_email() %></td>
				<td><%=UserArray.get(i).getMember_phoneNumber() %></td>
				<td><%=UserArray.get(i).getMember_lastRentDate() %></td>
				<td><%=UserArray.get(i).getMember_useCount() %></td>
				<td><%=UserArray.get(i).getMember_money() %></td>
				<td><%=UserArray.get(i).getMember_accept() %></td>
				<td><%=UserArray.get(i).getMember_useTimes() %></td>
				<td><%=UserArray.get(i).getMember_rank() %></td>
				<td><%=UserArray.get(i).getMember_regDate() %></td>
		<% }%>
		</table>
			<%}%>
		
		
		
		
	<script>
		function searchUser() {
			searchUser.action = "/member/AdminPage.jsp";
			searchUser.method = "post";
			searchUser.submit();
		}
		function goAddKickboard() {
			addKickboard.action = "/member/DBAddKickboard.jsp";
			addKickboard.method = "post";
			addKickboard.submit();
		}
	</script>		
	<% } else {%>
	<h1>관리자로 로그인 해 주세요.</h1>
	<button onclick="location.href='/member/login.jsp'">로그인화면으로..</button>
	<% }%>
</body>
</html>