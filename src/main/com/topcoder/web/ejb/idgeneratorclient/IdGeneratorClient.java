package com.topcoder.web.ejb.idgeneratorclient;

import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;

/**
 *
 * The Client which uses the IdGenerator component to generate
 * an long sequence id for any sequence name in the Screening Database
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$ 
 * Dec 23, 2002 6:44:37 PM
 */
public class IdGeneratorClient {

    private static final String dataSourceName = "SCREENING_OLTP";
    private static final Logger log = Logger.getLogger(IdGeneratorClient.class);

    /**
     * Uses the IdGenerator class to retrieve a sequence value for the
     * sequence name given. Will initialize the IdGenerator if not initialized
     * yet.
     *
     * @param seqName
     * @return The next sequence val. -1 if there is an exception thrown
     * or other error retrieving the sequence id.
     */

    public static long getSeqId ( String seqName ) {

        log.debug("getSeqId called");
        long retVal = -1;
        InitialContext ctx = null;

        try {
            ctx = new InitialContext();
            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(),
                                (DataSource)ctx.lookup(dataSourceName),
                                "sequence_object",
                                "name",
                                "current_value",
                                9999999999L,
                                1,
                                true);
            }
            retVal = IdGenerator.nextId(seqName);
            System.out.println("retVal = " + retVal);
        }
        catch (NamingException e) {
            log.debug("NamingException occured within getSeqId" + e.toString());
        }
        catch (SQLException e) {
            log.debug("SQLException occured within getSeqId" + e.toString());
        }
        return retVal;
    }

    public static void main(String[] args) {
    }
}
