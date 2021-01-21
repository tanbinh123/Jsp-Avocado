<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*, common.*"%>
<!DOCTYPE html>
<html lang="kr">
   <%@ include file="/common/header.jsp" %>
    <!-- header end-->
    <main>
      <section class="adminPage-main-section" style="background-color: #f1f8e9">
        <div class="adminPage-main-content">
         <% if (sessionLevel.equals("top")) {%>
            <a href="/member/admin/adminPage.jsp"><p class="adminPage-main-content-topTitle">관리자 페이지</p></a>
            <p class="adminPage-main-content-title">새로운 킥보드 등록</p>
            <div class="adminPage-main-content-container">
                   <div class="adminPage-main-content-container-registerKickboard">
                        <form name="addKickboard">
                            킥보드 이름 : <input type="text" class="adminPage-main-content-container-registerKickboard-inputbox" name="t_name" value = "아보카도킥보드"/><br>
                            킥보드 종류 : <select name="t_type" class="adminPage-main-content-container-registerKickboard-inputbox">
                                <option value="NQ-01Plus">NQ-01Plus</option>
                                <option value="LGO-C550">LGO-C550</option>
                                <option value="NinebotMax">NinebotMax</option>
                            </select><br>
                            킥보드 위도 : <input type="text" class="adminPage-main-content-container-registerKickboard-inputbox" name="t_latitude" /><br>
                            킥보드 경도 : <input type="text" class="adminPage-main-content-container-registerKickboard-inputbox" name="t_longitude" /><br>
                            <button type="button" onclick="window.open('https://www.google.com/maps')" class="adminPage-main-content-container-registerKickboard-btn">구글 지도</button>
                            <button type="button" onclick="goAddKickboard()" class="adminPage-main-content-container-registerKickboard-btn">등록</button>
                            <button type="button" onclick="location.href='/member/admin/adminPage.jsp'" class="adminPage-main-content-container-registerKickboard-btn">관리 메인</button>
                        </form>
                    </div>
                </div>
                 <% } else {%>
            	<h1>401 ERROR</h1>
				<h1>로그인이 필요한 페이지입니다.</h1>
			<% }%>
            </div>
      </section>
      <script type="text/javascript">
		function goAddKickboard() {
			addKickboard.action = "/member/admin/DBAddKickboard.jsp";
			addKickboard.method = "post";
			addKickboard.submit();
		}
		</script>
    </main>
    <!-- footer start-->
<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>
