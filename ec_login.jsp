
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
<div style="position: absolute;top:270px;left:350px;background-color:#d1d1d1;border:1px solid grey;width:700px;">
<br><center><b>What is Election Commission</b><center>
The Election Commission of India is an autonomous constitutional authority responsible for administering election processes to Lok Sabha, Rajya Sabha, state legislatures and the offices of the President and Vice President in India.[1] Election Commission operates under the authority of Constitution, and subsequently enacted Representation of the People Act. The Supreme Court of India has held that where the enacted laws are silent or make insufficient provision to deal with a given situation in the conduct of elections, the Election Commission has the residuary powers under the Constitution to act in an appropriate manner.


</div>
</div>
<div id="footer">
<center>Copyright@2016</center>
</div>

</div>
</body>
</html>