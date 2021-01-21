<%@page import="java.text.DecimalFormat"%>
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
                
                
                <% 

String no = "";
String serchType = "";
String member_no = request.getParameter("t_member_no");
String kickboard_no = request.getParameter("t_kickboard_no");


	  if (kickboard_no != null && !kickboard_no.equals("")) {
		  no = kickboard_no;
		  serchType = "kickboard";
		} else if (member_no != null && !member_no.equals("")){
		  no = member_no;
		  serchType = "member";
		} else {
		  serchType = "";
		}

	  	


AdminDao dao = new AdminDao();
ArrayList<RentDto> rentArray = dao.getRentHistory(no, serchType);
//*************page 시작**************/
	int	list_setup_count = 15;			// 한페이지에 출력될 List 수 

	String r_page = request.getParameter("r_page");
	if(r_page==null) r_page= "";
	int			current_page;					// 현재페이지 번호
	int			total_page;						// 총페이지 수
	int			total_count;					// 총레코드 수
	int			for_count;						
	int			p_no;
	int			v_count;
	int			a_count;
	String		url				= null;	

	// 조회된 건수 구하기  total_count : 설정
	if(rentArray == null) total_count =0;
	else total_count = rentArray.size(); 


	// 페이지번호가 없으면 1페이지로 간주
	if(r_page.equals("")) current_page = 1;
	else current_page = Integer.parseInt(r_page);
		
	for_count		= list_setup_count;
	p_no			= list_setup_count;				// 페이지수가 10
	total_page = total_count / list_setup_count;		// 전체페이지수 계산 (if 23개 게시물이면 2)
   
	if(current_page == 1) {
		v_count		= 0;
		a_count		= list_setup_count;
		for_count	= 0;
	} else{
		v_count		= 0;
		a_count		= p_no * current_page;
		for_count	= a_count - list_setup_count;
	}
	if(total_page * list_setup_count != total_count)   total_page = total_page +1;

//*************page 끝**************/	%>
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
            <a href="/member/admin/adminPage.jsp"><p class="adminPage-main-content-topTitle">관리자 페이지</p></a>
            <p class="adminPage-main-content-title">서비스 이용 내역 검색</p>
            <div class="adminPage-main-content-container">
                   <div class="adminPage-main-content-container-search">
                   <form name="searchUser">
					멤버 번호로 검색 :&nbsp;&nbsp;&nbsp;&nbsp;
					<input 
					type="text" 
					name="t_member_no"
					value = "<% if (member_no != null ) {
					  out.print(member_no);
					}%>"
					class="adminPage-main-content-container-registerKickboard-inputbox"/>
					<button onclick="searchUser()"class="adminPage-main-content-container-registerKickboard-btn-half"><i class="em em-mag" aria-role="presentation" aria-label="LEFT-POINTING MAGNIFYING GLASS"></i></button>
					</form>
					<form name="searchKickboard">
					킥보드 번호로 검색 : 
					<input 
					type="text" 
					name="t_kickboard_no"
					value="<% if (kickboard_no != null) {
					  out.print(kickboard_no);
					  }%>"
					  class="adminPage-main-content-container-registerKickboard-inputbox"/>
					<button onclick="searchKickboard()"class="adminPage-main-content-container-registerKickboard-btn-half"><i class="em em-mag" aria-role="presentation" aria-label="LEFT-POINTING MAGNIFYING GLASS"></i></button>
					</form>
					
					
					
					<form name="pageForm">
						<input type="hidden" name="r_page">
						<%if (member_no != null && !member_no.equals("")) {%>
							<input type="hidden" name="t_member_no" value="<%=no%>">
						<%} %>
						<%if (kickboard_no != null && !kickboard_no.equals("")) {%>
							<input type="hidden" name="t_kickboard_no" value="<%=no%>">
						<%} %>
					</form>
					<%
					
					
					
						if (rentArray.size() == 0) {
						  out.print("검색 결과가 없습니다.");
						}else {%>
								<table>
								<tr>
								<th>렌트 번호</th><th>멤버 번호</th><th>멤버 이름</th><th>킥보드 번호</th><th>대여 시간</th><th>반납 시간</th><th>총 이용 시간</th><th>대여 중 여부</th><th>요금</th>
								</tr>
								
							<% 
							DecimalFormat df = new DecimalFormat("###,###,###");
							
							
							//for (int i = 0; i < rentArray.size(); i++) { 
							if ( total_count > 0 ){
						for(int k = 0 ; k < total_count ; k++ )	{
							if(v_count == for_count){   
							  
							  
							int usedDate = rentArray.get(k).getRent_useddate();
								String usedDateStr = (usedDate/60) + "분 " + (usedDate % 60) + "초";
								%>
							<tr>
								<td class= "td_center"><%=rentArray.get(k).getRent_no() %></td>
								<td class= "td_center" title="멤버 정보 조회" style="cursor:pointer;" onClick="location.href='/member/admin/serchMember.jsp?t_member_no=<%=rentArray.get(k).getRent_member_no()%>'"><%=rentArray.get(k).getRent_member_no() %></a></td>
								<td class= "td_center" title="멤버 정보 조회" style="cursor:pointer;" onClick="location.href='/member/admin/serchMember.jsp?t_member_no=<%=rentArray.get(k).getRent_member_no()%>'"><%=rentArray.get(k).getMember_member_name() %></a></td>
								<td class= "td_center" title="킥보드 정보 조회" style="cursor:pointer;" onClick="location.href='/member/admin/serchKickboard.jsp?t_kickboard_no=<%=rentArray.get(k).getRent_kickboard_no()%>'"><%=rentArray.get(k).getRent_kickboard_no() %></a></td>
								<td><%=rentArray.get(k).getRent_startdate() %></td>
								<td><%if (rentArray.get(k).getRent_enddate() == null) {
								  out.print ("대여 중");
								  }else {
								    out.print (rentArray.get(k).getRent_enddate());
								  }
								  %></td>
								<td class= "td_center"><%=usedDateStr %></td>
								<td class= "td_center"><% if (rentArray.get(k).getRent_stats() == 0 ) {%>
								  	대여 중
								<% } else {%>
									반납 완료
								  <% } %>
								</td>
								<td class= "td_center"><%=df.format(rentArray.get(k).getRent_cost()) %>원</td>
							</tr>
						<% //}
								v_count = v_count + 1;
								for_count = for_count + 1;
							}else { 
								v_count = v_count + 1;
							}
							if(v_count == a_count)break; 
						}
					}
	%>
						</table>
						<div class="adminPage-main-content-container-seach-pagig">
							<%}
					out.println(Paging.pageListPost(current_page, total_page));	
							%>
						</div>
                    <br>
                    <div class="adminPage-main-content-container-seach-bottom-button">
                    <button type="button" onclick="location.href='/member/admin/adminPage.jsp'" class="adminPage-main-content-container-registerKickboard-btn">관리 페이지 홈</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="history.back()" class="adminPage-main-content-container-registerKickboard-btn">뒤로</button>
                    </div>
                    
                    </div>
                </div>
			<% } else {%>
            	<h1>401 ERROR</h1>
				<h1>로그인이 필요한 페이지입니다.</h1>
			<% }%>
            </div>
      </section>
      <script type="text/javascript">
		function searchUser() {
			searchUser.action = "/member/admin/serchMember.jsp";
			searchUser.method = "post";
			searchUser.submit();
		}
		function searchKickboard() {
			searchKickboard.action = "/member/admin/serchMember.jsp";
			searchKickboard.method = "post";
			searchKickboard.submit();
		}
		function goPage(pageNumber){
			pageForm.r_page.value = pageNumber;
			pageForm.method="post";
			pageForm.action="/member/admin/serchRentHistory.jsp";
			pageForm.submit();
		}
		</script>
    </main>
    <!-- footer start-->
<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>
