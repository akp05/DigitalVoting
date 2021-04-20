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
String partyname=request.getParameter("partyname");
String partyabb=request.getParameter("partyabb");

try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(party_id) from dv_party");
	rs.next();
	int id=rs.getInt(1);
	id++;
	PreparedStatement pst=con.prepareStatement("insert into dv_party values(?,?,?,?)");
	PreparedStatement pstresult=con.prepareStatement("insert into dv_result(party_name) values(?)");
	pstresult.setString(1,partyname);

	pst.setInt(1, id);
	pst.setString(2,partyname);
	pst.setString(3,partyabb);
	pst.setString(4,"false");
	pst.executeUpdate();
	pstresult.executeUpdate();
	con.close();
	response.sendRedirect("create_party.jsp?msg=successfully send for approval");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("create_party.jsp?msg=party exist!");
}
%>
</body>
</html>