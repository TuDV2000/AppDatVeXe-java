package com.dvt.service.implement;

import com.dvt.pojos.Feedback;
import com.dvt.repository.IFeedbackRepository;
import com.dvt.service.IFeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FeedbackService extends GenericsService<Feedback> implements IFeedbackService {
    @Autowired
    IFeedbackRepository feedbackRepository;

    @Override
    public String getContentFBByTripAndUser(int tripId, int userId) {
        return feedbackRepository.getContentFBByTripAndUser(tripId, userId);
    }
}
