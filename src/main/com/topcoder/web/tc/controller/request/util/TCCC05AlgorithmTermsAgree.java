package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.WebAuthentication;

import java.util.Calendar;

/**
 * User: dok
 * Date: Dec 15, 2004
 * Time: 10:39:55 AM
 */
public class TCCC05AlgorithmTermsAgree extends TermsAgreeBase {
    //dammit, my kingdom for some multiple inheritance!!!
    private TCCC05AlgorithmTerms helper = new TCCC05AlgorithmTerms();

    /**
     * We need this method so that we can set the request on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     * @param request
     */
    public void setRequest(TCRequest request) {
        super.setRequest(request);
        helper.setRequest(request);
    }

    /**
     * We need this method so that we can set the response on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     * @param response
     */
    public void setResponse(TCResponse response) {
        super.setResponse(response);
        helper.setResponse(response);
    }

    /**
     * We need this method so that we can set the authentication on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     * @param auth
     */
    public void setAuthentication(WebAuthentication auth) {
        super.setAuthentication(auth);
        helper.setAuthentication(auth);
    }

    public Calendar getEnd() {
        return helper.getEnd();
    }

    public Calendar getBeginning() {
        return helper.getBeginning();
    }

    public String getEventName() {
        return helper.getEventName();
    }

    public int getTermsId() {
        return helper.getTermsId();
    }

    protected void setSuccessPage() {
        setNextPage("/tc");
        setIsNextPageInContext(false);
    }

    public boolean isEligible() throws Exception {
        return helper.isEligible();
    }
}
