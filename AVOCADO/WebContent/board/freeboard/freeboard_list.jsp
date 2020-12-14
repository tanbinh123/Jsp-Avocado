<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.FreeboardDao, dto.FreeboardDto, java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	FreeboardDao dao = new FreeboardDao();
	
	String select = request.getParameter("t_select");
	String search = request.getParameter("t_search");
	if(select == null){
		select = "freeboard_title";
		search ="";
	}
	
	ArrayList<FreeboardDto> arr = dao.getFreeboard(select,search);

%>
<!DOCTYPE html>
<html lang="kr">

<head>
	<meta charset="utf-8">
	<title>아보카도 - No.1 공유킥보드 서비스</title>
	<meta name="author" content="thyoondev">
	<meta name="description" content="아보카도 - No.1 공유킥보드 서비스">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--제이쿼리 최신 -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!--css-->
	<link rel="stylesheet" href="../../css/common.css">
	<link rel="stylesheet" href="../../css/header.css">
	<link rel="stylesheet" href="../../css/footer.css">
	<link rel="stylesheet" href="../../css/board.css">
	<!--이모지-->
	<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet">
	<!--파비콘-->
	<link rel="icon" type="image/x-icon" href="img/favicon_io/favicon.ico"/>
	<!--애니메이션 https://animate.style/-->
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	 
</head>

<body>
    <!-- header start-->
	<header>
	<div id="header-inner">
	
	<a href="../../index.html"><div class="logo"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO" id="logo-image"></i>&nbsp;<span  id="logo-txt">AVOCADO</span></div></a>
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
          <a href="../../start.html"><button class="dropbtn"><i class="em em-rocket" aria-role="presentation" aria-label="ROCKET"></i>&nbsp;&nbsp;출발하기</button></a>
        </div>
        <div class="dropdown">
          <a href="../../member/login.html"><button class="dropbtn-login"><i class="em em-closed_lock_with_key" aria-role="presentation" aria-label="CLOSED LOCK WITH KEY"></i>&nbsp;&nbsp;로그인</button></a>
        </div>
    </nav>
    </div>
	</header>
	<!-- header end-->
	<script type="text/javascript">
	
		function goSearch(){
			freeboardSearch.method="post";
			freeboardSearch.action="freeboard_list.jsp";
			freeboardSearch.submit();
		}
		function goView(num){
			freeboardView.t_no.value = num;
			freeboardView.method = "post";
			freeboardView.action = "freeboard_view.jsp"
			freeboardView.submit();
		}
		
	</script>
	<form name="freeboardView">
		<input type="hidden" name="t_no">
	</form>
	<main>
   	   <section class="board-main-section" style="background-color: #f1f8e9;" >
	        <div class="board-main-content">
               <div class="board-container">
                   <div class="board-kind">
                       <a href="freeboard_list.jsp" class="board-kind-title">자유게시판</a>
                   </div>
                    <div class="board-box">
                      <div class="board-section board-th-container">
                           <div class="board-no board-th">
                                번호
                            </div>
                            <div class="board-title board-th">
                                제목
                            </div>
                            <div class="board-reg_name board-th">
                                작성자
                            </div>
                            <div class="board-reg_date board-th">
                                작성일
                            </div>
                            <div class="board-hit board-th">
                                조회
                            </div>
                            <div class="board-recommend board-th">
                                공감
                            </div>
                        </div>
<% for(int k = 0; k < arr.size(); k++ ) {%>
                       <div class="board-section">
                           <div class="board-no">
                                <%=arr.get(k).getFreeboard_no() %>
                            </div>
                            <div class="board-title" OnClick="javascript:goView('<%=arr.get(k).getFreeboard_no() %>')">
                              	<%=arr.get(k).getFreeboard_title() %>
                            </div>
                            <div class="board-reg_name">
                                <%=arr.get(k).getFreeboard_regName() %>
                            </div>
                            <div class="board-reg_date">
                                <%=arr.get(k).getFreeboard_regDate() %>
                            </div>
                            <div class="board-hit">
                                <%=arr.get(k).getFreeboard_hit() %>
                            </div>
                            <div class="board-recommend">
                                6
                            </div>
                        </div>
<% } %>
                       
                          
                        </div>
                        
                    </div>
                    
                    <div class="board-bottom">
                    <form name="freeboardSearch">
	                     <div class="board-bottom-search">
	                        <select name="t_select" id="">
	                            <option value="freeboard_title" <%if(select.equals("freeboard_title")) out.print("selected");%>>제목</option>
	                            <option value="freeboard_content" <%if(select.equals("freeboard_content")) out.print("selected");%>>내용</option>
	                        </select>
	                        <input name="t_search" type="text" value="<%=search%>">
	                        <button type="button" onclick="goSearch()">
	                            <i class="em em-mag header_icon" aria-role="presentation" aria-label="LEFT-POINTING MAGNIFYING GLASS"></i>
	                        </button>
	                     </div>
                     </form>
                       <div class="board-paging">
                          <div>앞</div>
                           <div style="background: #558203; color: #fff;">1</div>
                           <div>2</div>
                           <div>3</div>
                           <div>4</div>
                           <div>5</div>
                           <div>뒤</div>
                       </div>
                        <div>
                            <button type="button" class="board-write-button" onclick="location.href='freeboard_write.jsp'">글쓰기</button>
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
           <a href="index.html"><div class="footer-logo"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO" id="footer-logo-image"></i>&nbsp;<span id="footer-logo-txt">AVOCADO</span></div></a>   
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
           <br>
            <div class="footer-box-bottom">
            <i class="em em-kr" aria-role="presentation" aria-label="South Korea Flag"></i>
            <p>서비스 문의 : th.yoon.dev@gmail.com</p>
           <p> © Copyright thyoondev. All right reserved.</p>
           </div>
           </div>
        </div>
	</footer>
	<!-- footer end-->
</body>

</html>