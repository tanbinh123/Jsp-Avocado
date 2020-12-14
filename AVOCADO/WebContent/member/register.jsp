<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDao, dto.MemberDto, common.*"%>
<%
	MemberDao dao = new MemberDao();
%>
<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp"%>
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
							type="email" placeholder="E-mail" id="input-id" name="t_email"
							required autofocus/>
					</div>
					<div class="login-name">
						<span class="login-icon"><i class="em em-memo"
							aria-role="presentation" aria-label="MEMO"></i></span> <input
							type="text" placeholder="Name" id="input-name" name="t_name"
							required />
					</div>
					<div class="login-pw">
						<span class="login-icon"><i class="em em-key"
							aria-role="presentation" aria-label="KEY"></i></span> <input
							type="password" placeholder="Password" id="input-pw"
							name="t_password" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}"/>
					</div>
					<p class="passwordTip">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>
					<div class="login-pw">
						<span class="login-icon"><i
							class="em em-closed_lock_with_key" aria-role="presentation"
							aria-label="CLOSED LOCK WITH KEY"></i></span> <input type="password"
							placeholder="Password confirm" id="input-pw-check"
							name="t_passwordCheck" required />
					</div>
					<p class="passwordCheckTip"></p>
					<div class="login-phone">
						<span class="login-icon"><i class="em em-iphone"
							aria-role="presentation" aria-label="MOBILE PHONE"></i></span> <input
							type="tel" placeholder="Phone number" id="input-phone"
							name="t_phoneNumber" required pattern="(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})"/>
					</div>
					<p class="phoneTip">01012345678 형식으로 입력해주세요</p>
					<div class="login-btn">
						<button class="login-btn-login" onclick="goRegister()">가입하기</button>
						<button type="button" class="login-btn-login" onclick="goBack()">뒤로</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<script type="text/javascript">
	
	//비밀번호 일치 체크
		$(function(){
			$('#input-pw').keyup(function() {
			      $('.passwordCheckTip').html('');
			    });
			
		    $('#input-pw-check').keyup(function() {
		        if ($('#input-pw').val() != $('#input-pw-check').val()) {
			        $('.passwordCheckTip').css('display', 'block');
			        $('.passwordCheckTip').css('color', '#f82a2aa3');
			        $('.passwordCheckTip').html('비밀번호 일치하지 않음');
		        } else {
			        $('.passwordCheckTip').css('display', 'block');
			        $('.passwordCheckTip').css('color', '#199894b3');
			        $('.passwordCheckTip').html('비밀번호 일치함');
		        }
		        $('#input-pw-check').blur(function(){
					  $('.passwordCheckTip').css('display', 'none');
				 });
	
		    });
		});
	
		//핸드폰 형식 안내
		$(function(){
			  $('#input-phone').focus(function(){
				  $('.phoneTip').css('display', 'block');
			  });
			  $('#input-phone').blur(function(){
				  $('.phoneTip').css('display', 'none');
			  });
			});
		
		//비밀번호 형식 안내
		$(function(){
			$('#input-pw').focus(function(){
				  $('.passwordTip').css('display', 'block');
			  });
			$('#input-pw').blur(function(){
				  $('.passwordTip').css('display', 'none');
			  });
			});
		
		function goRegister() {
			var passwordCheck = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}/;

			if (!checkEmpty(register.t_email, " 이메일을 입력해주세요! ")) {
				return;
			}
			if (!checkEmpty(register.t_name, " 이름을 입력해주세요! ")) {
				return;
			}
			if (!checkEmpty(register.t_password, " 비밀번호를 입력해주세요! ")) {
				return;
			}
			if (!checkEmpty(register.t_passwordCheck, " 비밀번호를 한번 더 입력해주세요! ")) {
				return;
			}
			if (!checkEmpty(register.t_phoneNumber, " 전화번호를 입력해주세요! ")) {
				return;
			}

			if (register.t_password.value != register.t_passwordCheck.value) {
				alert('비밀번호가 맞지 않습니다.');
				register.t_phoneNumber.focus();
				return;
			}
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
<%@ include file="/common/footer.jsp"%>
<!-- footer end-->
</body>
</html>
