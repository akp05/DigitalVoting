<%@ page language="java" import="java.sql.*,p.*" contentType="text/html; charset=ISO-8859-1"
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
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	PreparedStatement pst=con.prepareStatement("delete from dv_seat where seat_name=?");
	pst.setString(1,seatname);
	pst.executeUpdate();
	con.close();
	response.sendRedirect("total_seats.jsp?msg=seat deleted");
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>