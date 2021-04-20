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
<div id="leftmenu">
<h4><b>Welcome:<%=session.getAttribute("user")%></b></h4>
</div>
<div id="centremenu">
          <font face="italic" size="6.5" color="blue">
       <center>Vote for GNDA Chairmain</center>
       
</font>
<%
String msg=request.getParameter("msg");
if(msg==null)
{}
else
{
out.println(msg);
}
%>

</div>
<div id="rightmenu">
<h4><b><center><a href="index.jsp?msg=u r loggedout">Logout</a></b></center></h4>
</div>
</div>
<div id="content">
   <div id="leftcontent">
 <ul >
    <li><a href="total_candidate.jsp"><u>Total Candidates</u></a>
     <li><a href="total_seats.jsp"><u>List of Total Seats</u></a></li>
     <li><a href="total_party.jsp"><u>Total Parties</u></a>
     <li><a href="final_result.jsp"><u>Result</u></a>
    </ul>
</div>
<div id="centercontent">
<br><center><b>Please do not share your poll</b><center><br>
<form action="vote_result_db.jsp" method="post">
<table border="1" >
<th>Party Name</th><th>Vote</th>
<% 
String partyname="";
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from dv_party where party_status='true'");

while(rs.next())
{
	partyname=rs.getString(2);
%>
<tr><td><%=partyname%></td><td><input type="radio" name="partyname" value="<%=partyname%>"></td></tr>
<%
}

}catch(Exception e)
{
	System.out.println(e);
}


%>
</table><br>
<input type="submit" value="vote">
</form>
</div>
</div>
<div id="footer">
<center>Copyright@2016</center>
</div>

</div>
</body>
</html>