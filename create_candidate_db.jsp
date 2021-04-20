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
String cname=request.getParameter("candidatename");
String cseat=request.getParameter("candidateseat");
String cparty=request.getParameter("candidateparty");
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(candidate_id) from dv_candidate");
	rs.next();
	int id=rs.getInt(1);
	id++;
	PreparedStatement pst=con.prepareStatement("insert into dv_candidate values(?,?,?,?,?)");
	pst.setInt(1,id);
	pst.setString(2,cname);
	pst.setString(3,cseat);
	pst.setString(4,cparty);
	pst.setString(5,"Pending");
	pst.executeUpdate();
	con.close();
	response.sendRedirect("create_candidate.jsp?msg=successfully send for approval");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("create_candidate.jsp?msg=candidate exist!");
}
%>
</body>
</html>