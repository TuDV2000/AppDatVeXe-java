package com.dvt.repository;

import com.dvt.pojos.Feedback;

public interface IFeedbackRepository extends IGenericsRepository<Feedback> {
    public String getContentFBByTripAndUser(int tripId, int userId);
}
