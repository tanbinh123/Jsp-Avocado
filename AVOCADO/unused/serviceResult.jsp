<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*, dto.*, common.*"%>
<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/sessionInfo.jsp" %>
<link href="https://emoji-css.afeld.me/emoji.css" rel="stylesheet" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/start.css">
<!-- header end-->
<main>

			<% if (!sessionEmail.equals("")) {%>
				

					<div class="map-infoPanel-used">
						<p class="map-infoPanel-used-text">
							<i class="em em-avocado" aria-role="presentation"
								aria-label="AVOCADO"></i>&nbsp;곽두팔님 이용해주셔서 감사합니다 :)
						</p>
						<p class="map-infoPanel-used-text">
							<i class="em em-first_place_medal" aria-role="presentation"
								aria-label="FIRST PLACE MEDAL"></i>&nbsp;등급 : 골드
						</p>
						<p class="map-infoPanel-used-text">
							<i class="em em-clock7" aria-role="presentation"
								aria-label="CLOCK FACE SEVEN OCLOCK"></i>&nbsp;총 이용 시간 : 27분
						</p>
						<p class="map-infoPanel-used-text">
							<i class="em em-moneybag" aria-role="presentation"
								aria-label="MONEY BAG"></i>&nbsp;총 이용 요금 : 12,400원
						</p>
						<button class="map-infoPanel-used-button">
							<i class="em em-white_check_mark" aria-role="presentation"
								aria-label="WHITE HEAVY CHECK MARK"></i>창닫기
						</button>
					</div>
				
			<% } else {%>
			<h1>401 ERROR</h1>
			<h1>로그인이 필요한 페이지입니다.</h1>
			<% }%>

</main>
</body>

</html>