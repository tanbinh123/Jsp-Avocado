<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.commonUtil"%>
<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp" %>
    <!-- header end-->
    
<script type="text/javascript">
	function goSave(){
		if(freeboard.t_title.value==""){
			alert(" 제목 입력! ");
			freeboard.t_title.focus();
			return;
		}	
		if(freeboard.t_content.value==""){
			alert(" 내용 입력! ");
			freeboard.t_content.focus();
			return;
		}	
		
		freeboard.method="post";
		freeboard.action="DBFreeboardSave.jsp";
		freeboard.submit();
	}
</script>	   
    
    <main>
      <section class="board-main-section" style="background-color: #f1f8e9">
        <div class="board-main-content">
          <div class="board-container">
            <div class="board-kind">
              <a href="freeboard_list.html" class="board-kind-title">자유게시판</a>
            </div>
            <form name="freeboard">
	            <div class="board-box">
	              <div class="board-box-write-top">
	                <div class="board-box-write-th">제목</div>
	                <div class="board-box-write-td"><input type="text" name="t_title" /></div>
	              </div>
	              <div class="board-box-write-middle">
	                <div class="board-box-write-th">내용</div>
	                <div class="board-box-write-td"><textarea name="t_content"></textarea></div>
	              </div>
	              <div class="board-box-write-bottom">
	                <div class="board-box-write-bottom-left">
	                  <div class="board-box-write-th-bottom">작성자</div>
	                  <div class="board-box-write-td-bottom"><input type="text" value="<%=sessionName %>" readonly/>
	                  <input type="hidden" name="t_reg_name" value="<%=sessionEmail %>"/></div>
	                </div>
	                <div class="board-box-write-bottom-right">
	                  <div class="board-box-write-th-bottom">작성일</div>
	                  <div class="board-box-write-td-bottom"><input type="text" name="t_reg_date" value="<%=commonUtil.getTodayHHmmss() %>" readonly/>
	                  </div>
	                </div>
	              </div>
	            </div>
            </form>

            <div class="board-bottom">
              <div class="board-bottom-blank"></div>
              <div>
                <button type="button" onclick="history.back()" class="board-write-button">뒤로</button>
                <button class="board-write-button" onclick="goSave()">등록</button>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
    <!-- footer start-->
		<%@ include file="/common/footer.jsp" %>
    <!-- footer end-->
  </body>
</html>

