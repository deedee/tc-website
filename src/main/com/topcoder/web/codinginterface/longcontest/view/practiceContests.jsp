<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.web.codinginterface.longcontest.Constants"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID)==null?Constants.LONG_ROUND_TYPE_ID:((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String myNode = "long_compete";
    String image = "long_comps_topcoder";
     if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
         myNode="long_practice";
     } else if (roundType ==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
         myNode="long_intelmtcs_practice";
         image = "long_comps_intel";
     } else if (roundType ==Constants.INTEL_LONG_ROUND_TYPE_ID) {
         myNode="long_intelmtcs_compete";
         image = "long_comps_intel";
     }
%>

<html>
<head>
    <title>TopCoder</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%=myNode%>"/>
         </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="page_title.jsp">
                <jsp:param name="image" value="<%=image%>"/>
                <jsp:param name="title" value="Practice Contests"/>
            </jsp:include>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">

                            <tr>
                                <td class="tableTitle" colspan="4">Practice Contests</td>
                            </tr>
                            <tr>
                                <td class="tableHeader" width="40%">Contest</td>
<%--
                                <td class="tableHeader" width="10%" align="right">Registrants</td>
--%>
                                <td class="tableHeader" width="20%" align="right">Competitors</td>
                                <td class="tableHeader" width="20%">&nbsp;</td>
                                <td class="tableHeader" width="20%">&nbsp;</td>
                            </tr>

                            <%boolean even = true;%>

                            <logic:iterate name="<%=Constants.CONTEST_LIST_KEY%>" id="contest">
                                <tr>
                                    <td class="<%=even?"statLt":"statDk"%>"><b>
                                        <tc-webtag:beanWrite name="contest" property="contestName"/> &gt; <tc-webtag:beanWrite name="contest" property="roundName"/></b></td>
<%--
                                    <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 35px;">
                                        <A href="registrants page" class="statLink">
                                            <tc-webtag:beanWrite name="contest" property="numRegistrants"/></A></td>
--%>
                                    <td class="<%=even?"statLt":"statDk"%>" align="right" style="padding-right: 35px;">
                                            <tc-webtag:beanWrite name="contest" property="numCompetitors"/></td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=Submit&<%=Constants.COMPONENT_ID%>=<tc-webtag:beanWrite name="contest" property="componentID"/>&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>&<%=Constants.CONTEST_ID%>=<tc-webtag:beanWrite name="contest" property="contestID"/>">submit</A>
                                    </td>
                                    <td class="<%=even?"statLt":"statDk"%>" align="center">
                                        <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewStandings&<%=Constants.ROUND_ID%>=<tc-webtag:beanWrite name="contest" property="roundID"/>">standings</A>
                                    </td>
                                </tr>
                                <%even = !even;%>
                            </logic:iterate>
                        </TABLE>
                    </TD>
                </tr>
            </TABLE>


        </td>

        <%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <%-- Right Column Ends --%>

        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
    </tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>