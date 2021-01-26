<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*, common.*"%>    

<!DOCTYPE html>
<html lang="kr">
 <%@ include file="/common/header.jsp" %>
 <%

AdminDao dao = new AdminDao();
String memberNo = dao.getMemberNo(sessionEmail);
ArrayList<MemberDto> memberDto = dao.getUser(memberNo);
DecimalFormat df = new DecimalFormat("###,###,###");
%>
    <!-- header end-->
    <main>
     <script>
    function goProfileEdit(){
        location.href="edit.html"
    }    
    </script>
      <section class="myPage-main-section" style="background-color: #f1f8e9">
        <div class="myPage-main-content">
            <div class="myPage-main-content-myInfo">
                <div class="myPage-main-content-myInfo-profileLeft">
                    <img src="/img/profileimg.jpg">
                    <div class="myPage-main-content-myInfo-profileText">
                        <p class="myPage-main-content-myInfo-profileText-name"><%=sessionName%> 님<p>
                        <p class="myPage-main-content-myInfo-profileText-email"><%=sessionEmail %></p>
                        <p>충전금 : <%=df.format(memberDto.get(0).getMember_money()) %>원</p>
                    </div>
                </div>
                <div class="myPage-main-content-myInfo-profileRight">
                    <button class="myPage-main-content-myInfo-profileRight-profileEditButton" onclick="goProfileEdit()">프로필 정보 수정</button>
                </div>
            </div>
            <div class="myPage-main-content-container">
                <div class="myPage-main-content-container-box">
                    <p class="myPage-main-content-container-box-title">최근 일주일 서비스 이용 통계</p>
                    <!-- <div class="ss">차트</div> -->
                    <canvas id="myChart" width="400" height="200"></canvas>
                    <!-- <p>총 13회, 2시간 23분 이용하셨습니다.</p> -->
                </div>
                <div class="myPage-main-content-container-box">
                    <p class="myPage-main-content-container-box-title">나의 등급</p>
                    <div class="myPage-main-content-container-box-rank">
                    <% if (memberDto.get(0).getMember_rank().equals("브론즈")) {%>
                    	<img alt="bronze" src="/img/rankimg/Bronze.png">
                    <%} else if (memberDto.get(0).getMember_rank().equals("실버")) {%>
                    	<img alt="bronze" src="/img/rankimg/Silver.png">
                    <%} else if (memberDto.get(0).getMember_rank().equals("골드")) {%>
                    	<img alt="bronze" src="/img/rankimg/Gold.png">
                    <%} else if (memberDto.get(0).getMember_rank().equals("운영자")) {%>
                    	<img alt="bronze" src="/img/rankimg/Master.png">
                    <%} else if (memberDto.get(0).getMember_rank().equals("관리자")) {%>
                    	<img alt="bronze" src="/img/rankimg/Grandmaster.png">
                    <%} %>
                    <p><%=memberDto.get(0).getMember_rank() %></p>
                    <p><% if (memberDto.get(0).getMember_rank().equals("브론즈")) {%>
                    	
                    <%} else if (memberDto.get(0).getMember_rank().equals("실버")) {%>
                    	5% 할인
                    <%} else if (memberDto.get(0).getMember_rank().equals("골드")) {%>
                    	10% 할인
                    <%} else if (memberDto.get(0).getMember_rank().equals("운영자")) {%>
                    	
                    <%} else if (memberDto.get(0).getMember_rank().equals("관리자")) {%>
                    	
                    <%} %></p>
                    </div>
                </div>
                <div class="myPage-main-content-container-box">
                    <p class="myPage-main-content-container-box-title">개발 정보</p>
                    <a class="agreementDocumentLink" href="https://www.notion.so/c93bbe16d6034803ae07dd6205cd96a8" target="_blank"><div class="myPage-main-content-container-box-innerbox">프로젝트 문서 바로가기</div></a>
                    <a class="agreementDocumentLink" href="https://www.notion.so/153432ead0fd4336b0b998d08e6aa426?v=9b3a63f01aa84e0ca0249bfc9ede1527" target="_blank"><div class="myPage-main-content-container-box-innerbox">개발 로드맵 바로가기</div></a>
                    <a class="agreementDocumentLink" href="https://github.com/thyoondev" target="_blank"><div class="myPage-main-content-container-box-innerbox">개발자 github 바로가기</div></a>
                </div>
                <div class="myPage-main-content-container-box">
                	<p class="myPage-main-content-container-box-title">서비스 정보</p>
                	<a class="agreementDocumentLink" href="/member/myPage/agreementDocument/serviceAgreementDocument.jsp"><div class="myPage-main-content-container-box-innerbox">서비스 이용약관</div></a>
                	<a class="agreementDocumentLink" href="/member/myPage/agreementDocument/personalInfoAgreementDocument.jsp"><div class="myPage-main-content-container-box-innerbox">개인정보 처리 방침</div></a>
                	<a class="agreementDocumentLink" href="/member/myPage/agreementDocument/locationAgreementDocument.jsp"><div class="myPage-main-content-container-box-innerbox">위치기반서비스 이용약관</div></a>
                	<a class="agreementDocumentLink" href="/member/myPage/agreementDocument/marketingAgreementDocument.jsp"><div class="myPage-main-content-container-box-innerbox">마케팅 정보 수신 동의</div></a>
                </div>
            </div>
        </div>
      </section>
      <script type="text/javascript">
      var today = <%=dao.getTodayUsedTime(memberNo)%>;
      var yesterday = <%=dao.getYesterdayUsedTime(memberNo)%>;
      var twodaysago = <%=dao.get2daysagoUsedTime(memberNo)%>;
      var threedaysago = <%=dao.get3daysagoUsedTime(memberNo)%>;
      var fourdaysago = <%=dao.get4daysagoUsedTime(memberNo)%>;
      var fivedaysago = <%=dao.get5daysagoUsedTime(memberNo)%>;
      var sixdaysago = <%=dao.get6daysagoUsedTime(memberNo)%>;
      
      
      var data = {
		        labels: ['오늘', '1일전', '2일전', '3일전', '4일전', '5일전', '6일전'],
		        datasets: [{
		            label: '이용 시간',
		            data: [today, yesterday, twodaysago, threedaysago, fourdaysago, fivedaysago, sixdaysago],
		            backgroundColor: [
		                'rgba(127, 191, 63, 0.2)'
		            ],
		            borderColor: [
		                'rgba(127, 191, 63, 1)'
		            ],
		            borderWidth: 1,
		            pointBackgroundColor:[
		            	'rgba(127, 191, 63, 0.5)'
		            ],
		            pointBorderColor: [
		            	'rgba(127, 191, 63, 1)'
		            ],
		            pointBorderWidth: 1,
		        }]
		    };
      
      
      var options = {
    		  scales: {
    			    yAxes: [{
    			      /* scaleLabel: {
    			        display: true,
    			        labelString: '단위(5분)'
    			      }, */
    			      ticks: {
    			    	  beginAtZero: true,
    			    	  stepSize: 300,
    			    	  callback: function(value, index, values) {
    			    		  if(value > 60) {
	    			    		  for (var i = 0; i < value*300; i++) {
	    			    			  if (value == i){
	        			    			  return i/60+"분";
	        			    		  }
									}
    			    		}else{
    			    			return value+"초";
    			    		}
    			    		  
    			    	  }
    			      }
    			    }]
    			  } 
    			}
      
      
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
		    type: 'line',
		    data: data,
		    options: options
		});
</script>
    </main>
    <!-- footer start-->
<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>
