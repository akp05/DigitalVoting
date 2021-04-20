
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
</div>
<div id="centremenu">
<font face="italic" size="6.5" color="blue">
       <center>Election Commission of India</center>
</font face>

</div>
<div id="rightmenu">
</div>
</div>
<div id="content">
   <div id="leftcontent">
 <ul >
    <li><a href="total_candidate.jsp"><u>Total Candidates</u></a>
     <li><a href="total_seats.jsp"><u>List of Total Seats</u></a></li>
     <li><a href="create_seats.jsp"><u>Create Seat</u></a></li>
    
     <li><a href="total_party.jsp"><u>Total Parties</u></a>
     <li><a href="G:/C Programs/alternate.c"><u>Voter Form</u></a>
     <li><a href="G:/C Programs/alternate.c"><u>Candidate Form</u></a>
     <li><a href="G:/C Programs/alternate.c"><u>Party Form</u></a>
<li><a href="G:/C Programs/alternate.c"><u>Updates</u></a>
<li><a href="G:/C Programs/alternate.c"><u>Result</u></a>
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
<form action="forgot_pass_db.jsp">
<table cellpadding="8"><tr><td>Enter UserId</td><td><input type="text" name="userid"></td></tr>
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