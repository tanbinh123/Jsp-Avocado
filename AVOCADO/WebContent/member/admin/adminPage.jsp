<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
 <%@ include file="/common/header.jsp" %>
    <!-- header end-->
    <main>
      <section class="adminPage-main-section" style="background-color: #f1f8e9">
        <div class="adminPage-main-content">
        <% if (sessionLevel.equals("top")) {%>
            <a href="/member/admin/adminPage.jsp"><p class="adminPage-main-content-topTitle">관리자 페이지</p></a>
            <p class="adminPage-main-content-title">서비스 관련</p>
            <div class="adminPage-main-content-container-main">
                <div class="adminPage-main-content-container-box">
                    <p>새로운 킥보드 등록</p>
                    <button class="adminPage-main-content-container-button" onclick="location.href='/member/admin/registerKickboard.jsp'">바로가기</button>
                </div>
                <div class="adminPage-main-content-container-box">
                    <p>현재 서비스 이용 정보</p>
                    <button class="adminPage-main-content-container-button" onclick="location.href='/member/admin/usingServiceInfo.jsp'">바로가기</button>
                </div>
                <div class="adminPage-main-content-container-box-blank">

                </div>
                <div class="adminPage-main-content-container-box-blank">

                </div>
            </div>
            <p class="adminPage-main-content-title">검색 관련</p>
            <div class="adminPage-main-content-container-main">
                <div class="adminPage-main-content-container-box">
                    <p>멤버 검색</p>
                    <button class="adminPage-main-content-container-button" onclick="location.href='/member/admin/serchMember.jsp'">바로가기</button>
                </div>
                <div class="adminPage-main-content-container-box">
                    <p>킥보드 검색</p>
                    <button class="adminPage-main-content-container-button" onclick="location.href='/member/admin/serchKickboard.jsp'">바로가기</button>
                </div>
                <div class="adminPage-main-content-container-box">
                    <p>대여 목록 검색</p>
                    <button class="adminPage-main-content-container-button" onclick="location.href='/member/admin/serchRentHistory.jsp'">바로가기</button>
                </div>
                <div class="adminPage-main-content-container-box-blank">
                </div>
            </div>
            <% } else {%>
            	<h1>401 ERROR</h1>
				<h1>로그인이 필요한 페이지입니다.</h1>
			<% }%>
        </div>
      </section>
    </main>
    <!-- footer start-->
<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>
