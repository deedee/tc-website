<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Algoritm Competition Qualification" area="algorithm" menu="advancers"
                 subMenu="qualification"/>

<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.tournament.AdvancersBase" %>

<%-- Setting up constants to use JSTL --%>
<c:set var="START_RANK" value="<%=DataAccessConstants.START_RANK%>" />
<c:set var="NUMBER_RECORDS" value="<%=DataAccessConstants.NUMBER_RECORDS%>" />
<c:set var="NUMBER_PAGE" value="<%=DataAccessConstants.NUMBER_PAGE%>" />
<c:set var="SORT_DIRECTION" value="<%=DataAccessConstants.SORT_DIRECTION%>" />
<c:set var="SORT_COLUMN" value="<%=DataAccessConstants.SORT_COLUMN%>" />
<c:set var="FULL_LIST" value="<%=AdvancersBase.FULL_LIST%>" />
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>" />
<c:set var="HANDLE" value="<%=Constants.HANDLE%>" />
<c:set var="sortColumn" value="${param[SORT_COLUMN]}"/>
<c:set var="sortDirection" value="${param[SORT_DIRECTION]}"/>

<%-- This had to be done because ResultSetContainer getters does not follow standards --%>
<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>
<c:set var="croppedDataBefore" value="<%=rsc.croppedDataBefore()%>"/>
<c:set var="croppedDataAfter" value="<%=rsc.croppedDataAfter()%>"/>
<c:set var="handleSortColumnIndex" value="<%=rsc.getColumnIndex("handle_sort")%>"/>
<c:set var="ratingColumnIndex" value="<%=rsc.getColumnIndex("rating")%>"/>
<c:set var="roundNameColumnIndex" value="<%=rsc.getColumnIndex("round_name")%>"/>
<c:set var="pointsColumnIndex" value="<%=rsc.getColumnIndex("points")%>"/>
<c:set var="rsc" value="<%=rsc%>"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
    <script type="text/javascript">
        function next() {
            var myForm = document.advancersForm;
            myForm.${START_RANK}.value= parseInt(myForm.${START_RANK}.value) +
                parseInt(myForm.${NUMBER_RECORDS}.value);
            myForm.${SORT_COLUMN}.value='${empty sortColumn ? "" : sortColumn}';
            myForm.${SORT_DIRECTION}.value='${empty sortDirection ? "" : sortDirection}';
            myForm.submit();
        }

        function previous() {
            var myForm = document.advancersForm;
            myForm.${START_RANK}.value-=parseInt(myForm.${NUMBER_RECORDS}.value);
            myForm.${SORT_COLUMN}.value='${empty sortColumn ? "" : sortColumn}';
            myForm.${SORT_DIRECTION}.value='${empty sortDirection ? "" : sortDirection}';
            myForm.submit();
        }
    </script>
</head>

<body>

<div id="wrapper" class="homepage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main conent right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
                    <div class="text">
                        <h2 class="pageTitle">Algorithm Competition Qualification</h2>

                        <form name="advancersForm" action='${sessionInfo.servletPath}' method="get">
                            <tc-webtag:hiddenInput name="${MODULE_KEY}" value="AlgorithmQualification"/>
                            <tc-webtag:hiddenInput name="${SORT_COLUMN}"/>
                            <tc-webtag:hiddenInput name="${SORT_DIRECTION}"/>
                            <tc-webtag:hiddenInput name="${FULL_LIST}"/>

                            <div class="buttons_bar">
                                <div class="left">
                                    <a href="${sessionInfo.servletPath}?module=AlgorithmQualification"
                                       class="button">Reset Sorting</a>
                                    <a href="${sessionInfo.servletPath}?module=AlgorithmQualification&amp;full=false"
                                       class="button ${requestScope.full ? 'off' : ''}">Page View</a>
                                    <a href="${sessionInfo.servletPath}?module=AlgorithmQualification&amp;full=true"
                                       class="button ${requestScope.full ? '' : 'off'}">Full View</a>

                                </div>
                                <div class="right">
                                    <tco10:paginationLinks previousAvailable="${croppedDataBefore}"
                                                           nextAvailable="${croppedDataAfter}"/>
                                </div>
                            </div>

                            <!-- Leader board -->
                            <table cellpadding="0" cellspacing="0" class="leaderboard"><!-- Start table list -->
                                <tr>
                                    <th class="first handle">
                                        <tco10:sortColumnLink text="Handle" columnIndex="${handleSortColumnIndex}"/>
                                        <tc-webtag:textInput name="${HANDLE}" size="12"
                                                             style="border: 1px solid #999999; color: #999999;"
                                                             onClick="this.style.color='#333333';"
                                                             maxlength="100"/>
                                    </th>
                                    <th class="rating">
                                        <tco10:sortColumnLink text="Round" columnIndex="${roundNameColumnIndex}"/>
                                    </th>
                                    <th class="rating">
                                        <tco10:sortColumnLink text="Rating" columnIndex="${ratingColumnIndex}"/>
                                    </th>
                                    <th class="last"><span class="right"></span>
                                        <tco10:sortColumnLink text="Points" columnIndex="${pointsColumnIndex}"/>
                                    </th>
                                </tr>

                                <%-- formatting this crappy to save space in the download to the client --%>
                                <c:forEach items="${rsc}" var="resultRow" varStatus="index">
                                    <tr>
                                        <td class="handle">
                                            <p>
                                                <span class="high"><tc-webtag:handle coderId="${resultRow.map['coder_id']}"
                                                                  context="algorithm"/></span>
                                            </p>
                                        </td>
                                        <td><c:out value="${resultRow.map['round_name']}" default="Bye"/></td>
                                        <td>${resultRow.map["rating"]}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${resultRow.map['points']==null}">Bye</c:when>
                                                <c:otherwise>
                                                    <fmt:formatNumber value="${resultRow.map['points']}" pattern="#.00"/>
                                                </c:otherwise>
                                            </c:choose></td>
                                    </tr>
                                </c:forEach>
                            </table>

                            <div class="paging">
                                <div class="show">
                                    <p>
                                        Show:
                                        <select name="${NUMBER_RECORDS}">
                                            <option>20</option>
                                            <option>30</option>
                                            <option>40</option>
                                        </select>
                                        &nbsp;Item/Page
                                    </p>
                                </div>

                                <div class="gopage">
                                    <p>Page:
                                        <tc-webtag:textInput name="${NUMBER_PAGE}" size="4" maxlength="4"/>
                                        <button name="nameSubmit" value="submit" type="submit" class="button small">GO</button>
                                    </p>
                                </div>

                                <div class="nextprev">
                                    <tco10:paginationLinks previousAvailable="${croppedDataBefore}"
                                                           nextAvailable="${croppedDataAfter}"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
