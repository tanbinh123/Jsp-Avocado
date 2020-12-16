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
			<form name="register" onsubmit="return false">
				<div class="register-box animate__animated animate__fadeIn">
					<span class="login-title">AVOCADO</span>
					<div class="login-id">
						<span class="login-icon"><i class="em em-email"
							aria-role="presentation" aria-label="ENVELOPE"></i></span> <input
							type="email" placeholder="E-mail" id="input-id"
							name="t_email_original" required="required" autofocus />
					</div>
					<input type="hidden" name="t_email">
					<p class="emailTip"></p>

					<div class="login-name">
						<span class="login-icon"><i class="em em-memo"
							aria-role="presentation" aria-label="MEMO"></i></span> <input
							type="text" placeholder="Name" id="input-name" name="t_name"
							required="required" />
					</div>

					<div class="login-pw">
						<span class="login-icon"><i class="em em-key"
							aria-role="presentation" aria-label="KEY"></i></span> <input
							type="password" placeholder="Password" id="input-pw"
							name="t_password" required="required" />
					</div>
					<p class="passwordTip">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</p>

					<div class="login-pw">
						<span class="login-icon"><i
							class="em em-closed_lock_with_key" aria-role="presentation"
							aria-label="CLOSED LOCK WITH KEY"></i></span> <input type="password"
							placeholder="Password confirm" id="input-pw-check"
							name="t_passwordCheck" required="required" />
					</div>
					<p class="passwordCheckTip"></p>

					<div class="login-phone">
						<span class="login-icon"><i class="em em-iphone"
							aria-role="presentation" aria-label="MOBILE PHONE"></i></span> <input
							type="tel" placeholder="Phone number" id="input-phone"
							name="t_phoneNumber" required="required" />
					</div>
					<p class="phoneTip">숫자만 입력해주세요</p>

					<div class="login-btn">
						<button type="button" class="login-btn-login"
							onclick="goRegister()">가입하기</button>
						<button type="button" class="login-btn-login" onclick="goBack()">로그인 페이지로</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<script type="text/javascript">
	// 유효성 판별 변수을 지정
	  var validEmail = true;
	  var validPassword = true;
	  var validPhoneNumber = true;
	  
	  
	//이메일 체크  
	//<![CDATA[
	$(document).ready(function(){
		$('#input-id').keyup(function() {
			var email = register.t_email_original.value;
			
			$.ajax({		
				type:"post",
				url:"memberCheckEmailAjax.jsp",
				data:"t_email="+email,
				dataType:"text",
				error :function(){
					alert("통신실패~");
				},
				success:function(data){
					//alert("넘어온 값:==="+data+"====");
					$(".emailTip").html(data);
					if (/^[A-Za-z0-9_.]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/.test(email)){
						if($.trim(data) =="사용가능한 이메일 입니다."){
							 $('.emailTip').css('display', 'block');
						     $('.emailTip').css('color', '#199894b3');
						     $('.emailTip').html('사용가능한 이메일 입니다.');
							register.t_email.value = email;
							validEmail = true;
						} else {
							$('.emailTip').css('display', 'block');
					        $('.emailTip').css('color', '#f82a2aa3');
					        $('.emailTip').html('중복된 이메일입니다.');
							register.t_email.value = "";
							validEmail = false;
						}
					} else {
						$('.emailTip').css('display', 'block');
				        $('.emailTip').css('color', '#f82a2aa3');
				        $('.emailTip').html('이메일 형식에 맞춰주세요.');
						register.t_email.value = "";
						validEmail = false;
					}
					
				}
				
			});
			
			$('#input-id').blur(function(){
				  $('.emailTip').css('display', 'none');
			 });
			
		});		
	});
//]]>
	
	
	//비밀번호 일치 체크
		$(function(){
			$('#input-pw').keyup(function() {
			      $('.passwordCheckTip').html('');
			    });
			$('#input-pw-check').keyup(function() {
			if(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}/.test(register.t_password.value)) {
		        if ($('#input-pw').val() != $('#input-pw-check').val()) {
			        $('.passwordCheckTip').css('display', 'block');
			        $('.passwordCheckTip').css('color', '#f82a2aa3');
			        $('.passwordCheckTip').html('비밀번호 일치하지 않음');
			        validPassword = false;
		        } else {
			        $('.passwordCheckTip').css('display', 'block');
			        $('.passwordCheckTip').css('color', '#199894b3');
			        $('.passwordCheckTip').html('비밀번호 일치함');
			        validPassword = true;
		        }
		    } else {
		        $('.passwordCheckTip').css('display', 'block');
		        $('.passwordCheckTip').css('color', '#f82a2aa3');
		        $('.passwordCheckTip').html('비밀번호 형식에 맞춰주세요.');
		        validPassword = false;
	        }
		    
		        $('#input-pw-check').blur(function(){
					  $('.passwordCheckTip').css('display', 'none');
				 });
	
		    });
		});
	
	//핸드폰 체크
	$(document).on("keyup", "#input-phone", function() { $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); });
		
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
				if (!checkEmpty(register.t_email_original, " 이메일을 입력해주세요! ")) {
					return false;
				}
				if (!checkEmpty(register.t_name, " 이름을 입력해주세요! ")) {
					return false;
				}
				if (!checkEmpty(register.t_password, " 비밀번호를 입력해주세요! ")) {
					return false;
				}
				if (!checkEmpty(register.t_passwordCheck, " 비밀번호를 한번 더 입력해주세요! ")) {
					return false;
				}
				if (!checkEmpty(register.t_phoneNumber, " 전화번호를 입력해주세요! ")) {
					return false;
				}
				
				if (register.t_name.value.length > 8) {
					register.t_name.focus();
					alert('이름은 8글자까지만 입력 가능합니다!');
					return false;
				}
				
				if (register.t_password.value.length < 8) {
					register.t_password.focus();
					alert('비밀번호는 8글자 이상으로 입력해주세요!');
					return false;
				}
				
				if (register.t_password.value.length > 16) {
					register.t_password.focus();
					alert('비밀번호는 16글자까지만 입력 가능합니다!');
					return false;
				}
				
				if (register.t_phoneNumber.value.length > 13) {
					register.t_phoneNumber.focus();
					alert('핸드폰 번호는 11글자로 입력 해주세요!');
					return false;
				}
				
				if (register.t_password.value != register.t_passwordCheck.value) {
					alert('비밀번호가 일치하지 않습니다.');
					register.t_passwordCheck.focus();
					return false;
				}
				
				if (validEmail == true && validPassword == true && validPhoneNumber == true ) {
					register.method = "post";
					register.action = "/member/DBRegister.jsp";
					register.submit();
				} else if (validEmail == false && validPassword == true && validPhoneNumber == true ) {
					register.t_email_original.focus();
					alert('이메일을 다시 확인해주세요.');
				} else if (validEmail == true && validPassword == false && validPhoneNumber == true) {
					alert('비밀번호를 다시 확인해주세요.');
					register.t_password.focus();
				}
		}

		function goBack() {
			result = confirm("로그인 페이지로 가시겠습니까?");
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
