<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Registration</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
<A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0" /></A>
</div>
<div align="center">
   <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

     <jsp:include page="/page_title.jsp">
         <jsp:param name="image" value="registration_w"/>
         <jsp:param name="title" value="&#160;"/>
     </jsp:include>

   <div id="regBcContainer">
      <div class="regBc">
         <div class="title">
             <%--user should never be logged in at this point --%>
         Step <strong>5</strong> of <strong>6</strong></div>
         <div class="off">Select Your Registration</div>
         <div class="off">General</div>
         <div class="off">Demographics</div>
         <div class="off">Confirm</div>
         <div class="on">Success</div>
         <div class="off">Activation</div>
      </div>
   </div>

   <div style="width:400px;">
   <strong>Registration successful!</strong>
   <br><br>
   <span class="bigRed">Please check your email. You <u>MUST</u> activate your account to complete registration.</span>
   <br><br>
   Your activation code is being emailed to you. Follow the instructions in the email to activate your account.

   </div>

<br><br>
<%------------------ COMPETITOR------------------%>
<div class="regHead">As a Registered Competitor</div>
<table cellpadding="0" cellspacing="0" border="0" class="whatToDo" width="400">
   <tr>
      <td class="image"><A href="/tc"><img src="/i/registration/competitor_howto.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;" /></A></td>
      <td class="text" width="100%"><strong>Learn how to compete</strong><br>
         <A href="/tc?module=Static&d1=help&d2=index">Algorithm</A><br>
         <A href="/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted">Software Design</A><br>
         <A href="/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted">Software Development</A><br>
         <A href="/longcontest/?module=Static&d1=instructions">Marathon Matches</A>:
      </td>
   </tr>
   <tr>
      <td class="image"><A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/registration/the_digital_run.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;" /></A></td>
      <td class="text" width="100%"><strong>The Digital Run</strong><br>
         Rewarding the top software designers and developers. Place well in a competition, you earn points. Accumulate lots of points over the course of a Stage (4 per year) or year, you win. It's that simple. 
      </td>
   </tr>
</table>

<br><br>
<%------------------ HIGH SCHOOL------------------%>
<div class="regHead">As a Registered High School Competitor</div>
<table cellpadding="0" cellspacing="0" border="0" class="whatToDo" width="400">
   <tr>
      <td class="image"><A href="/tc?module=Static&d1=hs&d2=support&d3=index"><img src="/i/registration/hs_howto.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;" /></A></td>
      <td class="text" width="100%"><strong>How to compete</strong><br>
         Take a look at our <A href="/tc?module=Static&d1=hs&d2=support&d3=index">How to Compete</A> guide.
      </td>
   </tr>
   <tr>
      <td class="image"><A href="/tc?module=Static&d1=tutorials&d2=alg_index"><img src="/i/registration/hs_education.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;" /></A></td>
      <td class="text" width="100%"><strong>Learn more</strong><br>
         Our <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Educational Content</A> has volumes of helpful information on how to be a better programmer, as well as how to be a better TopCoder competitor.
      </td>
   </tr>
</table>

<br><br>
<%------------------ TCS------------------%>
<div class="regHead">As a Registered TopCoder Software Customer</div>
<table cellpadding="0" cellspacing="0" border="0" class="whatToDo" width="400">
   <tr>
      <td class="image"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/"><img src="/i/registration/tcs_info.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;" /></A></td>
      <td class="text" width="100%">
         <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/about/explanationMovie.jsp">How it works</A><br>
         <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/customers/index.jsp">Who it's working for</A><br>
         <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/index.jsp">Get started</A>
      </td>
   </tr>
</table>

<br><br>
<%------------------ CORP ------------------%>
<div class="regHead">As a Registered Corporate Services Member</div>
<table cellpadding="0" cellspacing="0" border="0" class="whatToDo" width="400">
   <tr>
      <td class="image"><A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/registration/corporate.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;" /></A></td>
      <td class="text" width="100%">
         <A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=market_tourny">Sponsor an event</A><br>
         <A href="/pl/">Host your own event, Powered by TopCoder</A><br>
         <A href="/corp/?module=Static&d1=corp&d2=tces_home">Hire talented programmers</A>
      </td>
   </tr>
</table>

<br><br>
<%------------------ MINIMAL - BUT SHOW THIS WITH ALL REGISTRATIONS, SO I GUESS JUST LEAVE IT ON BOTTOM WITH NO LOGIC ------------------%>
<div class="regHead">As a Registered TopCoder Member</div>
<table cellpadding="0" cellspacing="0" border="0" class="whatToDo" width="400">
   <tr>
      <td class="image"><A href="/"><img src="/i/registration/minimal.jpg" alt="" border="0" style="border-bottom: 1px solid #999999;border-left: 1px solid #999999;border-right: 1px solid #999999;" /></A></td>
      <td class="text" width="100%">
      As a TopCoder member you now have access to all <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>">TopCoder Forums</A> and the ability to view all statistical content on the website.  Enjoy.
      </td>
   </tr>
</table>

<br><br>
   </div>
</div>

</body>
</html>
