<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div class="tourneyLogo">
<map name="tchslogo">
<area href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview" alt="TCHS07" shape="poly" coords="1,1,266,1,266,100,66,100,66,142,1,142" >
</map>
<img src="/i/tournament/tchs07/tchs07.png" alt="TCHS07" usemap="#tchslogo" />
</div>

<div class="headline">
<A href="/tc?module=TCHS07ViewRegistration"><img src="/i/tournament/tchs07/registernow.png" alt="Register Now" /></A>
</div>

<div class="topcoderLogo">
<A href="/"><img src="/i/tournament/tchs07/topcoder.png" alt="TopCoder" /></A>
</div>

<div id="leftnav">
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview"<% if (tabLev1.equals("overview")) {%> class="on"<% } %>>OVERVIEW</A>
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onlineSchedule"<% if (tabLev1.equals("onlineSchedule")) {%> class="on"<% } %>>ONLINE SCHEDULE</A>
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onsiteSchedule"<% if (tabLev1.equals("onsiteSchedule")) {%> class="on"<% } %>>ONSITE SCHEDULE</A>
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=rules"<% if (tabLev1.equals("rules")) {%> class="on"<% } %>>RULES</A>
<A href="/tc?module=TCHS07ViewRegistration"<% if (tabLev1.equals("register")) {%> class="on"<% } %>>REGISTER</A>
<A href="/tc?module=TCHS07ViewRegistrants"<% if (tabLev1.equals("registrants")) {%> class="on"<% } %>>REGISTRANTS</A>
<%--<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=sponsors"<% if (tabLev1.equals("sponsors")) {%> class="on"<% } %>>SPONSORS</A>--%>
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=purdue"<% if (tabLev1.equals("purdue")) {%> class="on"<% } %>>PURDUE</A>
</div>