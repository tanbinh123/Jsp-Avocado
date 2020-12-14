<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dao.FreeboardDao,dto.FreeboardDto" %>
<%
	request.setCharacterEncoding("utf-8");
	FreeboardDao dao = new FreeboardDao();
	
	String no 		= request.getParameter("t_no"); 
	String title 	= request.getParameter("t_title"); 
	String content 	= request.getParameter("t_content"); 
	String reg_name = request.getParameter("t_reg_name"); 
	String reg_date = request.getParameter("t_reg_date");
	
	String msg="";
	FreeboardDto dto = new FreeboardDto(no,title,content,reg_name,reg_date,0);				
	int result = dao.updateFreeboard(dto);
	if(result == 1) msg =" 수정 되었습니다. ";
	else msg=" 수정 실패~ ";
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="freeboard_list.jsp";
</script>
</head>
<body>

</body>
</html>