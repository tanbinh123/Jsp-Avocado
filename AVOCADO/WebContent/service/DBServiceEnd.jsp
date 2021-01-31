<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*, common.*"%>
<%@ include file="/common/sessionInfo.jsp"%>
<%
  request.setCharacterEncoding("utf-8");
RentDao dao = new RentDao();

String kickboard_no = request.getParameter("t_kickboardNo");
String rent_no = dao.getRentNo(kickboard_no);

String enddate = commonUtil.getTodayHHmmss();
int stats = 1; //렌트중 0 렌트완료 1 
RentDto dto = new RentDto(rent_no, enddate, stats);

int result = dao.serviceEnd(dto);
String msg = "";
String member_no = dao.getMemberNo(sessionEmail);

if (result == 1) {

	dao.changekickboardRentStats(kickboard_no, 0);
	int usedTime = Integer.parseInt(dao.getServiceUsedDate(dto)); //이용시간 초
	int cost = 1000 + ((usedTime / 60) * 100);
	dao.serviceEndUsedDate(usedTime, cost, rent_no);
	dao.updateMemberServiceEnd(dto, member_no, usedTime);
	//dao.updateMemberLastRentDate(dto,member_no);
	//dao.addMemberUseCount(member_no);
	//dao.addMemberUseTimes(member_no, usedTime);
	msg = "반납되었습니다.";
} else {
	msg = " 실패하였습니다 ";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반납</title>

</head>
<body>
	<form name="result">
		<input type="hidden" name="t_rent_no" value="<%=rent_no%>">
	</form>
	<script type="text/javascript">
<%-- 	alert("<%=msg%>");
	window.open('/service/ServiceResult.jsp','서비스 이용 내역','width=250,height=160,location=no,status=no,scrollbars=no'); --%>
	result.action = "/start.jsp";
	result.method = "post";
	result.submit();
	//location.href="/start.jsp";
	
</script>
</body>
</html>