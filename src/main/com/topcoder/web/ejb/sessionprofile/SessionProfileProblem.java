package com.topcoder.web.ejb.sessionprofile;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Dec 19, 2002 10:32:26 PM
 */
public interface SessionProfileProblem extends EJBObject {

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @param sortOrder
     * @throws RemoteException
     */
    public void createSessionProfileProblem(long sessionProfileId,
                                            long problemId,
                                            int problemTypeId,
                                            int sortOrder)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param problemTypeId
     * @throws RemoteException
     */
    public void setProblemTypeId(long sessionProfileId,
                                 long problemId,
                                 int problemTypeId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @param sortOrder
     * @throws RemoteException
     */
    public void setSortOrder(long sessionProfileId, long problemId,
                             int sortOrder)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return
     * @throws RemoteException
     */
    public int getProblemTypeId(long sessionProfileId, long problemId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return
     * @throws RemoteException
     */
    public int getSortOrder(long sessionProfileId, long problemId)
            throws RemoteException;

    /**
     *
     * @param sessionProfileId
     * @param problemId
     * @return
     * @throws RemoteException
     */
    public String getProblemTypeDesc(long sessionProfileId, long problemId)
            throws RemoteException;

}