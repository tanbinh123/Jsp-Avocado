<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.QnaDao,dto.QnaDto,java.util.*,common.Paging" %>
<%
  request.setCharacterEncoding("utf-8");
	QnaDao dao = new QnaDao();
	
	String select = request.getParameter("t_select");
	String search = request.getParameter("t_search");
	
	if(select == null){
		select = "qna_title";
		search ="";
		
	}
	if(select == "qna_regname"){
		
	}
	
	ArrayList<QnaDto> arr = dao.getQna(select,search);
	
	//*************page 시작**************/
	int	list_setup_count = 15;			// 한페이지에 출력될 List 수 

	String r_page = request.getParameter("r_page");
	if(r_page==null) r_page= "";
	int			current_page;					// 현재페이지 번호
	int			total_page;						// 총페이지 수
	int			total_count;					// 총레코드 수
	int			for_count;						
	int			p_no;
	int			v_count;
	int			a_count;
	String		url				= null;	

	// 조회된 건수 구하기  total_count : 설정
	if(arr == null) total_count =0;
	else total_count = arr.size(); 


	// 페이지번호가 없으면 1페이지로 간주
	if(r_page.equals("")) current_page = 1;
	else current_page = Integer.parseInt(r_page);
		
	for_count		= list_setup_count;
	p_no			= list_setup_count;				// 페이지수가 10
	total_page = total_count / list_setup_count;		// 전체페이지수 계산 (if 23개 게시물이면 2)
   
	if(current_page == 1) {
		v_count		= 0;
		a_count		= list_setup_count;
		for_count	= 0;
	} else{
		v_count		= 0;
		a_count		= p_no * current_page;
		for_count	= a_count - list_setup_count;
	}
	if(total_page * list_setup_count != total_count)   total_page = total_page +1;

//*************page 끝**************/
%>
<!DOCTYPE html>
<html lang="kr">

<%@ include file="/common/header.jsp" %>
	<!-- header end-->
	<script type="text/javascript">
	
		function goSearch(){
			qnaSearch.method="post";
			qnaSearch.action="/board/qna/qnaList.jsp";
			qnaSearch.submit();
		}
		function goView(num){
			qnaView.t_no.value = num;
			qnaView.method = "post";
			qnaView.action = "/board/qna/qnaView.jsp"
			qnaView.submit();
		}
		function goPage(pageNumber){
			pageForm.r_page.value = pageNumber;
			pageForm.method="post";
			pageForm.action="/board/qna/qnaList.jsp";
			pageForm.submit();
		}
		function goWrite() {
			<%if (!sessionEmail.equals("")) {%>
			location.href='/board/qna/qnaWrite.jsp';
			<%} else {%>
			alert('로그인 후 이용가능합니다.');
			location.href='/member/login.jsp';
			<%}%>
		}
	</script>
	<form name="pageForm">
			<input type="hidden" name="r_page">
			<input type="hidden" name="t_select" value="<%=select%>">
			<input type="hidden" name="t_search" value="<%=search%>">
	</form>
	<form name="qnaView">
		<input type="hidden" name="t_no">
	</form>
	<main>
   	   <section class="board-main-section" style="background-color: #f1f8e9;" >
	        <div class="board-main-content">
               <div class="board-container">
                   <div class="board-kind">
                       <a href="/board/qna/qnaList.jsp" class="board-kind-title">QnA</a>
                   </div>
                    <div class="board-box">
                      <div class="board-section board-th-container">
                           <div class="board-no board-th">
                                번호
                            </div>
                            <div class="board-title board-th">
                                제목
                            </div>
                            <div class="board-attach board-th">
                                첨부
                            </div>
                            <div class="board-reg_name board-th">
                                작성자
                            </div>
                            <div class="board-reg_date board-th">
                                작성일
                            </div>
                            <div class="board-hit board-th">
                                조회
                            </div>
                            <div class="board-recommend board-th">
                                공감
                            </div>
                        </div>
<%	if ( total_count > 0 ){
		for(int k = 0 ; k < total_count ; k++ )	{
			if(v_count == for_count){ 
%>		
                       <div class="board-section">
                           <div class="board-no">
                                <%=arr.get(k).getqna_no() %>
                            </div>
                            <div class="board-title" OnClick="javascript:goView('<%=arr.get(k).getqna_no() %>')">
                              	<%=arr.get(k).getqna_title() %>
                            </div>
                            <div class="board-attach">
                                <% if (arr.get(k).getqna_attach() != null ) {
                                  out.print("<i class='em em-floppy_disk' aria-role='presentation' aria-label='FLOPPY DISK'></i>");
                                  }else {
                                  out.print("  ");
                                  }%>
                                
                            </div>
                            <div class="board-reg_name">
                                <%=arr.get(k).getqna_regName() %>
                            </div>
                            <div class="board-reg_date">
                                <%=arr.get(k).getqna_regDate() %>
                            </div>
                            <div class="board-hit">
                                <%=arr.get(k).getqna_hit() %>
                            </div>
                            <div class="board-recommend">
                                <%=arr.get(k).getqna_like() %>
                            </div>
                        </div>
<%
				v_count = v_count + 1;
				for_count = for_count + 1;
			}else { 
				v_count = v_count + 1;
			}
			if(v_count == a_count)break; 
		}
	}
%>
                        </div>
                        
                    </div>
                    
                    <div class="board-bottom">
                    <form name="qnaSearch">
	                     <div class="board-bottom-search">
	                        <select name="t_select" id="">
	                            <option value="qna_title" <%if(select.equals("qna_title")) out.print("selected");%>>제목</option>
	                            <option value="qna_content" <%if(select.equals("qna_content")) out.print("selected");%>>내용</option>
	                            <option value="member_name" <%if(select.equals("member_name")) out.print("selected");%>>작성자</option>
	                        </select>
	                        <input name="t_search" type="text" value="<%=search%>">
	                        <button type="button" onclick="goSearch()">
	                            <i class="em em-mag header_icon" aria-role="presentation" aria-label="LEFT-POINTING MAGNIFYING GLASS"></i>
	                        </button>
	                     </div>
                     </form>
                       <div class="board-paging">
 <!--                          <div>앞</div>
                           <div style="background: #558203; color: #fff;">1</div>
                           <div>2</div>
                           <div>3</div>
                           <div>4</div>
                           <div>5</div>
                           <div>뒤</div>
-->                            
<%
			out.println(Paging.pageListPost(current_page, total_page));			
%>                         
                       </div>
                        <div>
                            <button type="button" class="board-write-button" onclick="goWrite()">글쓰기</button>
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