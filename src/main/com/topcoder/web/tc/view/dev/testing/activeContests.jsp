<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Testing Competitions</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>


<jsp:include page="/top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="testing_compete"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="testing"/>
<jsp:param name="title" value="Active Contests"/>
</jsp:include>

<div align="right"><A href="/tc?module=Static&d1=dev&d2=testing&d3=instructions"><img src="/i/development/get_started.gif" alt="Getting Started" border="0" /></A></div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="title" colspan="8">Active Software Testing Contests</td></tr>
   <tr>
      <td class="tableHeader" colspan="3" nowrap="nowrap">Contest</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Competitors</td>
      <td class="tableHeader" align="center" nowrap="nowrap">1st Place</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Register By</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Submit By</td>
      <td class="tableHeader" align="center" nowrap="nowrap">Forums</td>
   </tr>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_salesIMAdmin">Sales IM Admin Testing Competition</A>
      </td>
      <td class="valueC">
      <%--registration closed--%>
      <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Sales IM Admin Testing Competition">register</A>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_salesIMAdmin">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_salesIMAdmin">standings</A>
      --%>
      </td>
      <td class="valueC">$1,200</td>
      <td class="valueC">
      05.16.2007 9:00 AM EDT
      </td>
      <td class="valueC">
      05.23.2007 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="515778" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_salesIMChat">Sales IM Chat Testing Competition</A>
      </td>
      <td class="valueC">
      <%--registration closed--%>
      <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Sales IM Chat Testing Competition">register</A>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_salesIMChat">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_salesIMChat">standings</A>
      --%>
      </td>
      <td class="valueC">$1,200</td>
      <td class="valueC">
      05.16.2007 9:00 AM EDT
      </td>
      <td class="valueC">
      05.23.2007 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="515779" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_salesIMPrechat">Sales IM Pre-Chat Testing Competition</A>
      </td>
      <td class="valueC">
      <%--registration closed--%>
      <A href="mailto:TestingCompetitions@topcoder.com?subject=Register: Sales IM Pre-Chat Testing Competition">register</A>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_salesIMPrechat">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_salesIMPrechat">standings</A>
      --%>
      </td>
      <td class="valueC">$1,200</td>
      <td class="valueC">
      05.16.2007 9:00 AM EDT
      </td>
      <td class="valueC">
      05.25.2007 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="515780" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_smcEventTemplate">SMC Testing Competition - Event Template</A>
      </td>
      <td class="valueC">
      registration closed
      <%--<A href="mailto:TestingCompetitions@topcoder.com?subject=Register: SMC Testing Competition - Event Template">register</A>--%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_smcEventTemplate">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_smcEventTemplate">standings</A>
      --%>
      </td>
      <td class="valueC">$800</td>
      <td class="valueC">
      04.23.2007 9:00 AM EDT
      </td>
      <td class="valueC">
      04.27.2007 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="515095" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_smcEventView">SMC Testing Competition - Event View</A>
      </td>
      <td class="valueC">
      registration closed
      <%--<A href="mailto:TestingCompetitions@topcoder.com?subject=Register: SMC Testing Competition - Event View">register</A>--%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_smcEventView">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_smcEventView">standings</A>
      --%>
      </td>
      <td class="valueC">$800</td>
      <td class="valueC">
      04.23.2007 9:00 AM EDT
      </td>
      <td class="valueC">
      04.27.2007 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="515096" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_smcKeyEvent">SMC Testing Competition - Key Event</A>
      </td>
      <td class="valueC">
      registration closed
      <%--<A href="mailto:TestingCompetitions@topcoder.com?subject=Register: SMC Testing Competition - Key Event">register</A>--%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_smcKeyEvent">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_smcKeyEvent">standings</A>
      --%>
      </td>
      <td class="valueC">$800</td>
      <td class="valueC">
      04.23.2007 9:00 AM EDT
      </td>
      <td class="valueC">
      04.27.2007 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="515097" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_smcLandingPage">SMC Testing Competition - Landing Page</A>
      </td>
      <td class="valueC">
      registration closed
      <%--<A href="mailto:TestingCompetitions@topcoder.com?subject=Register: SMC Testing Competition - Landing Page">register</A>--%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_smcLandingPage">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_smcLandingPage">standings</A>
      --%>
      </td>
      <td class="valueC">$800</td>
      <td class="valueC">
      04.23.2007 9:00 AM EDT
      </td>
      <td class="valueC">
      04.27.2007 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="515098" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_smcNonLandingPage">SMC Testing Competition - Non-Landing Page</A>
      </td>
      <td class="valueC">
      registration closed
      <%--<A href="mailto:TestingCompetitions@topcoder.com?subject=Register: SMC Testing Competition - Non-Landing Page">register</A>--%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_smcNonLandingPage">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_smcNonLandingPage">standings</A>
      --%>
      </td>
      <td class="valueC">$800</td>
      <td class="valueC">
      04.23.2007 9:00 AM EDT
      </td>
      <td class="valueC">
      04.27.2007 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="515099" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
      <td class="value">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=det_smcReporting">SMC Testing Competition - Reporting</A>
      </td>
      <td class="valueC">
      registration closed
      <%--<A href="mailto:TestingCompetitions@topcoder.com?subject=Register: SMC Testing Competition - Reporting">register</A>--%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=res_smcReporting">results</A>
      --%>
      </td>
      <td class="valueC">
      &#160;
      <%--
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=sta_smcReporting">standings</A>
      --%>
      </td>
      <td class="valueC">$800</td>
      <td class="valueC">
      04.23.2007 9:00 AM EDT
      </td>
      <td class="valueC">
      04.27.2007 9:00 AM EDT
      </td>
      <td class="valueC" nowrap="nowrap">
      <tc-webtag:forumLink forumID="515100" message="discuss" />
      </td>
   </tr>
   <% even = !even;%>
</table>

</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td>
   <jsp:include page="/public_right.jsp">
       <jsp:param name="level1" value="default"/>
   </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>

