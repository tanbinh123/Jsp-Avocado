<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*,dto.*,dao.*,java.util.*" %>
<%
	ArrayList<ExchangeRate_dto> arr = (ArrayList<ExchangeRate_dto>)request.getAttribute("t_arr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
for(int i = 0 ; i < arr.size(); i++){
	
	out.println("---------- "+(i+1)+"번째 검색 결과 ----------<br>");
	out.println("국가/통화명 : \t\t"+arr.get(i).getCUR_NM()+"<br>");
	out.println("통화코드 : \t\t"+arr.get(i).getCUR_UNIT()+"<br>");
	out.println("전신환(송금) 받으실때 : \t"+arr.get(i).getTTB()+"<br>");
	out.println("전신환(송금) 보내실때 : \t"+arr.get(i).getTTS()+"<br>");
	out.println("매매 기준율 : \t\t"+arr.get(i).getDEAL_BAS_R()+"<br>");
	out.println("장부가격 : \t\t"+arr.get(i).getBKPR()+"<br>");
	out.println("년환가료율 : \t\t"+arr.get(i).getYY_EFEE_R()+"<br>");
	out.println("10일환가료율 : \t\t"+arr.get(i).getTEN_DD_EFEE_R()+"<br>");
	out.println("서울외국환중계 매매기준율 : \t"+arr.get(i).getKFTC_DEAL_BAS_R()+"<br>");
	out.println("서울외국환중계 장부가격 : \t"+arr.get(i).getKFTC_BKPR()+"<br>");


}
%>

</body>
</html>