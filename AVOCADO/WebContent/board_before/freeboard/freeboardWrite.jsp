<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.commonUtil"%>
<!DOCTYPE html>
<html lang="kr">
<%@ include file="/common/header.jsp" %>
    <!-- header end-->
    
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			toolbar: [
				['style', ['style']],
				['fontsize', ['fontsize']],
				['font', ['bold', 'italic', 'underline', 'clear']],
				['fontname', ['fontname']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['height', ['height']],
				['view', ['codeview']]
			],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica Neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Nanum Gothic', 'Malgun Gothic', 'Noto Sans KR', 'Apple SD Gothic Neo'],
			fontNamesIgnoreCheck: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica Neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Nanum Gothic', 'Malgun Gothic', 'Noto Sans KR', 'Apple SD Gothic Neo'],
			fontSizes: ['8','9','10','11','12','13','14','15','16','17','18','19','20','24','30','36','48','64','82','150'],
			  height: 510,                 // 에디터 높이
			  minHeight: 510,             // 최소 높이
			  maxHeight: 510,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  disableDragAndDrop: true,			//드래그앤드롭 해제
			  shortcuts: false,					//단축키막기
			  placeholder: ''	//placeholder 설정
	          
		});
	});

	function goSave(){
		if (freeboard.t_content.value.length > 2000) {
			alert(" 내용은 2000자까지만 입력가능합니다. ");
			freeboard.t_content.focus();
			return;
		}
		if (freeboard.t_title.value=="") {
			alert(" 제목을 입력해주세요. ");
			freeboard.t_title.focus();
			return;
		}	
		if (freeboard.t_content.value=="") {
			alert(" 내용을 입력해주세요. ");
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
              <a href="freeboardList.jsp" class="board-kind-title">자유게시판</a>
            </div>
            <form name="freeboard">
	            <div class="board-box">
	              <div class="board-box-write-top">
	                <div class="board-box-write-th">제목</div>
	                <div class="board-box-write-td"><input type="text" name="t_title" maxlength="30"/></div>
	              </div>
	              <div class="board-box-write-middle">
	                <div class="board-box-write-th">내용</div>
	                <div class="board-box-write-td"><textarea name="t_content" id="summernote"></textarea></div>
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

