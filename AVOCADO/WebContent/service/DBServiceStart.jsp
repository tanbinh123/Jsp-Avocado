<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.RentDao, dto.RentDto, common.*"%>
<%@ include file="/common/sessionInfo.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	RentDao dao = new RentDao();

	String no = dao.getRentNo();
	String member_no = dao.getMemberNo(request.getParameter("t_sessionEmail"));
	String kickboard_no = request.getParameter("t_kickboardNo");
	String startdate = commonUtil.getTodayHHmmss();
	String enddate = "";
	int useddate = 0;
	int stats = 0; //렌트중 0 렌트완료 1 
	int cost = 0;
	RentDto dto = new RentDto(no, member_no, kickboard_no, startdate, enddate, useddate, stats,cost);
	int result = dao.serviceStart(dto);
	String msg="";
	if (result == 1) {
	  dao.addkickboardTotalusedtimeCount(kickboard_no);
	  dao.changekickboardRentStats(kickboard_no, 1);
	  msg = sessionName + "님 안전한 주행 하세요 ;) ";
	} else {
	  msg=" 실패하였습니다 ";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대여</title>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="/start.jsp";
</script>
</head>
<body>

</body>
</html>