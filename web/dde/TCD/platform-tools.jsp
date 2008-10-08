<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
		
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<jsp:include page="/includes/header-files.jsp" />
<title>TopCoder Direct</title>

<script src="scripts/direct.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="/includes/top.jsp">
<jsp:param name="TCDlevel" value="platform"/>
</jsp:include>

<%-- PLATFORM TOOLS --%>
	<div id="platform">
		<div class="platform_row">
			<div>
				<a href="http://www.topcoder.com/direct/"><img src="images/topcoder_cockpit.png" alt="TopCoder Cockpit" width="131" height="131" class="platform_img" /></a>
				<h3><a href="http://www.topcoder.com/direct/"><img src="images/topcoder_cockpit_text.png" alt="TopCoder Cockpit" width="178" height="27" /></a><span class="sub_header"> - <a href="http://www.topcoder.com/direct/">LIVE! ACCESS THE COMMUNITY NOW!</a></span></h3>				
				<p class="red-title">Engage the TopCoder Community.</p>
				<p>The Cockpit is your tool for accessing the TopCoder Community to get your project built. You can launch and monitor a project, view and choose winners for your competitions, pay for and download your finished product, all through the functional widgets in your TC Direct Cockpit.</p>
			</div>
		</div><%-- platform_row ends--%>
		<div class="platform_row_dark">
			<div>
				<a href="http://software.dev.topcoder.com/catalog/index.jsp"><img src="images/component_catalog.png" alt="Component Catalog" class="platform_img" /></a>
				<h3><a href="http://software.dev.topcoder.com/catalog/index.jsp"><img src="images/component_catalog_text.png" alt="Component Catalog" width="204" height="29" /></a><span class="sub_header"> - <a href="http://software.dev.topcoder.com/catalog/index.jsp">VIEW AND DOWNLOAD COMPONENTS NOW!</a></span></h3>				
				<p class="red-title">Reuse, because you can.</p>
				<p>Topcoder's catalog of re-usable components, TopCoder delivers high-quality software at a lower cost than the competition.</p>
			</div>
		</div><%-- platform_row_dark ends--%>
		<div class="platform_row">
			<div>
			  <img src="images/control_panel.png" alt="Control Panel" class="platform_img" />
			  <h3><img src="images/control_panel_text.png" alt="Control Panel" width="139" height="22" /></h3>
			  <p class="red-title">Getting your project moving forward.</p>
				<p>Administrators can vary from TopCoder staff, members, or even clients in TopCoder Direct. These are the people that help make the contests happen, ensure they run smoothly and handle all of the little details along the way.</p>
			</div>
	  </div><%-- platform_row ends--%>
		<div class="platform_row_dark">
			<div>
			  <img src="images/online_review.png" alt="Online Review" class="platform_img" />
			  <h3><img src="images/online_review_text.png" alt="Online Review" width="149" height="22" /></h3>
			  <p class="red-title">Peer review just makes the process better.</p>
				<p>Online review is a workflow monitoring solution that provides full transparency into the TopCoder process.</p>
			</div>
	  </div><%-- platform_row_dark ends--%>
		<div class="platform_row">
			<div>
				<a href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=umltool&d3=description&node=des_uml_tool"><img src="images/uml_tool.png" alt="UML Tool" class="platform_img" /></a>
				<h3><a href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=umltool&d3=description&node=des_uml_tool"><img src="images/uml_tool_text.png" alt="UML Tool" width="92" height="22" /></a><span class="sub_header"> - <a href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=umltool&d3=description&node=des_uml_tool">VIEW AND DOWNLOAD THE UML TOOL NOW!</a></span></h3>				
				<p class="red-title">Software by the community for the community.</p>
				<p>The UML Tool is a XML compliant UML tool geared towards the TopCoder process.</p>
			</div>
		</div><%-- platform_row ends--%>
		<div class="platform_row_dark">
			<div>
				<a href="http://forums.topcoder.com/"><img src="images/forums.png" alt="Forums" class="platform_img" /></a>
				<h3><a href="http://forums.topcoder.com/"><img src="images/forums_text.png" alt="Forums" width="75" height="22" /></a><span class="sub_header"> - <a href="http://forums.topcoder.com/">VISIT THE TOPCODER COMMUNITY!</a></span></h3>				
				<p class="red-title">Communicate.</p>
				<p>Allows collaboration with top technical talent from across the world. Used to discuss the latest technologies, best practices, and to answer or clarify any contest-related questions.</p>
			</div>
		</div><%-- platform_row_dark ends--%>

	</div><%-- platform ends --%>

<%-- Footer begins --%>
<jsp:include page="/includes/foot.jsp" flush="true" />
<%-- Footer ends --%>
	

	
</body>
</html>