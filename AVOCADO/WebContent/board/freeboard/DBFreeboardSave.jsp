<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.FreeboardDao,dto.FreeboardDto" %>
<%@ page import="com.oreilly.servlet.*,java.io.*" %>
<%
  request.setCharacterEncoding("utf-8");
	FreeboardDao dao = new FreeboardDao();
	
	String file_dir = "C:/Users/junh2/git/Project_AVOCADO/AVOCADO/WebContent/file_room/freooboard";
	int sizeLimit = 1024 * 1024 * 10;
	
	
	
	System.out.println("=====오류==========================");
	System.out.println(request);
	System.out.println(file_dir);
	System.out.println(sizeLimit);
	System.out.println("=====오류==========================");
	
	
	
	
	MultipartRequest mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8");
	
	String no 		= dao.getFreeboardNo();
	String title 	= mpr.getParameter("t_title"); 
	String content 	= mpr.getParameter("t_content"); 
	String reg_name = mpr.getParameter("t_reg_name"); 
	String reg_date = mpr.getParameter("t_reg_date"); 
	
	String attach   = mpr.getFilesystemName("t_attach");
	String dbAttachName = "";
	if(attach != null){
		File oldFile = new File(file_dir, attach);
		File newFile = new File(file_dir, no+"-"+attach);
		oldFile.renameTo(newFile);
		dbAttachName = newFile.getName();
	}
	
	out.print(" attach :"+attach);
	out.print(" dbAttachName :"+dbAttachName);
	
	FreeboardDto dto = new FreeboardDto(no,title,content,reg_name,reg_date,dbAttachName,0);
	int result = dao.saveFreeboard(dto);
	String msg="";
	if(result == 1) msg =" 등록 되었습니다. ";
	else msg=" 등록 실패하였습니다 ";
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