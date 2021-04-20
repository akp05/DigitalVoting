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
String seatname=request.getParameter("seatname");
int seatid=Integer.parseInt(request.getParameter("seatid"));
System.out.println(seatname+seatid);
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	PreparedStatement pst=con.prepareStatement("update dv_seat set seat_name=? where seat_id=?");
	pst.setInt(2, seatid);
	pst.setString(1,seatname);
	pst.executeUpdate();
	con.close();
	response.sendRedirect("create_seats.jsp?msg=seat updated");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("create_seats.jsp?msg=seat already created");
}
%>
</body>
</html>