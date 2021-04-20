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
String userid=request.getParameter("userid");
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select voter_pass from dv_voter where voter_userid='"+userid+"'");
	if(rs.next())
	{
		response.sendRedirect("forgot_pass.jsp?msg=Your Password is:"+rs.getString(1));	
	}
	else
	{
		response.sendRedirect("forgot_pass.jsp?msg=No Record is found on this UserId");
	}
	con.close();
	
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>