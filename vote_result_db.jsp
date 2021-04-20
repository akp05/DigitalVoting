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
       <center>Vote for GNDA Chairmain</center>
</font face>
</div>
<div id="rightmenu">
<h4><b><center><a href="index.jsp?msg=u r loggedout">Logout</a></b></center></h4>
</div>
</div>
<div id="content">
   <div id="leftcontent">
 <ul >
 <li> 
    <li><a href="total_candidate.jsp"><u>Total Candidates</u></a>
     <li><a href="total_seats.jsp"><u>List of Total Seats</u></a></li>
     <li><a href="total_party.jsp"><u>Total Parties</u></a>
     <li><a href="create_voter.jsp"><u>Voter Form</u></a>
	 <li><a href="final_result.jsp"><u>Result</u></a>
    </ul>
</div>
<div id="centercontent">
<% 
String partyname=request.getParameter("partyname");
String userid=(String)session.getAttribute("user");
try
{
	Connection con=MyConnection.getCon();
	ResultSet rs=con.createStatement().executeQuery("select * from dv_vote where user_id='"+userid+"'");
	if(rs.next())	
	{
		response.sendRedirect("voter_login.jsp?msg=you have already voted");
	}
	else
	{
		PreparedStatement pst=con.prepareStatement("insert into dv_vote values(?,?)");
		ResultSet rs1=con.createStatement().executeQuery("select vote_count from dv_result where party_name='"+partyname+"'");
		rs1.next();
		int count=rs1.getInt(1);
		count++;
		pst.setString(1,userid);
		pst.setString(2,partyname);
		con.createStatement().executeUpdate("update dv_result set vote_count="+count+" where party_name='"+partyname+"'");
		pst.executeUpdate();
		response.sendRedirect("voter_login.jsp?msg=you have successfully voted");			
	}
	con.close();
	
}
catch(Exception e)
{
	System.out.println(e);
}


%>
</div>
</div>
<div id="footer">
<center>Copyright@2016</center>
</div>

</div>
</body>
</html>