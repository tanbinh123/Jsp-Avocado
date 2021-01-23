<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.FreeboardDao,dto.FreeboardDto" %>
<%
  FreeboardDao dao = new FreeboardDao();
	String no = request.getParameter("t_no");
	dao.setHitCount(no);
	FreeboardDto dto = dao.getFreeboardView(no);
%>

<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp" %>
    <!-- header end-->
    
<script>
	function goUpdateForm(){
		freeboard.method="post";
		freeboard.action="/board/freeboard/freeboardUpdate.jsp";
		freeboard.submit();
	}
	function goDelete(){
		if(confirm("삭제된 게시물은 복구 할 수 없습니다.\n정말 삭제 하시겠습니까? ")){
			freeboard.method="post";
			freeboard.action="/board/freeboard/DBFreeBoardDelete.jsp";
			freeboard.submit();		
		}
	}
	function goLikeStack() {
		<%if (!sessionEmail.equals("")) {%>
			<% if (sessionEmail.equals(dto.getReg_email())) { %>
	        	alert('자신의 글은 자신이 공감할 수 없습니다.');
	       	<% } else {%>
		       	freeboard.method="post";
				freeboard.action="/board/freeboard/DBFreeBoardLikeStack.jsp";
				freeboard.submit();	
	      	<% }%> 
		<%} else {%>
		alert('로그인 후 이용가능합니다.');
		location.href='/member/login.jsp';
		<%}%>
	}
	//function goLikeStack(){
		//freeboard.method="post";
		//freeboard.action=
	//}
</script> 

    <main>
    <form name="freeboard">
		<input type="hidden" name="t_no" value="<%=no %>">
		<input type="text" name="t_attach" value="<%=dto.getFreeboard_attach()%>">
		<input type="hidden" name="t_sessionEmail" value="<%=sessionEmail%>">
	</form>
      <section class="board-main-section" style="background-color: #f1f8e9">
        <div class="board-main-content">
          <div class="board-container">
            <div class="board-kind">
              <a href="freeboardList.jsp" class="board-kind-title">자유게시판</a>
            </div>
            <div class="board-box">
              <div class="board-box-view-middle">
                <div class="board-box-view-middle-left">
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th-no">글번호</div>
                    <div class="board-box-view-middle-no"><%=dto.getFreeboard_no() %></div>
                  </div>
                  
                </div>
                
                <div class="board-box-view-middle-right">
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th">작성자</div>
                    <div class="board-box-view-middle-reg_name"><%=dto.getFreeboard_regName() %></div>
                  </div>
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th">작성일</div>
                    <div class="board-box-view-middle-reg_date"><%=dto.getFreeboard_regDate() %></div>
                  </div>
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th">조회수</div>
                    <div class="board-box-view-middle-hit"><%=dto.getFreeboard_hit() %></div>
                  </div>
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th">공감</div>
                    <div class="board-box-view-middle-up"><%=dto.getFreeboard_like() %></div>
                  </div>
                </div>
              </div>
              
              <div class="board-box-view-top"><%=dto.getFreeboard_title() %></div>
              <div class="board-box-view-bottom">
               <%=dto.getFreeboard_content() %>
              </div>
              <div class="board-box-view-middle">
				<div class="board-box-view-middle-box">
					<div class="board-box-view-middle-th">첨부파일</div>
					<div class="board-box-view-middle-attach">
					<%  if(dto.getFreeboard_attach() != null){ %>
						<a href="/common/filedown.jsp?t_file=<%=dto.getFreeboard_attach()%>&t_gubun=notice"><%=dto.getFreeboard_attach()%></a>
					<%  } %></div>
				</div>
			</div>
              
            </div>

            <div class="board-bottom">
              <div class="board-bottom-blank"></div>
              <div>
                <button id="bGoodBtn" type="button" onclick="goLikeStack()" class="board-write-button">공감</button>
                <button type="button" onclick="history.back()" class="board-write-button">목록</button>
                <% if (sessionEmail.equals(dto.getReg_email()) || sessionLevel.equals("top")) { %>
	                <button class="board-write-button" onclick="goUpdateForm()">수정</button>
	                <button class="board-write-button" onclick="goDelete()">삭제</button>
                <% } %>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
    <!-- footer start-->
		<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>