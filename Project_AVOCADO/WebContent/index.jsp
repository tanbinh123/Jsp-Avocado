<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*,dto.*,dao.*,java.util.*" %>
<%
	ArrayList<ExchangeRate_dto> exchangeRateArray = (ArrayList<ExchangeRate_dto>)request.getAttribute("t_exchangeRateArray");
	ArrayList<NoticeDto> noticeArray = (ArrayList<NoticeDto>)request.getAttribute("t_noticeArray");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
/*
for(int i = 0 ; i < exchangeRateArray.size(); i++){
	
	out.println("---------- "+(i+1)+"번째 검색 결과 ----------<br>");
	out.println("국가/통화명 : \t\t"+exchangeRateArray.get(i).getCUR_NM()+"<br>");
	out.println("통화코드 : \t\t"+exchangeRateArray.get(i).getCUR_UNIT()+"<br>");
	out.println("전신환(송금) 받으실때 : \t"+exchangeRateArray.get(i).getTTB()+"<br>");
	out.println("전신환(송금) 보내실때 : \t"+exchangeRateArray.get(i).getTTS()+"<br>");
	out.println("매매 기준율 : \t\t"+exchangeRateArray.get(i).getDEAL_BAS_R()+"<br>");
	out.println("장부가격 : \t\t"+exchangeRateArray.get(i).getBKPR()+"<br>");
	out.println("년환가료율 : \t\t"+exchangeRateArray.get(i).getYY_EFEE_R()+"<br>");
	out.println("10일환가료율 : \t\t"+exchangeRateArray.get(i).getTEN_DD_EFEE_R()+"<br>");
	out.println("서울외국환중계 매매기준율 : \t"+exchangeRateArray.get(i).getKFTC_DEAL_BAS_R()+"<br>");
	out.println("서울외국환중계 장부가격 : \t"+exchangeRateArray.get(i).getKFTC_BKPR()+"<br>");


}*/

for(int i = 0; i < noticeArray.size(); i++){
	out.println("---------- "+(i+1)+"번째 쿼리 ----------<br>");
	out.print("번호 : " + noticeArray.get(i).getNo()+"<br>");
	out.print("제목 : " + noticeArray.get(i).getTitle()+"<br>");
	out.print("내용 : " + noticeArray.get(i).getContent()+"<br>");
	out.print("첨부 : " + noticeArray.get(i).getAttach()+"<br>");
	out.print("작성자 : " + noticeArray.get(i).getReg_name()+"<br>");
	out.print("작성일 :" + noticeArray.get(i).getReg_date()+"<br>");
	out.print("조회수 : " + noticeArray.get(i).getHit()+"<br>");
}
	
%>

</body>
</html>