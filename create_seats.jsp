
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
<%
String user=(String)session.getAttribute("user");
%>
<h4><b>Welcome:<%=user%></b></h4>
</div>
<div id="centremenu">
<font face="italic" size="6.5" color="blue">
       <center>Election Commission of India</center>
</font face>

</div>
<div id="rightmenu">
<h4><b><center><a href="index.jsp?msg=u r loggedout">Logout</a></b></center></h4>
</div>
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
 
 else
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
  %>
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
<form action="create_seat_db.jsp">
<table cellpadding="8"><tr><td>Seat Name</td><td><input type="text" name="seat"></td></tr>
<tr><td><input type="submit" value="submit"></td></tr>
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