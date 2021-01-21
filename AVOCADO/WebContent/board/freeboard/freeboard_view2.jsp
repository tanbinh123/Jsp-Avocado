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
  <head>
    <meta charset="utf-8" />
    <title>아보카도 - No.1 공유킥보드 서비스</title>
    <meta name="author" content="thyoondev" />
    <meta name="description" content="아보카도 - No.1 공유킥보드 서비스" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--제이쿼리 최신 -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!--css-->
    <link rel="stylesheet" href="../../css/common.css" />
    <link rel="stylesheet" href="../../css/header.css" />
    <link rel="stylesheet" href="../../css/footer.css" />
    <link rel="stylesheet" href="../../css/board.css" />
    <!--이모지-->
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet" />
    <!--파비콘-->
    <link rel="icon" type="image/x-icon" href="img/favicon_io/favicon.ico" />
    <!--애니메이션 https://animate.style/-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
  </head>

  <body>
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
		freeboard.action="freeboardUpdate.jsp";
		freeboard.submit();
	}
	function goDelete(){
		if(confirm(" 삭제하시겠습니까? ")){
			freeboard.method="post";
			freeboard.action="DBFreeBoardDelete.jsp";
			freeboard.submit();		
		}
	}
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
    <footer>
      <div class="footer-inner">
        <div class="footer-inner-box">
          <div class="footer-box">
            <a href="index.html"
              ><div class="footer-logo"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO" id="footer-logo-image"></i>&nbsp;<span id="footer-logo-txt">AVOCADO</span></div></a
            >
          </div>
          <div class="footer-box">
            <p class="footer-box-content-title">사이트 맵</p>
            <p class="footer-box-content-txt">홈</p>
            <p class="footer-box-content-txt">자유게시판</p>
            <p class="footer-box-content-txt">QNA</p>
            <p class="footer-box-content-txt">FAQ</p>
          </div>
          <div class="footer-box">
            <p class="footer-box-content-title">개발자 정보</p>
            <p class="footer-box-content-txt">프로젝트명 : 아보카도</p>
            <p class="footer-box-content-txt">개발 로드맵 : <a href="https://www.notion.so/153432ead0fd4336b0b998d08e6aa426?v=9b3a63f01aa84e0ca0249bfc9ede1527" target="_blank">로드맵 바로가기</a></p>
            <p class="footer-box-content-txt">개발크루원 : 윤태희 장명수 조경미</p>
            <p class="footer-box-content-txt">Github : <a href="https://github.com/thyoondev" target="_blank">https://github.com/thyoondev</a></p>
            <p class="footer-box-content-txt">e-mail : th.yoon.dev@gmail.com</p>
          </div>
        </div>
        <div>
          <br />
          <div class="footer-box-bottom">
            <i class="em em-kr" aria-role="presentation" aria-label="South Korea Flag"></i>
            <p>서비스 문의 : th.yoon.dev@gmail.com</p>
            <p>© Copyright thyoondev. All right reserved.</p>
          </div>
        </div>
      </div>
    </footer>
    <!-- footer end-->
  </body>
</html>