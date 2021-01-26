<%@page import="common.commonUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/sessionInfo.jsp" %>
  <head>
    <meta charset="utf-8" />
    <title>아보카도 - No.1 공유킥보드 서비스</title>
    <meta name="author" content="thyoondev" />
    <meta name="description" content="아보카도 - No.1 공유킥보드 서비스" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <!--제이쿼리 최신 -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Noto+Sans+KR:wght@100;300;400;500;700&family=Rowdies:wght@700&display=swap" rel="stylesheet">
    <!--이모지-->
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet" />
    <!-- js -->
    <script type="text/javascript" src="/js/commonUtil.js"></script>
    <% if (this.getClass().getSimpleName().replaceAll("_", ".").equals("freeboardWrite.jsp") || this.getClass().getSimpleName().replaceAll("_", ".").equals("freeboardUpdate.jsp") ) { %> 
    <!-- 썸머노트 에디터 -->
    <script src="/js/summernote/summernote-lite.js"></script>
	<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
	<script src="/js/summernote/lang/summernote-ja-JP.js"></script>
	<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
	<%} %>
    <!--파비콘-->
    <link rel="icon" type="/image/x-icon" href="img/favicon_io/favicon.ico" />
    <!-- 폰트어썸 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <!--애니메이션 https://animate.style/-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
     <% if (this.getClass().getSimpleName().replaceAll("_", ".").equals("start.jsp")) { %> 
    <!-- 지도API -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=87p51rsq4y"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a64aa7a78cd30d3f2bc2538a3944e8a&libraries=services"></script>
    <%} %>
    <!-- chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
    <!--css-->
    <link rel="stylesheet" href="/css/common.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/footer.css" />
    <link rel="stylesheet" href="/css/home.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <link rel="stylesheet" href="/css/start.css">
    <link rel="stylesheet" href="/css/board.css">
    <link rel="stylesheet" href="/css/myPage.css" />
    <link rel="stylesheet" href="/css/adminPage.css" />
    <link rel="stylesheet" href="/css/loading.css" />
  </head>
  
  <body>
    <!-- header start-->
    <header>
      <div id="header-inner">
          <div class="logo" onclick="javascript:location.href='/index.jsp'"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO" id="logo-image"></i>&nbsp;<span id="logo-txt">AVOCADO</span></div>
        <nav id="menu">
        <%
        if (this.getClass().getSimpleName().replaceAll("_", ".").equals("index.jsp")) { %> 
        	 <div class="dropdown">
             <a href="#이용방법">
               <button class="dropbtn"><i class="em em-beginner" aria-role="presentation" aria-label="JAPANESE SYMBOL FOR BEGINNER"></i>&nbsp;&nbsp;이용 방법</button></a>
           </div>
           <div class="dropdown">
             <a href="#안전수칙">
               <button class="dropbtn"><i class="em em-female-construction-worker" aria-role="presentation" aria-label=""></i>&nbsp;&nbsp;안전 수칙</button></a>
           </div>
        <%} %>
       <%
         if (this.getClass().getSimpleName().replaceAll("_", ".").equals("start.jsp")) { %> 
        <div class="dropdown" >
        <input type="text" id="map_search_input" placeholder="지역을 검색해보세요!" class="dropbtn">
        </div>
        <div class="dropdown" >
            <button class="dropbtn" id="map_search_button" title="검색"><i class="em em-mag header_icon" aria-role="presentation" aria-label="LEFT-POINTING MAGNIFYING GLASS"></i></button>
        </div>
        <div class="dropdown" >
            <button class="dropbtn" id="my_location" title="현재 위치"><i class="em em-round_pushpin header_icon" aria-role="presentation" aria-label="ROUND PUSHPIN"></i></button>
        </div>
         <%} %>
          <div class="dropdown">
            <a href="/board/freeboard/freeboardList.jsp"><button class="dropbtn"><i class="em em-left_speech_bubble" aria-role="presentation" aria-label=""></i>&nbsp;&nbsp;게시판</button></a>
            <div class="dropdown-content">
              <a href="/board/freeboard/freeboardList.jsp">자유게시판</a>
              <a href="/board/qna/qnaList.jsp">문의하기</a>
              <a href="/board/faq/faqList.jsp">자주묻는질문</a>
              <!-- <a href="/Devinfo">개발정보</a> -->
            </div>
          </div>
          <%
         if (!this.getClass().getSimpleName().replaceAll("_", ".").equals("start.jsp")) { %> 
          <div class="dropdown">
            <button onclick="goStart()" class="dropbtn"><i class="em em-rocket" aria-role="presentation" aria-label="ROCKET"></i>&nbsp;&nbsp;출발하기</button>
          </div>
           <%} %>
          <%if (sessionName.equals("")) {%>
          <div class="dropdown">
            <a href="/member/login.jsp"><button class="dropbtn-login"><i class="em em-closed_lock_with_key" aria-role="presentation" aria-label="CLOSED LOCK WITH KEY"></i>&nbsp;&nbsp;로그인</button></a>
          </div>
          <%} else { %>
	          <% if (sessionLevel.equals("top")) {%>
	           <div class="dropdown">
	            <a href="/member/admin/adminPage.jsp"><button class="dropbtn-half" title="관리자페이지"><i class="em em-hammer_and_wrench" aria-role="presentation" aria-label=""></i></button></a>
	          </div>
	           <%}%>
          <div class="dropdown">
            <a href="/member/myPage/myPage.jsp"><button class="dropbtn-half" title="<%=sessionName%>님 마이페이지"><i class="em em-bust_in_silhouette" aria-role="presentation" aria-label="BUST IN SILHOUETTE"></i></button></a>
          </div>
            <div class="dropdown">
            <button onclick="goLogout()" class="dropbtn-half" title="로그아웃"><i class="em em-unlock" aria-role="presentation" aria-label="OPEN LOCK"></i></button>
          </div>
          <% } %>
          <script type="text/javascript">
          function goLogout() {
				if (confirm("로그아웃 하시겠습니까?")) {
					location.href = '/member/DBLogout.jsp';
				} else {
					return;
				}
			}
          
          function goStart() {
				<% if (sessionEmail == "") {%>
					alert("로그인 후 이용가능합니다.");
					location.href= '/member/login.jsp';
				<% } else { %>
					location.href= '/start.jsp';
				<% } %>
			}
          </script>
        </nav>
      </div>
    </header>
    
    
    