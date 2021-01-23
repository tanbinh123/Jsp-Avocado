<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.FreeboardDao,dto.FreeboardDto,common.commonUtil" %>
<%
  FreeboardDao dao = new FreeboardDao();
	String no = request.getParameter("t_no");
	FreeboardDto dto = dao.getFreeboardView(no);
%>
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
		  height: 425,                 // 에디터 높이
		  minHeight: 425,             // 최소 높이
		  maxHeight: 425,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  disableDragAndDrop: true,			//드래그앤드롭 해제
		  shortcuts: false,					//단축키막기
		  placeholder: ''	//placeholder 설정
          
	});
});
	function goUpdate(){
		if(!checkEmpty(freeboard.t_title," 제목 입력! ")) return;
		if(!checkEmpty(freeboard.t_content," 내용 입력! ")) return;
		
		if (freeboard.t_content.value.length > 2000) {
			alert(" 내용은 2000자까지만 입력가능합니다. ");
			freeboard.t_content.focus();
			return;
		}
		
		freeboard.method="post";
		freeboard.action="DBFreeboardUpdate.jsp";
		freeboard.submit();
		
	}
    
</script>
    <main>
      <section class="board-main-section" style="background-color: #f1f8e9">
        <div class="board-main-content">
          <div class="board-container">
            <div class="board-kind">
              <a href="/board/freeboard/freeboardList.jsp" class="board-kind-title">자유게시판</a>
            </div>
        <form name="freeboard" enctype="multipart/form-data">
        	<input type="hidden" name="t_no" value="<%=no %>">
            <div class="board-box">
              <div class="board-box-write-top">
                <div class="board-box-write-th">제목</div>
                <div class="board-box-write-td"><input type="text" name="t_title" value="<%=dto.getFreeboard_title() %>" maxlength="30"/></div>
              </div>
              <div class="board-box-write-middle">
                <div class="board-box-write-th">내용</div>
                <div class="board-box-write-td">
                  <textarea name="t_content" id="summernote"><%=dto.getFreeboard_content() %></textarea>
                </div>
              </div>
              <div class="board-box-write-middle-attach">
	                <div class="board-box-write-th">첨부파일</div>
	                <div class="board-box-write-td-attach">
	                <%  if (dto.getFreeboard_attach() != null) { %>
						<%=dto.getFreeboard_attach()%> 
						삭제 <input class="board-box-write-middle-attach-checkbox" type="checkbox" name="t_del_attach" value="<%=dto.getFreeboard_attach()%>"><br>
					<%}%>	
						<input type="file"  name="t_attach">
						<input type="hidden" name="t_ori_attach" value="<%=commonUtil.checkNull(dto.getFreeboard_attach())%>">
	                </div>
	          </div> 
              <div class="board-box-write-bottom">
                <div class="board-box-write-bottom-left">
                  <div class="board-box-write-th-bottom">작성자</div>
                  <div class="board-box-write-td-bottom"><input type="text" name="t_reg_name" value="<%=dto.getFreeboard_regName() %>" readonly="readonly"/></div>
                </div>
                <div class="board-box-write-bottom-right">
                  <div class="board-box-write-th-bottom">작성일</div>
                  <div class="board-box-write-td-bottom"><input type="text" name="t_reg_date" value="<%=dto.getFreeboard_regDate() %>" readonly="readonly"/></div>
                </div>
              </div>
            </div>
        </form>

            <div class="board-bottom">
              <div class="board-bottom-blank"></div>
              <div>
                <button type="button" onclick="history.back()" class="board-write-button">뒤로</button>
                <button class="board-write-button" onclick="goUpdate()">등록</button>
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
