package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.servlet.http.*;
import java.io.Serializable;
import java.util.Map;

/**
 * A bean performing TCES Authentication and using given HttpSession objects for persistence
 * @author bigjake <kitz@mit.edu>
 *
 */

public class Authentication implements Serializable {
    private static Logger log = Logger.getLogger(Authentication.class);

    public static int USER_NOT_LOGGED_IN = -1;

    /* Holds the id of the currently logged in user */
    private int userId;

    /* Holds an error message, if any, generated by the last authentication attempt, if any. */
    private String errorMessage;

    /* Holds the URL for which access was attempted */
    private String requestedURL;

    /** Attempts to authenticate a user and set him/her as logged in
     * @param handle The handle of the user for this authentication request
     * @param password The password of the user for this authentication request
     * @param ctx The InitialContext of the originating request
     * @param session The HttpSession of the originating request
     * @param requestedURL The URL being requested
     * @return A boolean indicating whether the login attempt was a success.
     */
    public static boolean attemptLogin(String handle, String password, InitialContext ctx, HttpSession session, String requestedURL) {
        try {
            Authentication auth;

            if ( (auth=(Authentication)session.getAttribute("tces_auth"))==null) {
                auth = new Authentication();
                session.setAttribute("tces_auth", auth);
            }

            auth.setUserId(USER_NOT_LOGGED_IN);
            auth.setRequestedURL(requestedURL);

            Request dataRequest = new Request();
            dataRequest.setContentHandle("tces_user_and_pw");
            dataRequest.setProperty("hn", handle );
            DataAccessInt dai = new DataAccess((javax.sql.DataSource)ctx.lookup(DBMS.OLTP_DATASOURCE_NAME));
            Map resultMap = dai.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_User_And_Password");

            if (rsc.getRowCount() == 0) {
                auth.setErrorMessage("Incorrect handle.  Please retry.");
                return false;
            }

            ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);
            String actualPassword = rRow.getItem("password").toString();
            if (actualPassword == null) {
                auth.setErrorMessage("Incorrect login.  Please retry.");
                return false;
            }

            if (!actualPassword.trim().equals(password.trim())) {
                auth.setErrorMessage("Incorrect password.  Please retry.");
                return false;
            }

            // record in this session that we have authenticated a user.

            auth.setUserId( ((Long)rRow.getItem("user_id").getResultData()).intValue() );
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    /** Indicates whether a user is authenticated within the given session
     * @param session The HttpSession of the originating request
     * @return A boolean indicating whether a user is authenticated within the given session
     */
    public static boolean isLoggedIn(HttpSession session) {
        log.debug("isLoggedIn called...");
        Authentication auth = (Authentication)session.getAttribute("tces_auth");

        if (auth==null) {
            log.debug("no auth in session");
            return false;
        } else if (auth.getUserId()==USER_NOT_LOGGED_IN) {
            log.debug("user not logged in");
            return false;
        } else {
            log.debug("user logged in");
            return true;
        }
    }

    /** Indicates whether a user is authenticated within the given session, and the ID of that user
     * @param session The HttpSession of the originating request
     * @return The ID of the user authenticated, if any, within the given session
     */
    public static int userLoggedIn(HttpSession session) {
        Authentication auth = (Authentication)session.getAttribute("tces_auth");

        if (auth==null)
            return USER_NOT_LOGGED_IN;
        else
            return auth.getUserId();
    }


    private void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }


    /** Returns the error message generated by the last authentication attempt in the given session
     * @param session The HttpSession of the originating request
     * @return The authentication error message, if any, within the given session
     */
    public static String getErrorMessage(HttpSession session) {
        Authentication auth = (Authentication)session.getAttribute("tces_auth");

        if (auth==null)
            return "";
        else
            return auth.errorMessage;
    }

    /** Returns the requested URL during the last authentication attempt in the given session
     * @param session The HttpSession of the originating request
     * @return The requested URL during the last authentication attempt in the given session
     */
    public static String getRequestedURL(HttpSession session) {
        Authentication auth = (Authentication)session.getAttribute("tces_auth");

        if (auth==null)
            return "";
        else
            return (auth.requestedURL==null?"":auth.requestedURL);
    }

    public static void resetRequestedURL(HttpSession session) {
        Authentication auth = (Authentication)session.getAttribute("tces_auth");

        if (auth!=null)
            auth.requestedURL="";
    }

    private void setUserId(int userId) {
        this.userId=userId;
    }

    private int getUserId() {
        return userId;
    }

    private void setRequestedURL(String requestedURL) {
        this.requestedURL = requestedURL;
    }
}
