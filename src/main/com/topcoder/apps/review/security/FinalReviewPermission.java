/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.security;

import com.topcoder.security.policy.TCPermission;

/**
 * This class implements the final review permission for the security manager.
 *
 * @author adic
 * @version 1.0
 */
public class FinalReviewPermission extends TCPermission {

    /**
     * The ID of the project.
     */
    private long projectId = 0;

    /**
     * Constructor.
     *
     * @param projectId the ID of the project
     */
    public FinalReviewPermission(long projectId) {
        super(FinalReviewPermission.class.getName() + " " + projectId);
        this.projectId = projectId;
    }

    /**
     * Get the ID of the project ID.
     *
     * @return the ID of the project
     */
    public long getProjectId() {
        return projectId;
    }

}

