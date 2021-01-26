<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.QnaDao,dto.QnaDto" %>
<%
  QnaDao dao = new QnaDao();
	String no = request.getParameter("t_no");
	dao.setHitCount(no);
	QnaDto dto = dao.getQnaView(no);
%>

<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp" %>
    <!-- header end-->
    
<script>
	function goUpdateForm(){
		qna.method="post";
		qna.action="/board/qna/qnaUpdate.jsp";
		qna.submit();
	}
	function goDelete(){
		if(confirm("삭제된 게시물은 복구 할 수 없습니다.\n정말 삭제 하시겠습니까? ")){
			qna.method="post";
			qna.action="/board/qna/DBQnaDelete.jsp";
			qna.submit();		
		}
	}
	function goLikeStack() {
		<%if (!sessionEmail.equals("")) {%>
			<% if (sessionEmail.equals(dto.getReg_email())) { %>
	        	alert('자신의 글은 자신이 공감할 수 없습니다.');
	       	<% } else {%>
		       	qna.method="post";
				qna.action="/board/qna/DBQnaLikeStack.jsp";
				qna.submit();	
	      	<% }%> 
		<%} else {%>
		alert('로그인 후 이용가능합니다.');
		location.href='/member/login.jsp';
		<%}%>
	}
	//function goLikeStack(){
		//qna.method="post";
		//qna.action=
	//}
</script> 

    <main>
    <form name="qna">
		<input type="hidden" name="t_no" value="<%=no %>">
		<input type="hidden" name="t_attach" value="<%=dto.getqna_attach()%>">
		<input type="hidden" name="t_sessionEmail" value="<%=sessionEmail%>">
	</form>
      <section class="board-main-section" style="background-color: #f1f8e9">
        <div class="board-main-content">
          <div class="board-container">
            <div class="board-kind">
              <a href="qnaList.jsp" class="board-kind-title">QnA</a>
            </div>
            <div class="board-box">
              <div class="board-box-view-middle">
                <div class="board-box-view-middle-left">
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th-no">글번호</div>
                    <div class="board-box-view-middle-no"><%=dto.getqna_no() %></div>
                  </div>
                  
                </div>
                
                <div class="board-box-view-middle-right">
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th">작성자</div>
                    <div class="board-box-view-middle-reg_name"><%=dto.getqna_regName() %></div>
                  </div>
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th">작성일</div>
                    <div class="board-box-view-middle-reg_date"><%=dto.getqna_regDate() %></div>
                  </div>
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th">조회수</div>
                    <div class="board-box-view-middle-hit"><%=dto.getqna_hit() %></div>
                  </div>
                  <div class="board-box-view-middle-box">
                    <div class="board-box-view-middle-th">공감</div>
                    <div class="board-box-view-middle-up"><%=dto.getqna_like() %></div>
                  </div>
                </div>
              </div>
              
              <div class="board-box-view-top"><%=dto.getqna_title() %></div>
              <div class="board-box-view-bottom">
               <%=dto.getqna_content() %>
              </div>
              <div class="board-box-view-middle">
				<div class="board-box-view-middle-box">
					<div class="board-box-view-middle-th">첨부파일</div>
					<div class="board-box-view-middle-attach">
					<%  if(dto.getqna_attach() != null){ %>
						<a href="/common/filedown.jsp?t_file=<%=dto.getqna_attach()%>&t_gubun=notice"><%=dto.getqna_attach()%></a>
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