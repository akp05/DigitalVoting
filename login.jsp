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
String uid=request.getParameter("userid");
String pass=request.getParameter("pass");
String utype=request.getParameter("utype");
if(utype.equals("none"))
{
	response.sendRedirect("index.jsp?msg=Please Select User Type");	
}
else if(utype.equals("voter"))
{
	try
	{
		Connection con=MyConnection.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from dv_voter where voter_userid='"+uid+"' and voter_pass='"+pass+"'");
	
	if(rs.next())
	{
		session.setAttribute("userid",uid);
		session.setAttribute("user",rs.getString("voter_name"));
		response.sendRedirect("voter_login.jsp");
	}
	else
	{
		response.sendRedirect("index.jsp?msg=Invalid Userid or password");
	}
	con.close();
	}catch(Exception e)
	{
		System.out.println(e);
	}
	
	
}
else if(utype.equals("electioncommision"))
{
	if(uid.equals("india")&&pass.equals("india"))
	{
		session.setAttribute("user",uid);
		response.sendRedirect("ec_login.jsp");	
	}
	else
	{
	response.sendRedirect("index.jsp?msg=Invalid Userid or password");
	}
	}
%>
</body>
</html>