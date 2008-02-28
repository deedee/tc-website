package com.topcoder.web.ejb.security;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.admin.PrincipalMgrLocal;
import com.topcoder.security.policy.GenericPermission;
import com.topcoder.security.policy.PolicyLocal;
import com.topcoder.shared.security.Resource;
import com.topcoder.web.common.security.Constants;

import javax.ejb.Stateless;
import javax.naming.NamingException;
import java.lang.reflect.InvocationTargetException;

/**
 * @author dok
 * @version $Id$
 *          Create Date: Feb 28, 2008
 */
@Stateless
public class AuthorizationBean implements AuthorizationLocal, AuthorizationRemote {
    public boolean hasPermission(long userId, Resource resource) {
        try {
            PolicyLocal pl = (PolicyLocal) com.topcoder.web.common.security.Constants.createLocalEJB(PolicyLocal.class);
            PrincipalMgrLocal pmgr = (PrincipalMgrLocal) Constants.createLocalEJB(PrincipalMgrLocal.class);
            try {
                return pl.checkPermission(pmgr.getUserSubject(userId), new GenericPermission(resource.getName()));
            } catch (NoSuchUserException e) {
                return false;
            }
        } catch (NamingException e) {
            throw new GeneralSecurityException(e);
        } catch (InvocationTargetException e) {
            throw new GeneralSecurityException(e);
        } catch (com.topcoder.security.GeneralSecurityException e) {
            throw new GeneralSecurityException(e);
        } catch (NoSuchMethodException e) {
            throw new GeneralSecurityException(e);
        } catch (IllegalAccessException e) {
            throw new GeneralSecurityException(e);
        }
    }
}