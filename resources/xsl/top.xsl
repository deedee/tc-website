<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="menu.xsl"/>
  <xsl:import href="includes/modules/rating.xsl"/>
  <xsl:import href="script.xsl"/>
  <!-- <xsl:import href="../includes/modules/rating.xsl"/> -->  
  <xsl:output indent="no" method="html"/>
  <xsl:template match="/">
    <xsl:call-template name="Top"/>
  </xsl:template>
  <xsl:template name="Top">
  <xsl:param name="sectionName"></xsl:param>

<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">    
    <tr valign="middle">
        <td><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
        <td nowrap="0" class="registerToday"><span class="time">Current Member Count</span>&#160;:&#160; <xsl:value-of select="format-number(/TC/MemberCount,'#,##0')"/> - <span class="time"><xsl:call-template name="DateTime"/></span><a href="Javascript:tcTime()" class="statText">[Get Time]</a></td>
        <td width="99%" align="right" class="login" nowrap="0">

            <xsl:choose>
                <xsl:when test="/TC/LoggedIn='true'">
                    <strong>Hello, </strong>
                    <A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
                    <xsl:attribute name="class"><xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="/TC/Rating"/></xsl:with-param></xsl:call-template></xsl:attribute>
                    <xsl:value-of select="/TC/Handle"/>
                    </A>
                    &#160;&#160;|&#160;&#160;<A class="loginLinks" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?&amp;module=Logout</xsl:attribute>Logout</A>
                    &#160;&#160;|&#160;&#160;<A class="loginLinks" target="_parent"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Update Profile</A>
                </xsl:when>
                <xsl:otherwise>
                    <A class="loginLinks" target="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/tc?&amp;module=Login</xsl:attribute>Login</A>
                    &#160;&#160;|&#160;&#160;<A class="loginLinks" target="_parent"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Register</A>
                </xsl:otherwise>
            </xsl:choose>
            
            &#160;&#160;|&#160;&#160;<A target="_parent" class="loginLinks"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/></xsl:attribute>Home</A>
        </td>
        <td><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
    </tr>
</table> 

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">    
    <tr><td width="100%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>                
</table> 

<!-- Logo Bar Include Begins -->       
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">            
    <tr valign="middle">
        <td width="15"><a name="top"></a><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <td width="206">
          <a target="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/</xsl:attribute>
            <img src="/i/logo.gif" width="206" height="49" border="0" vspace="5"/>
          </a>
        </td>
        <td width="20"><img src="/i/clear.gif" width="1" height="1" border="0" hspace="15"/></td>
        <td nowrap="" align="right">

<xsl:choose>
    <xsl:when test="/TC/LoggedIn='true'">
            <table width="99%" border="0" cellpadding="0" cellspacing="0" bgcolor="#333333">            
                <tr valign="middle"><form name="selectform">
                    <td width="99%" align="left">
                        <xsl:choose>
                            <xsl:when test="number(/TC/Rating)&lt;1200">
                                <IMG src="/i/top_div2_badge.jpg" width="390" height="75" border="0" alt="DIVISION II" />
                            </xsl:when>
                            <xsl:otherwise>
                                <IMG src="/i/top_div1_badge.jpg" width="370" height="75" border="0" alt="DIVISION I" />
                            </xsl:otherwise>
                        </xsl:choose>

                    <td align="right">
                        <xsl:choose>
                            <xsl:when test="$sectionName='home'">
                                <A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/SoftwareHost"/>/components/free_components.jsp</xsl:attribute><IMG src="/i/promos/free_comps_promo_head.gif" width="178" height="61" border="0" alt="FREE COMPONENTS" vspace="7"  hspace="10" /></A>
                            </xsl:when>
                            <xsl:otherwise>
                                <img src="/i/clear.gif" alt="" width="10" height="75" border="0" /><br />
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    
                    <td align="right">
                        <select name="quickstat" size="1" class="dropdown" onchange="window.location=this.options[this.selectedIndex].value">      
                            <option value="SELECTED"> Select a Feature: </option>
                            <option><xsl:attribute name="value">/stat?c=member_profile&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Profile</option>
                            <option><xsl:attribute name="value">/stat?c=ratings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Rating History</option>
                            <option><xsl:attribute name="value">/stat?c=earnings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Earnings History</option>
                            <option><xsl:attribute name="value">/stat?c=coder_room_stats&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Room Statistics</option> 
                            <option><xsl:attribute name="value">/stat?c=round_stats</xsl:attribute>Round Statistics</option>
                            <option><xsl:attribute name="value">/index?t=search</xsl:attribute>Advanced Member Search</option> 
                            <option><xsl:attribute name="value">/PactsMemberServlet</xsl:attribute>Affidavits</option> 
                            <option><xsl:attribute name="value">/index?t=search&amp;c=refer</xsl:attribute>My Referrals</option>
                            <option><xsl:attribute name="value">/index?t=development&amp;c=index</xsl:attribute>Development</option>
                            <option><xsl:attribute name="value">/index?t=tces&amp;c=index</xsl:attribute>TCES (jobs)</option> 
                        </select>
                    </td>

                    <td width="10"><img src="/i/clear.gif" width="10" height="75" border="0"/></td></form>
                </tr>                                 
            </table>
    </xsl:when>             
            
    <xsl:otherwise>
            <table width="99%" border="0" cellpadding="0" cellspacing="0">            
                <tr>
                    <td align="right" width="99%">
                        <xsl:choose>
                            <xsl:when test="$sectionName='home'">
                                <A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/SoftwareHost"/>/components/free_components.jsp</xsl:attribute><IMG src="/i/promos/free_comps_promo_head.gif" width="178" height="61" border="0" alt="FREE COMPONENTS" vspace="7" hspace="10" /></A>
                            </xsl:when>
                            <xsl:otherwise>
                                <img src="/i/clear.gif" alt="" width="10" height="75" border="0" /><br />
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td width="1"><img src="/i/clear.gif" width="1" height="75" border="0"/></td>
                </tr>           
            </table>                    
    </xsl:otherwise>
</xsl:choose>                
        </td>        
    </tr>             
</table>

    <xsl:call-template name="TopMenu"/>

  </xsl:template>
</xsl:stylesheet>
