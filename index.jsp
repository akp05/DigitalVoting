<%@ page import="java.sql.*,p.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="first_page.css" type="text/css">
</head>
<body>
<%
try
{
Connection con=MyConnection.getCon();
Statement st=con.createStatement();
String dv_candidate,dv_party,dv_seat,dv_result,dv_vote,dv_voter;

dv_candidate="CREATE TABLE  DV_CANDIDATE (CANDIDATE_ID NUMBER, CANDIDATE_NAME VARCHAR2(100),CANDIDATE_SEAT VARCHAR2(100),CANDIDATE_PARTY VARCHAR2(100), CANDIDATE_STATUS VARCHAR2(10), CONSTRAINT DV_CANDIDATE_PK PRIMARY KEY (CANDIDATE_ID) ENABLE)";
dv_party="CREATE TABLE  DV_PARTY (	PARTY_ID NUMBER(3,0),PARTY_NAME VARCHAR2(50),PARTY_ABBR VARCHAR2(8),PARTY_STATUS VARCHAR2(5), PRIMARY KEY (PARTY_NAME) ENABLE)";
dv_result="CREATE TABLE  DV_RESULT (	PARTY_NAME VARCHAR2(40),VOTE_COUNT NUMBER, CONSTRAINT DV_RESULT_PK PRIMARY KEY (PARTY_NAME) ENABLE)";
dv_seat="CREATE TABLE  DV_SEAT(	SEAT_ID NUMBER(5,0),SEAT_NAME VARCHAR2(100), PRIMARY KEY (SEAT_NAME) ENABLE)";
dv_vote="CREATE TABLE  DV_VOTE(	USER_ID VARCHAR2(40),PARTY_NAME VARCHAR2(40), CONSTRAINT DV_VOTE_PK PRIMARY KEY (USER_ID) ENABLE)";
dv_voter="CREATE TABLE  DV_VOTER(VOTER_ID NUMBER,VOTER_NAME VARCHAR2(50),VOTER_USERID VARCHAR2(50),VOTER_PASS VARCHAR2(50),VOTER_ADDRESS VARCHAR2(50),VOTER_CONTACT VARCHAR2(50),VOTER_EMAIL VARCHAR2(100),VOTER_ISASSIGNEDUSERID VARCHAR2(20),CONSTRAINT DV_VOTER_PK PRIMARY KEY (VOTER_ID) ENABLE)";

st.execute(dv_voter);
st.execute(dv_candidate);
st.execute(dv_party);
st.execute(dv_seat);
st.execute(dv_result);
st.execute(dv_vote);


System.out.println("Tables Created");
con.close();
}
catch(Exception e)
{
//System.out.println("Table exists");
System.out.println(e);
}
%>
<div id="container">
    <div id="header">
         <div id="leftheader">
         </div>
         <div id="centerheader">
  <font face="italic" size="20" color="black">
       <center>DIGITAL VOTING</center>
</font>
         </div>
         <div id="rightheader">
         </div>
    </div>
    <div id="menu">
     <ul>
     <li><a id="menu1" href="C:/Users/USER/Desktop/java project/home.html">Home</a>
     <li><a href="G:/C Programs/alternate.c">About us</a>
     <li><a href="G:/C Programs/alternate.c">Information Bulletin</a>
     <li><a href="G:/C Programs/alternate.c">FAQ</a>
     <li><a href="G:/C Programs/alternate.c">Contact us</a>
     <li><a href="G:/C Programs/alternate.c">Help</a>
    </ul>
   </div>
<div id="content">
   <div id="leftcontent">
 <ul >
    <li><a href="total_candidate.jsp"><u>Total Candidates</u></a>
     <li><a href="total_seats.jsp"><u>List of Total Seats</u></a></li>
     <li><a href="total_party.jsp"><u>Total Parties</u></a>
     <li><a href="create_voter.jsp"><u>Voter Form</u></a>
     <li><a href="create_candidate.jsp"><u>Candidate Form</u></a>
     <li><a href="create_party.jsp"><u>Party Form</u></a>
<li><a href="final_result.jsp"><u>Result</u></a>
    </ul>
</div>
<div id="centrecontent">
<h2><u><center>What is Digital Voting</center></u></h2>
Electronic voting (also known as e-voting) is voting using electronic means to record or count votes. Depending on the particular implementation, e-voting may encompass a range of Internet services, from a touchscreen kiosk at a polling station to voting online, and from a local-only solution to a networked system.


</div>
<div id="rightcontent">
  <font face="italic" size=10 color="purple">
Login
</font><br><br><br>
<form action="login.jsp">
<font color="red" style="position:relative;left:80px;">
<%
String msg=request.getParameter("msg");
if(msg==null)
{}
else
{
out.println(msg);
}
session.invalidate();
%>
</font>
<table cellpadding="7">
<tr><td>User Id</td><td><input type="text" name="userid"></td></tr>
<tr><td>Password</td><td><input type="password" name="pass"></td></tr>
<tr><td>Login type</td>
<td><select name="utype">
<option value="none">select</option>
<option value="voter">Voter</option>
<option value="electioncommision">Election Commission</option>
</select></td></tr>
<tr><td><input type="submit" value="login"></td>
<td><a href="forgot_pass.jsp">Forgot Password</a></td></tr>
</table>
</form>

</div>
</div>
<div id="footer">
<center>Copyright@ 2017</center>
</div>
</div>
</body>
</html>