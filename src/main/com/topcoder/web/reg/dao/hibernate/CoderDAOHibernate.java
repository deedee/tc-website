package com.topcoder.web.reg.dao.hibernate;

import com.topcoder.web.reg.model.Coder;
import com.topcoder.web.reg.model.HSAlgoRating;
import com.topcoder.web.reg.model.TCAlgoRating;
import com.topcoder.web.reg.dao.CoderDAO;
import org.hibernate.Session;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class CoderDAOHibernate extends Base implements CoderDAO  {

    /**
     * Create a CoderDAO object using the default connection information.
     */
    public CoderDAOHibernate() {
        super();
    }

    public CoderDAOHibernate(Session session) {
        super(session);
    }


    public Coder find(Long id) {
        Coder ret = null;
        ret = (Coder) find(Coder.class, id);
        return ret;

    }

    public void saveOrUpdate(Coder u) {
        session.saveOrUpdate(u);
    }
}

