<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.FreeboardDao,dto.FreeboardDto,common.commonUtil" %>
<%

	FreeboardDao dao = new FreeboardDao();
	String no = request.getParameter("t_no");
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
              <a href="/board/freeboard/freeboard_list.jsp">자유게시판</a>
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
    
<script type="text/javascript">
	function goUpdate(){
//		if(!checkEmpty(freeboard.t_title," 제목 입력! ")) return;
//		if(!checkEmpty(freeboard.t_content," 내용 입력! ")) return;
//		if(!checkEmpty(freeboard.t_reg_date," 수정일 입력! ")) return;
		
		freeboard.method="post";
		freeboard.action="dbFreeboardUpdate.jsp";
		freeboard.submit();
		
	}
    
</script>
    <main>
      <section class="board-main-section" style="background-color: #f1f8e9">
        <div class="board-main-content">
          <div class="board-container">
            <div class="board-kind">
              <a href="/board/freeboard/freeboard_list.jsp" class="board-kind-title">자유게시판</a>
            </div>
        <form name="freeboard">
        	<input type="hidden" name="t_no" value="<%=no %>">
            <div class="board-box">
              <div class="board-box-write-top">
                <div class="board-box-write-th">제목</div>
                <div class="board-box-write-td"><input type="text" name="t_title" value="<%=dto.getFreeboard_title() %>" /></div>
              </div>
              <div class="board-box-write-middle">
                <div class="board-box-write-th">내용</div>
                <div class="board-box-write-td">
                  <textarea name="t_content"><%=dto.getFreeboard_content() %></textarea>
                </div>
              </div>
              <div class="board-box-write-bottom">
                <div class="board-box-write-bottom-left">
                  <div class="board-box-write-th-bottom">작성자</div>
                  <div class="board-box-write-td-bottom"><input type="text" name="t_reg_name" value="<%=dto.getFreeboard_regName() %>" /></div>
                </div>
                <div class="board-box-write-bottom-right">
                  <div class="board-box-write-th-bottom">작성일</div>
                  <div class="board-box-write-td-bottom"><input type="date" name="t_reg_date" value="<%=dto.getFreeboard_regDate() %>" /></div>
                </div>
              </div>
            </div>
        </form>

            <div class="board-bottom">
              <div class="board-bottom-blank"></div>
              <div>
                <button type="button" onclick="history.back()" class="board-write-button">뒤로</button>
                <button class="board-write-button" onclick="goUpdate()">등록</button>
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
