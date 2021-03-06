package com.topcoder.web.truveo.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.truveo.Constants;
import com.topcoder.web.truveo.dao.TruveoDAOFactory;
import com.topcoder.web.truveo.dao.TruveoDAOUtil;
import com.topcoder.web.truveo.model.Contest;
import com.topcoder.web.truveo.model.ContestStatus;
import com.topcoder.web.truveo.model.SubmissionType;

import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class ViewSubmission extends BaseSubmissionDataProcessor {

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            TruveoDAOFactory cFactory = TruveoDAOUtil.getFactory();
            DAOFactory factory = DAOUtil.getFactory();
            Long contestId;
            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Contest Specified");
            }

            Contest c = cFactory.getContestDAO().find(contestId);
            Date now = new Date();
            if (now.before(c.getStartTime()) ||
                    now.after(c.getEndTime()) ||
                    !ContestStatus.ACTIVE.equals(c.getStatus().getId())) {
                throw new NavigationException("Inactive contest specified.");
            }

            User u = factory.getUserDAO().find(getUser().getId());

            if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                throw new NavigationException("User not registered for the contest");
            }

            setDefault(Constants.CONTEST_ID, contestId.toString());
            setDefault(Constants.SUBMISSION_RANK, "1");
            loadSubmissionData(u, c, cFactory.getSubmissionDAO(), SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE);
            setNextPage("/submit.jsp");
            setIsNextPageInContext(true);

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
