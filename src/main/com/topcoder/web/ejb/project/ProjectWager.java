package com.topcoder.web.ejb.project;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 17, 2006
 */
public interface ProjectWager extends EJBObject {
    void createProjectWager(long projectId, long userId, int wagerAmount, String dataSource)  throws RemoteException;
    void updateProjectWager(long projectId, long userId, int wagerAmount, String dataSource) throws RemoteException;
    boolean exists(long projectId, long userId, String dataSource) throws RemoteException;
    int getWager(long projectId, long userId, String dataSource) throws RemoteException;
}
