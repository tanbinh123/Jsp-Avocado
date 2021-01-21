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
            <p class="adminPage-main-content-title">킥보드 검색</p>
            <div class="adminPage-main-content-container">
                   <div class="adminPage-main-content-container-search">
					<form name="searchKickboard">
					킥보드 번호 : 
					<input 
					type="text" 
					name="t_kickboard_no" 
					value="<% if (request.getParameter("t_kickboard_no") != null) {
					  out.print(request.getParameter("t_kickboard_no"));
					  }%>"
					 class="adminPage-main-content-container-registerKickboard-inputbox"/>
					<button onclick="searchKickboard()" class="adminPage-main-content-container-registerKickboard-btn-half"><i class="em em-mag" aria-role="presentation" aria-label="LEFT-POINTING MAGNIFYING GLASS"></i></button>
					</form>
					<%
					AdminDao dao = new AdminDao();
					ArrayList<KickboardDto> kickboardArray = dao.getKickboard(request.getParameter("t_kickboard_no"));
						if (kickboardArray.size() == 0) {
						  out.print("검색 결과가 없습니다.");
						}else {%>
								<table>
								<colgroup>
									<col style="width:5%;">
									<col style="width:11%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:8%;">
									<col style="width:7%;">
								</colgroup>
								<tr>
								<th>번호</th><th>이름</th><th>종류</th><th>대여 여부</th><th>위치</th><th>등록 날짜</th><th>이용 횟수</th><th>배터리</th>
								</tr>
								
							<% for (int i = 0; i < kickboardArray.size(); i++) { %>
							<tr>
								<td title="대여 내역 조회" style="cursor:pointer;" onClick="location.href='/member/admin/serchRentHistory.jsp?t_kickboard_no=<%=kickboardArray.get(i).getKickboard_no() %>'"><%=kickboardArray.get(i).getKickboard_no() %></a></td>
								<td><%=kickboardArray.get(i).getKickboard_name() %></td>
								<td><%=kickboardArray.get(i).getKickboard_type() %></td>
								<td class= "td_center"><% if (kickboardArray.get(i).getKickboard_rentstats() == 0 ) {%>
								  	대여 가능
								<% } else {%>
									이용 중
								  <% } %>
								</td>
								<td><%=kickboardArray.get(i).getKickboard_location().substring(22, kickboardArray.get(i).getKickboard_location().length()-1	) %></td>
								<td class= "td_center"><%=kickboardArray.get(i).getKickboard_regdate().substring(0,10) %></td>
								<td class= "td_center"><%=kickboardArray.get(i).getKickboard_totalusedtimes() %></td>
								<td class= "td_center"><%=kickboardArray.get(i).getKickboard_battery() %>%</td>
							</tr>
						<% }%>
						</table>
							<%}%>
    
                    <br><button type="button" onclick="location.href='/member/admin/adminPage.jsp'" class="adminPage-main-content-container-registerKickboard-btn">관리 페이지 홈</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="history.back()" class="adminPage-main-content-container-registerKickboard-btn">뒤로</button>
                    </div>
                </div>
             <% } else {%>
            	<h1>401 ERROR</h1>
				<h1>로그인이 필요한 페이지입니다.</h1>
			<% }%>
            </div>
      </section>
      <script type="text/javascript">
		function searchKickboard() {
			searchKickboard.action = "/member/admin/serchMember.jsp";
			searchKickboard.method = "post";
			searchKickboard.submit();
		}
		</script>
    </main>
    <!-- footer start-->
<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>
