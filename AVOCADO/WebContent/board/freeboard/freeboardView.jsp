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
		if(confirm(" 삭제하시겠습니까? ")){
			freeboard.method="post";
			freeboard.action="/board/freeboard/DBFreeBoardDelete.jsp";
			freeboard.submit();		
		}
	}
	//function goLikeStack(){
		//freeboard.method="post";
		//freeboard.action=
	//}
</script> 
    <main>
    <form name="freeboard">
		<input type="hidden" name="t_no" value="<%=no %>">
	</form>
      <section class="board-main-section" style="background-color: #f1f8e9">
        <div class="board-main-content">
          <div class="board-container">
            <div class="board-kind">
              <a href="freeboard_list.jsp" class="board-kind-title">자유게시판</a>
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
                    <div class="board-box-view-middle-up">6</div>
                  </div>
                </div>
              </div>
              <div class="board-box-view-top"><%=dto.getFreeboard_title() %></div>
              <div class="board-box-view-bottom">
               <%=dto.getFreeboard_content() %>
              </div>
            </div>

            <div class="board-bottom">
              <div class="board-bottom-blank"></div>
              <div>
                <button type="button" onclick="goLikeStack()" class="board-write-button">공감</button>
                <button type="button" onclick="history.back()" class="board-write-button">목록</button>
                <button class="board-write-button" onclick="goUpdateForm()">수정</button>
                <button class="board-write-button" onclick="goDelete()">삭제</button>
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