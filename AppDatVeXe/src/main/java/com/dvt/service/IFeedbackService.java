package com.dvt.service;

import com.dvt.pojos.Feedback;

public interface IFeedbackService extends IGenericsServevice<Feedback> {
    public String getContentFBByTripAndUser(int tripId, int userId);
}
