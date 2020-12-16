<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.FreeboardDao, dto.FreeboardDto" %>
<%
	request.setCharacterEncoding("utf-8");
	FreeboardDao dao = new FreeboardDao();
	
	String no 		= dao.getFreeboardNo();
	String title 	= request.getParameter("t_title"); 
	String content 	= request.getParameter("t_content"); 
	String reg_name = request.getParameter("t_reg_name"); 
	String reg_date = request.getParameter("t_reg_date"); 
	
	FreeboardDto dto = new FreeboardDto(no,title,content,reg_name,reg_date,0);
	int result = dao.saveFreeboard(dto);
	String msg="";
	if(result == 1) msg =" 등록 되었습니다. ";
	else msg=" 등록 실패~ ";
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="/board/freeboard/freeboardList.jsp";
</script>
</head>
<body>

</body>
</html>