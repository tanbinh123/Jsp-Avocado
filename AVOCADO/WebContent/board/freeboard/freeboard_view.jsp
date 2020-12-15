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
    <!-- header start-->
    <header>
      <div id="header-inner">
        <a href="../../index.html"
          ><div class="logo"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO" id="logo-image"></i>&nbsp;<span id="logo-txt">AVOCADO</span></div></a
        >
        <nav id="menu">
          <!--<div class="dropdown">
          <a href="#이용방법"><button class="dropbtn"><i class="em em-beginner" aria-role="presentation" aria-label="JAPANESE SYMBOL FOR BEGINNER"></i>&nbsp;&nbsp;이용 방법</button></a>
        </div>
        <div class="dropdown">
          <a href="#안전수칙"><button class="dropbtn"><i class="em em-female-construction-worker" aria-role="presentation" aria-label=""></i>&nbsp;&nbsp;안전 수칙</button></a>
        </div>-->
          <div class="dropdown">
            <button class="dropbtn"><i class="em em-left_speech_bubble" aria-role="presentation" aria-label=""></i>&nbsp;&nbsp;게시판</button>
            <div class="dropdown-content">
              <a href="freeboard_list.jsp">자유게시판</a>
              <a href="../qna/qna_list.html">문의하기</a>
              <a href="../faq/faq_list.html">자주묻는질문</a>
              <a href="/Devinfo">개발정보</a>
            </div>
          </div>
          <div class="dropdown">
            <a href="../../start.html"
              ><button class="dropbtn"><i class="em em-rocket" aria-role="presentation" aria-label="ROCKET"></i>&nbsp;&nbsp;출발하기</button></a
            >
          </div>
          <div class="dropdown">
            <a href="../../login.html"
              ><button class="dropbtn-login"><i class="em em-closed_lock_with_key" aria-role="presentation" aria-label="CLOSED LOCK WITH KEY"></i>&nbsp;&nbsp;로그인</button></a
            >
          </div>
        </nav>
      </div>
    </header>
    <!-- header end-->
    
<script>
	function goUpdateForm(){
		freeboard.method="post";
		freeboard.action="/board/freeboard/freeboard_update.jsp";
		freeboard.submit();
	}
	function goDelete(){
		if(confirm(" 삭제하시겠습니까? ")){
			freeboard.method="post";
			freeboard.action="/board/freeboard/dbFreeBoardDelete.jsp";
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