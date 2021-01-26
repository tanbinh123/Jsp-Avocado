<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*, common.*"%>    

<!DOCTYPE html>
<html lang="kr">
 <%@ include file="/common/header.jsp" %>

    <!-- header end-->
    <main>
      <section class="myPage-main-section" style="background-color: #f1f8e9">
        <div class="myPage-main-content">
            <div class="myPage-main-content-document">
            	<h2 class="myPage-main-content-document-title"><strong>마케팅 정보 수신 동의</strong></h2>

        <p>개인정보보호법 제22조 제4항에 의해 선택정보 사항에 대해서는 기재하지 않으셔도 서비스를 이용하실 수 있습니다.</p>

        <h5><strong>1. 마케팅 및 광고에의 활용</strong></h5>
        <ul>
            <li>신규 기능 개발 및 맞춤 서비스 제공</li>
            <li>뉴스레터 발송, 새로운 기능(제품)의 안내</li>
            <li>할인 및 쿠폰 등 이벤트 등의 광고성 정보 제공</li>
        </ul>

        <h5><strong>2. 마케팅 정보 제공</strong></h5>
        <p>AVOCADO(아보카도) 서비스를 운용하는 과정에서 각종 정보를 서비스 화면, SMS, 푸시 알림, 이메일 등의 방법으로 회원에게 제공할 수 있으며, 결제 안내 등 의무적으로 안내해야 하는 정보성 내용 및 일부 혜택성 정보는 수신동의 여부와 무관하게 제공합니다.</p>

        <h5><strong>3. 수신 동의 및 철회</strong></h5>
        <p>AVOCADO(아보카도) 제공하는 마케팅 정보를 원하지 않을 경우 ‘설정 > 마케팅 수신 동의 설정’에서 철회를 요청할 수 있습니다. 또한 향후 마케팅 활용에 새롭게 동의하고자 하는 경우 ‘설정 > 마케팅 수신 동의 설정’에서 동의하실 수 있습니다.</p>

        <br><br>
        <button type="button" onclick="history.back()" class="adminPage-main-content-container-registerKickboard-btn">뒤로</button>
            </div>
        </div>
      </section>

    </main>
    <!-- footer start-->
<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>
