<%@page import="common.commonUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dao.FreeboardDao,dto.FreeboardDto" %>
<%@ page import="com.oreilly.servlet.*, java.io.*" %>
<%
/*   request.setCharacterEncoding("utf-8");
	FreeboardDao dao = new FreeboardDao();
	
	String no 		= request.getParameter("t_no"); 
	String title 	= request.getParameter("t_title"); 
	String content 	= request.getParameter("t_content"); 
	
	String msg="";
	FreeboardDto dto = new FreeboardDto(no,title,content);				
	int result = dao.updateFreeboard(dto);
	if(result == 1) msg =" 수정 되었습니다. ";
	else msg=" 수정 실패하였습니다. "; */
	
	
	request.setCharacterEncoding("utf-8");
	
	FreeboardDao dao = new FreeboardDao();
	
	String file_dir = commonUtil.file_dir_notice;
	int sizeLimit = 1024 * 1024 * 10;
	MultipartRequest mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8");
	
	String no 		= mpr.getParameter("t_no");
	String title 	= mpr.getParameter("t_title"); 
	String content 	= mpr.getParameter("t_content"); 

	
	String del_attach = mpr.getParameter("t_del_attach");
	String dbAttachName = "";
	
	if(del_attach != null){
		File delFile = new File(file_dir,del_attach);
		boolean d = delFile.delete();
		out.print("삭제여부 : " + d);
	}else{
		dbAttachName = mpr.getParameter("t_ori_attach");
	}
	
	String attach 	= mpr.getFilesystemName("t_attach"); //aa.hwp
	if (attach != null){
		String df = mpr.getParameter("t_ori_attach");
		if(!df.equals("")){
			File delFile = new File(file_dir,df);
			boolean d = delFile.delete();		
		}
		File oldFile = new File(file_dir,attach);
		File newFile = new File(file_dir,no+"-"+attach);//N025-aaaa.hwp
		oldFile.renameTo(newFile);
		dbAttachName = newFile.getName();
	}
	
	String msg="";
	FreeboardDto dto = new FreeboardDto(no,title,content,dbAttachName);				
	int result = dao.updateFreeboard(dto);
	if(result == 1) msg =" 수정 되었습니다. ";
	else msg=" 수정 실패하였습니다. ";
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