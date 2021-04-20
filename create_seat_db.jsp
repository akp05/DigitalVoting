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
String seat=request.getParameter("seat");
out.println(seat);
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(seat_id) from dv_seat");
	rs.next();
	int id=rs.getInt(1);
	id++;
	PreparedStatement pst=con.prepareStatement("insert into dv_seat values(?,?)");
	pst.setInt(1, id);
	pst.setString(2,seat);
	pst.executeUpdate();
	con.close();
	response.sendRedirect("create_seats.jsp?msg=seat created");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("create_seats.jsp?msg=seat already created");
}
%>
</body>
</html>