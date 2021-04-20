<%@page import="p.MyConnection,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int cid=Integer.parseInt(request.getParameter("candidateid"));

try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	PreparedStatement pst=con.prepareStatement("update dv_candidate set candidate_status='Approved' where candidate_id=?");
	pst.setInt(1,cid);
	pst.executeUpdate();
	con.close();
	response.sendRedirect("approve_candidate.jsp?msg=successfully approved");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("approve_candidate.jsp?msg=not approved");
}
%>
</body>
</html>