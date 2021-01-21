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
        String member_no = "";
        if(request.getParameter("t_member_no") != null) {
          member_no = request.getParameter("t_member_no");
        }
        DecimalFormat df = new DecimalFormat("###,###,###");
		AdminDao dao = new AdminDao();
		ArrayList<MemberDto> userArray = dao.getUser(member_no);
		
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
      	if(userArray == null) total_count =0;
      	else total_count = userArray.size(); 


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

      //*************page 끝**************/	
      
        %>
            <a href="/member/admin/adminPage.jsp"><p class="adminPage-main-content-topTitle">관리자 페이지</p></a>
            <p class="adminPage-main-content-title">멤버 검색</p>
            <div class="adminPage-main-content-container">
                   <div class="adminPage-main-content-container-search">
					<form name="searchUser">
					멤버 번호 : 
					<input 
					type = "text" 
					name = "t_member_no"
					value = "<% if (member_no != null ) {
					  out.print(member_no);
					}%>"
					class="adminPage-main-content-container-registerKickboard-inputbox"/>
					<button onclick="searchUser()"class="adminPage-main-content-container-registerKickboard-btn-half"><i class="em em-mag" aria-role="presentation" aria-label="LEFT-POINTING MAGNIFYING GLASS"></i></button>
					</form>
					
					<form name="pageForm">
						<input type="hidden" name="r_page">
						<input type="hidden" name="t_member_no" value="<%=member_no%>">
					</form>
					
					<%
					
						if (userArray.size() == 0) {
						  out.print("검색 결과가 없습니다.");
						}else {%>
								<table>
								<colgroup>
									<col style="width:4%;">
									<col style="width:9%;">
									<col style="width:7%;">
									<col style="width:15%;">
									<col style="width:11%;">
									<col style="width:7%;">
									<col style="width:7%;">
									<col style="width:6%;">
									<col style="width:16%;">
									<col style="width:8%;">
									<col style="width:20%">
								</colgroup>
								<tr>
								<th>번호</th><th>성명</th><th>이메일</th><th>전화번호</th><th>마지막 이용</th><th>이용</th><th>충전금</th><th>면허</th><th>총 이용시간</th><th>등급</th><th>가입일</th>
								</tr>
								
							<% //for (int i = 0; i < userArray.size(); i++) { 
							if ( total_count > 0 ){
								for(int i = 0 ; i < total_count ; i++ )	{
									if(v_count == for_count){   
							int usedDate = userArray.get(i).getMember_useTimes();
							String usedDateStr = (usedDate/60/60)+"시간 " + ((usedDate/60)%60) + "분 " + (usedDate % 60) + "초";%>
							<tr>
								<td title="대여 내역 조회" style="cursor:pointer;" onClick="location.href='/member/admin/serchRentHistory.jsp?t_member_no=<%=userArray.get(i).getMember_no() %>'"><%=userArray.get(i).getMember_no() %></a></td>
								<td class= "td_center"><%=userArray.get(i).getMember_name() %></td>
								<td><%=userArray.get(i).getMember_email() %></td>
								<td><%=userArray.get(i).getMember_phoneNumber() %></td>
								<td><%if (userArray.get(i).getMember_lastRentDate() != null) {
								  out.print(userArray.get(i).getMember_lastRentDate());
								} else {
								  out.print("없음");
								} %></td>
								<td class= "td_center"><%=userArray.get(i).getMember_useCount() %>회</td>
								<td class= "td_center"><%=df.format(userArray.get(i).getMember_money())%>원</td>
								<td class= "td_center"><% if (userArray.get(i).getMember_accept() == 1) {
								  out.print("유");
								  } else {
								  out.print("무");
								  }%></td>
								<td><%=usedDateStr %></td>
								<td class= "td_center"><%=userArray.get(i).getMember_rank() %></td>
								<td><%=userArray.get(i).getMember_regDate().substring(0,10) %></td>
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
							<%
					out.println(Paging.pageListPost(current_page, total_page));	
							%>
						</div>
							<%}%>
									<br>
    				<div class="adminPage-main-content-container-seach-bottom-button">
                   <br><button type="button" onclick="location.href='/member/admin/adminPage.jsp'" class="adminPage-main-content-container-registerKickboard-btn">관리 페이지 홈</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="history.back()" class="adminPage-main-content-container-registerKickboard-btn">뒤로</button>
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
		function goPage(pageNumber){
			pageForm.r_page.value = pageNumber;
			pageForm.method="post";
			pageForm.action="/member/admin/serchMember.jsp";
			pageForm.submit();
		}
		</script>
    </main>
    <!-- footer start-->
<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>
