<%@ page import="java.sql.*,p.*,java.util.*" %>
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
 <li><a href="index.jsp"><u>Home</u></a>
    <li><a href="total_candidate.jsp"><u>Total Candidates</u></a>
     <li><a href="total_seats.jsp"><u>List of Total Seats</u></a></li>
     <li><a href="create_seats.jsp"><u>Create Seat</u></a></li>
     <li><a href="total_party.jsp"><u>Total Parties</u></a>
     <li><a href="create_voter.jsp"><u>Voter Form</u></a>
     <li><a href="create_candidate.jsp"><u>Candidate Form</u></a>
     <li><a href="create_party.jsp"><u>Party Form</u></a>
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
<%
TreeSet<String> ts=new TreeSet<String>();
try
{
	Connection con=MyConnection.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select voter_userid from dv_voter where voter_isassigneduserid='false'");	
	while(rs.next())
	{
	ts.add(rs.getString(1));	
	}
	con.close();
}
catch(Exception e)
{
System.out.println(e);
}

%>

</font>
<form action="create_voter_db.jsp">
<table cellpadding="8">
<tr><td>UserId</td><td><input type="text" name="userid" readonly="readonly" value="<%=ts.first()%>"></td></tr>
<tr><td>Voter Name:</td><td><input type="text" name="votername" ></td></tr>
<tr><td>Voter Password:</td><td><input type="password" name="voterpass" ></td></tr>
<tr><td>Voter Address:</td><td><textarea name="voteraddress"></textarea></td></tr>
<tr><td>Voter Contact:</td><td><input type="text" name="votercontact" ></td></tr>
<tr><td>Voter Email:</td><td><input type="text" name="voteremail" ></td></tr>
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