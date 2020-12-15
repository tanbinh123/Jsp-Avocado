<%
	String sessionName = (String)session.getAttribute("sessionName");
	if(sessionName == null) sessionName ="";
	
	String sessionEmail = (String)session.getAttribute("sessionEmail");
	if(sessionEmail == null) sessionEmail ="";
	
	String sessionLevel = (String)session.getAttribute("sessionLevel");
	if(sessionLevel == null) sessionLevel ="";
%>