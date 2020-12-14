<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDao, dto.MemberDto, common.*"%>

<!DOCTYPE html>
<html lang="kr">
  <%@ include file="/common/header.jsp" %>
    <!-- header end-->
    <main>
      <section class="login-main-section" style="background-color: #f1f8e9">
        <div class="login-main-content">
          <form name="login">
            <div class="login-box animate__animated animate__fadeIn">
              <span class="login-title">AVOCADO</span>
              <div class="login-id">
                <span class="login-icon"><i class="em em-email" aria-role="presentation" aria-label="ENVELOPE"></i></span>
                <input type="email" placeholder="E-mail" id="input-id" name = "t_email" />
              </div>
              <div class="login-pw">
                <span class="login-icon"><i class="em em-old_key" aria-role="presentation" aria-label=""></i></span>
                <input type="password" placeholder="Password" id="input-pw" name = "t_password" />
              </div>
              <div class="login-btn">
                <button type="button" class="login-btn-login" onclick="goLogin()">로그인</button>
                <button type="button" class="login-btn-login" onclick="location.href ='/member/register.jsp'">새로운 계정 만들기</button>
              </div>
            </div>
          </form>
        </div>
      </section>
        <script type="text/javascript">
		  function goLogin() {
			  login.method = "post";
			  login.action = "/member/DBLogin.jsp";
			  login.submit();
			}
  </script>
    </main>
    <!-- footer start-->
 		<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>
