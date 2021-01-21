<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*, common.*"%>
<%@ include file="/common/sessionInfo.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	KickboardDao dao = new KickboardDao();
	Random random = new Random();


  String kickboard_no = dao.getKickboardNo();
  String kickboard_name = request.getParameter("t_name");
  String kickboard_type = request.getParameter("t_type");
  String latitude = request.getParameter("t_latitude");
  String longitude = request.getParameter("t_longitude");
  String kickboard_location = "new naver.maps.LatLng("+latitude+", "+longitude+")";
  String kickboard_regdate = commonUtil.getTodayHHmmss();
  int kickboard_totalusedtimes = 0;
  String kickboard_img = "";
  int kickboard_rentstats = 0;
  int kickboard_battery = random.nextInt(101);
  KickboardDto dto = new KickboardDto(kickboard_no, kickboard_name, kickboard_type, kickboard_location, kickboard_regdate, kickboard_img, kickboard_rentstats, kickboard_totalusedtimes, kickboard_battery);
  int result = dao.saveKickboard(dto);

	String msg="";
	if (result == 1) {
	  msg = "등록 되었습니다." ;
	} else {
	  msg=" 실패 하였습니다 ";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반납</title>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="/member/admin/registerKickboard.jsp";
</script>
</head>
<body>

</body>
</html>