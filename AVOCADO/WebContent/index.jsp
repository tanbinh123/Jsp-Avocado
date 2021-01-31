<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDao, dto.MemberDto, common.*"%>
<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp"%>
<!-- header end-->
<main>
	<!-- section01 start-->
	<section class="home-section-top">
		<div class="home-section-content">
			<div>
				<div class="home-section-content-title">
					<span>당신 근처의 공유 킥보드</span><br />
					<span class="home-section-content-title-sub">아보카도!</span>
				</div>
				<p class="home-section-content-text">
					가까운 곳부터 멀리까지, 아보카도와 함께 해요.<br />편한 당신의 라이프스타일을 위해.
				</p>
			</div>
			<div
				class="home-section-content-img animate__animated animate__fadeInRightBig">
				<img src="img/main-top-img.png" alt="" />
			</div>
		</div>
	</section>
	<!-- section01 end-->
	<!-- section02 start-->
	<section class="home-section">
		<div class="home-section-content">
			<div class="home-section-content-container">
				<div class="home-section-content-box">
					<div>
						<img src="img/box-img1.png" alt="" style="width: 270px" />
					</div>
					<div class="home-section-content-box-txt">
						<p class="home-section-content-box-title">
							함께 하면<br /> 어디든 이동할 수 있어요
						</p>
						<br />
						<p>나와 가장 가까운 곳에서 원하는 이동을 하게 해주는 맞춤형 이동 서비스를 제공합니다.</p>
					</div>
				</div>

				<div class="home-section-content-box">
					<div>
						<img src="img/box-img2.png" alt="" style="width: 270px" />
					</div>
					<div class="home-section-content-box-txt">
						<p class="home-section-content-box-title">
							우리 사이를<br /> 더 가깝게 만들어요
						</p>
						<br />
						<p>우리 모두의 더 나은 이동 생활을 위해 참여와 소통이 강화된 공유 서비스를 제공합니다.</p>
					</div>
				</div>
				<div class="home-section-content-box">
					<div>
						<img src="img/box-img3.png" alt="" style="width: 270px" />
					</div>
					<div class="home-section-content-box-txt">
						<p class="home-section-content-box-title">
							세상을 더<br /> 재미있게 만들어요
						</p>
						<br />
						<p>평범한 일상 속 새로운 재미를 위해 게이미피케이션을 비롯한 다양한 변화를 추구합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- section02 end-->
	<span class="anchor" id="이용방법"></span>
	<!-- section03 start-->
	<section class="home-section" style="background-color: floralwhite">
		<div class="home-section-content">
			<div class="how-to-use-container">
				<div class="how-to-use-title">
					<h1>쉽고 편리한 아보카도!</h1>
				</div>
				<br />
				<ul>
					<li>
						<p class="how-to-use-txt">가입 하고,</p>
						<p>회원 가입 후에 본인 인증을 해주세요.</p> <br />
					</li>
					<li>
						<p class="how-to-use-txt">헬멧 쓰고,</p>
						<p>안전을 위해서 보호장구를 착용해주세요.</p> <br />
					</li>
					<li>
						<p class="how-to-use-txt">킥보드를 찾고,</p>
						<p>이용 금액을 충전한 다음, 내 주변에 있는 아보카도를 찾아보세요.</p> <br />
					</li>
					<li>
						<p class="how-to-use-txt">킥보드를 타고,</p>
						<p>QR코드 스캔 또는 일련번호를 입력하여 잠금장치를 해제 후 주행해보세요.</p> <br />
					</li>
					<li>
						<p class="how-to-use-txt">반납하면, 끝.</p>
						<p>안전한 장소에 킥보드를 주차하고 사용 종료를 누르면 끝. 참 쉽죠?</p> <br />
					</li>
				</ul>
			</div>
		</div>
	</section>
	<!-- section03 end-->
	<span class="anchor" id="안전수칙"></span>
	<!-- section04 start-->
	<section class="home-section">
		<div class="home-section-content">
			<div class="for-safe-title">
				<h1>아보카도와 함께 안전 주행해요!</h1>
			</div>
			<div class="for-safe-container">
				<div class="for-safe-box">
					<div class="for-safe-box-img">
						<img src="img/safe/1.png" alt="" />
					</div>
					<div class="for-safe-box-txt">
						<p class="for-safe-box-txt-title">헬멧 착용 필수!</p>
						<p class="for-safe-box-txt-content">안전을 위해서 헬멧을 꼭 착용해 주세요.</p>
					</div>
				</div>
				<div class="for-safe-box">
					<div class="for-safe-box-img">
						<img src="img/safe/2.png" alt="" />
					</div>
					<div class="for-safe-box-txt">
						<p class="for-safe-box-txt-title">음주 후 이용 금지!</p>
						<p class="for-safe-box-txt-content">
							음주 후 탑승은 법률에 의해<br />처벌 대상에 해당돼요.
						</p>
					</div>
				</div>
				<div class="for-safe-box">
					<div class="for-safe-box-img">
						<img src="img/safe/3.png" alt="" />
					</div>
					<div class="for-safe-box-txt">
						<p class="for-safe-box-txt-title">인도 주행 금지!</p>
						<p class="for-safe-box-txt-content">
							보행자 우선 지역입니다.<br />킥보드는 주행하면 안 돼요!
						</p>
					</div>
				</div>
				<div class="for-safe-box">
					<div class="for-safe-box-img">
						<img src="img/safe/4.png" alt="" />
					</div>
					<div class="for-safe-box-txt">
						<p class="for-safe-box-txt-title">면허 취득 필수!</p>
						<p class="for-safe-box-txt-content">반드시 면허를 취득한 회원만 이용하세요.</p>
					</div>
				</div>
				<div class="for-safe-box">
					<div class="for-safe-box-img">
						<img src="img/safe/5.png" alt="" />
					</div>
					<div class="for-safe-box-txt">
						<p class="for-safe-box-txt-title">동반 탑승 금지!</p>
						<p class="for-safe-box-txt-content">
							2인 이상 탑승은 위험해요.<br />반드시 회원 본인만 탑승하세요.
						</p>
					</div>
				</div>
				<div class="for-safe-box">
					<div class="for-safe-box-img">
						<img src="img/safe/6.png" alt="" />
					</div>
					<div class="for-safe-box-txt">
						<p class="for-safe-box-txt-title">돌발 행동 금지!</p>
						<p class="for-safe-box-txt-content">
							갑작스러운 방향 전환, 급 감속,<br />정지를 하면 안 돼요!
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- section04 end-->
	<!-- section05 start-->
	<section class="home-section"
		style="background: #f8f9fa; height: 230px">
		<div class="home-section-content">
			<div class="faq-title">
				<h1>자주 묻는 질문</h1>
			</div>
			<!--https://theswing.co.kr/faq-->
			<div class="faq-box-container">
				<div class="faq-box">
					<a href="/Faq"><button class="faq-box-button">
							<p class="faq-box-txt-title">운영시간</p>
						</button></a>
				</div>
				<div class="faq-box">
					<a href="/Faq"><button class="faq-box-button">
							<p class="faq-box-txt-title">서비스 이용</p>
						</button></a>
				</div>
				<div class="faq-box">
					<a href="/Faq"><button class="faq-box-button">
							<p class="faq-box-txt-title">고장(장애)</p>
						</button></a>
				</div>
				<div class="faq-box">
					<a href="/Faq"><button class="faq-box-button">
							<p class="faq-box-txt-title">계정 관련</p>
						</button></a>
				</div>
				<div class="faq-box">
					<a href="/Faq"><button class="faq-box-button">
							<p class="faq-box-txt-title">결제 및 패널티</p>
						</button></a>
				</div>
				<div class="faq-box">
					<a href="/Faq"><button class="faq-box-button">
							<p class="faq-box-txt-title">주차</p>
						</button></a>
				</div>
			</div>
		</div>
	</section>
	<!-- section05 end-->
</main>
<!-- footer start-->
<%@ include file="/common/footer.jsp"%>
<!-- footer end-->
</body>
</html>
