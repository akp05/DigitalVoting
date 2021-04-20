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
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(voter_id) from dv_voter");
	rs.next();
	int id=rs.getInt(1);
	PreparedStatement pst=con.prepareStatement("insert into dv_voter(voter_userid,voter_id,voter_isassigneduserid) values(?,?,?)");
	id++;
	pst.setInt(2,id);
	pst.setString(1,"udv"+id);
	pst.setString(3,"false");
	pst.executeUpdate();
	con.close();
	response.sendRedirect("create_userid.jsp?msg=Userid successfully Generated");
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>