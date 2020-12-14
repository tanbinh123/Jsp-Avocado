<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDao, dto.MemberDto, common.*"%>
<%
  MemberDao dao = new MemberDao();
%>
<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp" %>
	<!-- header end-->
	<main>
		<section class="login-main-section" style="background-color: #f1f8e9">
			<div class="login-main-content">
				<form name="register">
					<div class="register-box animate__animated animate__fadeIn">
						<span class="login-title">AVOCADO</span>
						<div class="login-id">
							<span class="login-icon"><i class="em em-email"
								aria-role="presentation" aria-label="ENVELOPE"></i></span> <input
								type="email" placeholder="E-mail" id="input-id" name="t_email" />
						</div>
						<div class="login-name">
							<span class="login-icon"><i class="em em-memo"
								aria-role="presentation" aria-label="MEMO"></i></span> <input
								type="text" placeholder="Name" id="input-name" name="t_name" />
						</div>
						<div class="login-pw">
							<span class="login-icon"><i class="em em-key"
								aria-role="presentation" aria-label="KEY"></i></span> <input
								type="password" placeholder="Password" id="input-pw"
								name="t_password" />
						</div>
						<div class="login-pw">
							<span class="login-icon"><i
								class="em em-closed_lock_with_key" aria-role="presentation"
								aria-label="CLOSED LOCK WITH KEY"></i></span> <input type="password"
								placeholder="Password confirm" id="input-pw"
								name="t_passwordCheck" />
						</div>
						<div class="login-phone">
							<span class="login-icon"><i class="em em-iphone"
								aria-role="presentation" aria-label="MOBILE PHONE"></i></span> <input
								type="text" placeholder="Phone number" id="input-phone"
								name="t_phoneNumber" />
						</div>
						<div class="login-btn">
							<button class="login-btn-login" onclick="goRegister()">가입하기</button>
							<button type="button" class="login-btn-login" onclick="goBack()">뒤로</button>
						</div>
					</div>
				</form>
			</div>
		</section>
		<script type="application/javascript">
		
		function goRegister() {
			register.method = "post";
			register.action = "/member/DBRegister.jsp";
			register.submit();
		}
        function goBack() {
          result = confirm("뒤로 돌아가시겠습니까?");
          if (result == true) {
            location.href = "login.jsp";
          }
        }
		</script>
	</main>
	<!-- footer start-->
		<%@ include file="/common/footer.jsp" %>
	<!-- footer end-->
</body>
</html>
