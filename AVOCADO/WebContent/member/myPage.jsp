<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
 <%@ include file="/common/header.jsp" %>
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
                    <img src="../img/profileimg.jpg">
                    <div class="myPage-main-content-myInfo-profileText">
                        <p class="myPage-main-content-myInfo-profileText-name">관리자 님<p>
                        <p class="myPage-main-content-myInfo-profileText-email">admin@avocado.com</p>
                        <p>충전금 : 46,000원</p>
                    </div>
                </div>
                <div class="myPage-main-content-myInfo-profileRight">
                    <button class="myPage-main-content-myInfo-profileRight-profileEditButton" onclick="goProfileEdit()">프로필 정보 수정</button>
                </div>
            </div>
            <div class="myPage-main-content-container">
                <div class="myPage-main-content-container-box">
                    <p>이용 통계</p>
                    <div class="ss">차트</div>
                    <p>총 13회, 2시간 23분 이용하셨습니다.</p>
                </div>
                <div class="myPage-main-content-container-box">
                    <p>나의 등급</p>
                    <div class="ss">등급 이미지</div>
                    <p>혜택 설명</p>
                </div>
                <div class="myPage-main-content-container-box">
                    <p>나의 작성글</p>
                </div>
                <div class="myPage-main-content-container-box">문의</div>
            </div>
        </div>
      </section>
    </main>
    <!-- footer start-->
<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>
