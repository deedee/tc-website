package com.topcoder.web.ejb.ComponentRegistrationServices;

import javax.ejb.EJBException;
import javax.ejb.EJBObject;
import java.rmi.RemoteException;

public interface ComponentRegistrationServices extends EJBObject {
    /**
     * Number of days that a component will be open for registration.
     */
    public static final int COMPONENT_REGISTRATION_LENGTH = 3;

    boolean isUserRegistered(long projectId, long userId, String dataSource) throws RemoteException, EJBException;

    boolean isRegClosed(long projectId, String dataSource) throws RemoteException, EJBException;

    boolean hasUserReviewedProject(long projectId, long userId, String dataSource) throws RemoteException, EJBException;

    boolean isUserWinningDesigner(long projectId, long userId, String dataSource) throws RemoteException, EJBException;

    int getMaxUnratedRegistrants(long projectId, String dataSource) throws RemoteException, EJBException;

    int getMaxRatedRegistrants(long projectId, String dataSource) throws RemoteException, EJBException;

    int getUnratedRegistrantCount(long projectId, String dataSource) throws RemoteException, EJBException;

    int getRatedRegistrantCount(long projectId, String dataSource) throws RemoteException, EJBException;
}

