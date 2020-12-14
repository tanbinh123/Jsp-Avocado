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
    <!--css-->
    <link rel="stylesheet" href="/css/common.css" />
    <link rel="stylesheet" href="/css/header.css" />
    <link rel="stylesheet" href="/css/footer.css" />
    <link rel="stylesheet" href="/css/home.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <!--이모지-->
    <link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet" />
    <!--파비콘-->
    <link rel="icon" type="/image/x-icon" href="img/favicon_io/favicon.ico" />
    <!--애니메이션 https://animate.style/-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=87p51rsq4y"></script>
    <!-- js -->
    <script type="text/javascript" src="/js/commonUtil.js"></script>
  </head>
  
  <body>
    <!-- header start-->
    <header>
      <div id="header-inner">
        <a href="/index.jsp">
          <div class="logo"><i class="em em-avocado" aria-role="presentation" aria-label="AVOCADO" id="logo-image"></i>&nbsp;<span id="logo-txt">AVOCADO</span></div></a
        >
        <nav id="menu">
        <%
        if (this.getClass().getSimpleName().replaceAll("_", ".").equals("index.jsp")) { %> 
        	 <div class="dropdown">
             <a href="#이용방법">
               <button class="dropbtn"><i class="em em-beginner" aria-role="presentation" aria-label="JAPANESE SYMBOL FOR BEGINNER"></i>&nbsp;&nbsp;이용 방법</button></a
             >
           </div>
           <div class="dropdown">
             <a href="#안전수칙">
               <button class="dropbtn"><i class="em em-female-construction-worker" aria-role="presentation" aria-label=""></i>&nbsp;&nbsp;안전 수칙</button></a
             >
           </div>
        <%} %>
         
          <div class="dropdown">
            <button class="dropbtn"><i class="em em-left_speech_bubble" aria-role="presentation" aria-label=""></i>&nbsp;&nbsp;게시판</button>
            <div class="dropdown-content">
              <a href="/board/freeboard/freeboard_list.jsp">자유게시판</a>
              <a href="/board/qna/qna_list.jsp">문의하기</a>
              <a href="/board/faq/faq_list.jsp">자주묻는질문</a>
              <a href="/Devinfo">개발정보</a>
            </div>
          </div>
          <div class="dropdown">
            <a href="/start.jsp"
              ><button class="dropbtn"><i class="em em-rocket" aria-role="presentation" aria-label="ROCKET"></i>&nbsp;&nbsp;출발하기</button></a
            >
          </div>
          <%if (sessionName.equals("")) {%>
          <div class="dropdown">
            <a href="/member/login.jsp"
              ><button class="dropbtn-login"><i class="em em-closed_lock_with_key" aria-role="presentation" aria-label="CLOSED LOCK WITH KEY"></i>&nbsp;&nbsp;로그인</button></a
            >
          </div>
          <%} else { %>
          <div class="dropdown">
            <a href="/member/mypage.jsp"
              ><button class="dropbtn-half" title="<%=sessionName%>님 마이페이지"><i class="em em-bust_in_silhouette" aria-role="presentation" aria-label="BUST IN SILHOUETTE"></i></button></a
            >
          </div>
            <div class="dropdown">
            <button onclick="goLogout()" class="dropbtn-half" title="로그아웃"><i class="em em-unlock" aria-role="presentation" aria-label="OPEN LOCK"></i></button>
          </div>
          
          <script type="text/javascript">
          function goLogout() {
			if (confirm("로그아웃 하시겠습니까?")) {
				location.href = '/member/DBLogout.jsp';
			} else {
				return;
			}
			}
          </script>
          
          <% } %>
        </nav>
      </div>
    </header>
    
    
    