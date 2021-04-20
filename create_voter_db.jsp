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
String voteruserid=request.getParameter("userid");
String votername=request.getParameter("votername");
String voterpass=request.getParameter("voterpass");
String voteraddress=request.getParameter("voteraddress");
String votercontact=request.getParameter("votercontact");
String voteremail=request.getParameter("voteremail");
//System.out.println(voteraddress+votercontact+voteremail+votername);
try
{
	Connection con=MyConnection.getCon();
	String query="update dv_voter set voter_name='"+votername+"',voter_pass='"+voterpass+"',voter_address='"+voteraddress+"',voter_contact='"+votercontact+"',voter_email='"+voteremail+"',voter_isassigneduserid='true' where voter_userid='"+voteruserid+"'";
	Statement st=con.createStatement();
	System.out.println(query);
	st.executeUpdate(query);
	con.close();
	response.sendRedirect("create_voter.jsp?msg=voter is successfully registered");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("create_voter.jsp?msg=problem exist!try again later");
}
%>
</body>
</html>