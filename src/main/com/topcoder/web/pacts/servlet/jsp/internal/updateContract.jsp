<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>PACTS</title>
</head>

<body>

<%@ page import="com.topcoder.web.pacts.common.*" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.*" %>
<%
	Contract contract = (Contract)
		request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
	String text = (String)
		request.getAttribute("text");
	ResultSetContainer stati = (ResultSetContainer)
		request.getAttribute(PactsConstants.STATUS_CODE_LIST);
	ResultSetContainer contractTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.CONTRACT_TYPE_LIST);
	String message = (String)
		request.getAttribute("message");
	if (message == null) {
		message = "";
	} else if (contract != null) {
		String param;
		param = request.getParameter("name");
		if (param != null) contract._header._name = param;
		param = request.getParameter("contract_desc");
		if (param != null) contract._description = param;
		param = request.getParameter("start_date");
		if (param != null) contract._startDate = param;
		param = request.getParameter("end_date");
		if (param != null) contract._endDate = param;
		param = request.getParameter("text");
		if (param != null) text = param;
		param = request.getParameter("status_id");
		try { if (param != null) contract._header._statusId = Integer.parseInt(param); } catch (Exception e) {}
		param = request.getParameter("contract_type_id");
		try { if (param != null) contract._header._typeID = Integer.parseInt(param); } catch (Exception e) {}
	}
	if (contract == null) {
		out.println("no contract!!!<br>");
		contract = new Contract();
	}
%>

<h1>PACTS</h1>
<h2>Update Contract</h2>

<%		out.print("<font color=\"#FF0000\">" + message + "</font>");
		out.print("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL);
		out.print("\" method=\"post\">");

		out.print("<input type=\"hidden\" name=\""+PactsConstants.TASK_STRING+"\" value=\""+PactsConstants.UPDATE_TASK+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CMD_STRING+"\" value=\""+PactsConstants.CONTRACT_CMD+"\">");
		out.print("<input type=\"hidden\" name=\""+PactsConstants.CONTRACT_ID+"\" value=\""+contract._header._id+"\">");
%>
		<table border="0" cellpadding="5" cellspacing="5">
		<tr>
		<td><b>User:</b></td>
<% 			out.print("<td><a href=\"");
			out.print(PactsConstants.INTERNAL_SERVLET_URL);
			out.print("?"+PactsConstants.TASK_STRING+"=");
			out.print(PactsConstants.VIEW_TASK+"&");
			out.print(PactsConstants.CMD_STRING+"=");
			out.print(PactsConstants.USER_CMD+"&");
			out.print(PactsConstants.USER_ID+"=");
			out.print(contract._header._user._id);
			out.print("\">"+contract._header._user._handle+"</a></td>\n");
%>
		</tr>
		<tr>
		<td><b>Name:</b></td><td>
<% out.print("<input type=text width=25 name=\"name\" value=\""+contract._header._name+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Description:</b></td><td>
<% out.print("<input type=text width=25 name=\"contract_desc\" value=\""+contract._description+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Start Date:</b></td><td>
<% out.print("<input type=text width=25 name=\"start_date\" value=\""+contract._startDate+"\">"); %>
		</td></tr>
		<tr>
		<td><b>End Date:</b></td><td>
<% out.print("<input type=text width=25 name=\"end_date\" value=\""+contract._endDate+"\">"); %>
		</td></tr>
		<tr>
		<td><b>Status:</b></td>
		<td>
		<select name="status_id">
<%		int rowCount;
		String s;
		int code;
		ResultSetContainer.ResultSetRow rsr;
		if (stati != null) {
			rowCount = stati.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = stati.getRow(n);
				out.print("<option value=");
				code = TCData.getTCInt(rsr,"status_id",0,true);
				out.print("" + code);
				s = TCData.getTCString(rsr,"status_desc","default status",true);
				if (code == contract._header._statusId) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td>
		</tr>
		<tr>
		<td><b>Type:</b></td><td>
		<select name="contract_type_id">
<%		if (contractTypes != null) {
			rowCount = contractTypes.getRowCount();
			for (int n = 0; n < rowCount; n++) {
				rsr = contractTypes.getRow(n);
				out.print("<option value=");
				code = TCData.getTCInt(rsr,"contract_type_id",0,true);
				out.print("" + code);
				s = TCData.getTCString(rsr,"contract_type_desc","default affidavit type",true);
				if (code == contract._header._typeID) {
					out.print(" selected");
				}
				out.print(">" + s + "</option>\n");
			}
		}
%>
		</select>
		</td></tr>
		<tr><td>Text:</td><td>
		<textarea name="text" rows=10 cols=80><% out.print(text); %></textarea>
		</td></tr>
</table>

<input type=submit>
</form>
<jsp:include page="/pacts/internal/InternalFooter.jsp" flush="true" />
</body>

</html>