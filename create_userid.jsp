<%@ page import="java.sql.*,p.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="create_seats.css" type="text/css">
</head>
<body >
<div id="container">
    <div id="header">
         <div id="leftheader">
         </div>
         <div id="centerheader">
            <font face="italic" size="20" color="black">
       <center>DIGITAL VOTING</center>
</font face>
  
         </div>
         <div id="rightheader">
         </div>
    </div>
<div id="menu">
<div id="leftmenu">
<h4><b>Welcome:<%=session.getAttribute("user")%></b></h4>
</div>
<div id="centremenu">
          <font face="italic" size="6.5" color="blue">
       <center>Election Commission of India</center>
</font>
</div>
<div id="rightmenu">
<h4><b><center><a href="index.jsp?msg=u r loggedout">Logout</a></b></center></h4>
</div>
</div>
<div id="content">
   <div id="leftcontent">
 <ul >
 <li><a href="create_userid.jsp"><u>Create UserId</u></a>
    <li><a href="total_candidate.jsp"><u>Total Candidates</u></a>
     <li><a href="total_seats.jsp"><u>List of Total Seats</u></a></li>
      <li><a href="create_seats.jsp"><u>Create Seat</u></a></li>
     <li><a href="total_party.jsp"><u>Total Parties</u></a>
     <li><a href="approve_party.jsp"><u>Approve Party</u></a>
     <li><a href="approve_candidate.jsp"><u>Approve Candidate</u></a>
     <li><a href="final_result.jsp"><u>Result</u></a>
       </ul>
</div>
<div id="centercontent">
<font color="green">
<%
String msg=request.getParameter("msg");
if(msg==null)
{}
else
{
out.println(msg);
}
%>
</font>
<form action="create_userid_db.jsp">
<table>
<%
int count=0;
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from dv_voter");
	while(rs.next())
	{
	count++;
	} 
	con.close();
}
catch(Exception e)
{
System.out.println(e);
}
%>
<tr><td><h4>Total UserIds:<%=count%></h4></td></tr>
<tr><td><input type="submit" value="Generate UserId Automatically"></td></tr>
</table>
</form>
</div>
</div>
<div id="footer">
<center>Copyright@2016</center>
</div>
</div>
</body>
</html>