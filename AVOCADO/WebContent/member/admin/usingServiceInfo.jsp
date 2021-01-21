<%@page import="java.util.ArrayList"%>
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
            <p class="adminPage-main-content-title">현재 서비스 이용 정보</p>
            <div class="adminPage-main-content-container">
                   <div class="adminPage-main-content-container-usingServiceInfo">
                <% AdminDao dao = new AdminDao();
                ArrayList<RentDto> usingServiceUserArray = dao.getUsingServiceUser();

                if (usingServiceUserArray.size() == 0) {
                  out.print("서비스를 이용중인 유저가 없습니다.");
                }else {%>
                        <table>
                        <tr>
                        <th>렌트 번호</th><th>멤버 번호</th><th>킥보드 번호</th><th>서비스 이용 시작 시간</th>
                        </tr>
                        <tr>
                    <% for (int i = 0; i < usingServiceUserArray.size(); i++) { %>
                        <td><%=usingServiceUserArray.get(i).getRent_no() %></td>
                        <td title="대여 내역 조회" style="cursor:pointer;" onClick="location.href='/member/admin/serchRentHistory.jsp?t_member_no=<%=usingServiceUserArray.get(i).getRent_member_no() %>'"><%=usingServiceUserArray.get(i).getRent_member_no() %></a></td>
                        <td title="대여 내역 조회" style="cursor:pointer;" onClick="location.href='/member/admin/serchRentHistory.jsp?t_kickboard_no=<%=usingServiceUserArray.get(i).getRent_kickboard_no() %>'"><%=usingServiceUserArray.get(i).getRent_kickboard_no() %></a></td>
                        <td><%=usingServiceUserArray.get(i).getRent_startdate() %></td>
                <% }%>
                </table>
                    <%} %>
                    <br><button type="button" class="adminPage-main-content-container-registerKickboard-btn" onclick="location.href='/member/admin/adminPage.jsp'">관리 페이지 홈</button>
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
