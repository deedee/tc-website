package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.dao.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public class DAOFactoryHibernate implements DAOFactory  {
    public AlgoRatingTypeDAO getAlgoRatingTypeDAO() {
        return new AlgoRatingTypeDAOHibernate();
    }

    public CoderDAO getCoderDAO() {
        return new CoderDAOHibernate();
    }

    public CoderTypeDAO getCoderTypeDAO() {
        return new CoderTypeDAOHibernate();
    }

    public CompanyDAO getCompanyDAO() {
        return new CompanyDAOHibernate();
    }

    public ContactDAO getContactDAO() {
        return new ContactDAOHibernate();
    }

    public CountryDAO getCountryDAO() {
        return new CountryDAOHibernate();
    }

    public DemographicAnswerDAO getDemographicAnswerDAO() {
        return new DemographicAnswerDAOHibernate();
    }

    public DemographicQuestionDAO getDemographicQuestionDAO() {
        return new DemographicQuestionDAOHibernate();
    }

    public DemographicAssignmentDAO getDemographicAssignmentDAO() {
        return new DemographicAssignmentDAOHibernate();
    }

    public FileTypeDAO getFileTypeDAO() {
        return new FileTypeDAOHibernate();
    }

    public NotificationDAO getNotificationDAO() {
        return new NotificationDAOHibernate();
    }

    public RegistrationTypeDAO getRegistrationTypeDAO() {
        return new RegistrationTypeDAOHibernate();
    }

    public SchoolDAO getSchoolDAO() {
        return new SchoolDAOHibernate();
    }

    public SchoolTypeDAO getSchoolTypeDAO() {
        return new SchoolTypeDAOHibernate();
    }

    public SecurityGroupDAO getSecurityGroupDAO() {
        return new SecurityGroupDAOHibernate();
    }

    public StateDAO getStateDAO() {
        return new StateDAOHibernate();
    }

    public TeamDAO getTeamDAO() {
        return new TeamDAOHibernate();
    }

    public TeamTypeDAO getTeamTypeDAO() {
        return new TeamTypeDAOHibernate();
    }

    public TimeZoneDAO getTimeZoneDAO() {
        return new TimeZoneDAOHibernate();
    }

    public UserDAO getUserDAO() {
        return new UserDAOHibernate();
    }
}
