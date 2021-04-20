<%@ page import="java.sql.*,p.MyConnection" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="ec_login.css" type="text/css">
</head>
<body >
<div id="container">
    <div id="header">
         <div id="leftheader">
         </div>
         <div id="centerheader">
            <font face="italic" size="22" color="black">
       <center>DIGITAL VOTING</center>
</font>
  
         </div>
         <div id="rightheader">
         </div>
    </div>
<div id="menu">
<% 
String user=(String)session.getAttribute("user");
if(user!=null)
{
%>
<div id="leftmenu"><h4><b>Welcome:<%=user%></b></h4>
</div>
<div id="centremenu">
<font face="italic" size="6.5" color="blue">
<% 
	if("india".equalsIgnoreCase(user))
	{
%>
       <center>Election Commission of India</center>
       <% 
	}
	else
	{
		%>
		<center>Vote for GNDA Chairmain</center>
		<%
		
	}
       %>
</font>
</div>
<div id="rightmenu">
<h4><b><center><a href="index.jsp?msg=u r loggedout">Logout</a></b></center></h4></div>
<%
}
%>
</div>
<div id="content">
   <div id="leftcontent">
 <ul >
 <% 
 if(user==null)
 {
 %>
     <li><a href="index.jsp"><u>Home</u></a> 
     <li><a href="total_candidate.jsp"><u>Total Candidates</u></a>
     <li><a href="total_seats.jsp"><u>List of Total Seats</u></a></li>
     <li><a href="total_party.jsp"><u>Total Parties</u></a>
     <li><a href="create_voter.jsp"><u>Voter Form</u></a>
     <li><a href="create_candidate.jsp"><u>Candidate Form</u></a>
     <li><a href="create_party.jsp"><u>Party Form</u></a>
	 <li><a href="final_result.jsp"><u>Result</u></a>
  <%
 }
 
 else if("india".equalsIgnoreCase(user))
 {
	 %>
	 <li><a href="create_userid.jsp"><u>Create UserId</u></a>
    <li><a href="total_candidate.jsp"><u>Total Candidates</u></a>
     <li><a href="total_seats.jsp"><u>List of Total Seats</u></a></li>
      <li><a href="create_seats.jsp"><u>Create Seat</u></a></li>
     <li><a href="total_party.jsp"><u>Total Parties</u></a>
     <li><a href="approve_party.jsp"><u>Approve Party</u></a>
     <li><a href="approve_candidate.jsp"><u>Approve Candidate</u></a>
     <li><a href="final_result.jsp"><u>Result</u></a>
    
	 <% 
	 
 }
 
 else
 {
	 %>
	 
	  <li><a href="total_candidate.jsp"><u>Total Candidates</u></a>
     <li><a href="total_seats.jsp"><u>List of Total Seats</u></a></li>
     <li><a href="total_party.jsp"><u>Total Parties</u></a>
     <li><a href="final_result.jsp"><u>Result</u></a>
	 <% 
	 
 }
  %>
    </ul>
</div>
<div id="centercontent">
<table border="1" >
<th>Party Name</th><th>Total Votes</th>
<% 
String partyname="";
int votes=0;
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from dv_result");

while(rs.next())
{
	partyname=rs.getString(1);
	votes=rs.getInt(2);
%>
<tr><td><%=partyname%></td><td><%=votes%></td></tr>
<%
}

}catch(Exception e)
{
	System.out.println(e);
}


%>
</table><br>
</div>
</div>
<div id="footer">
<center>Copyright@2016</center>
</div>

</div>
</body>
</html>