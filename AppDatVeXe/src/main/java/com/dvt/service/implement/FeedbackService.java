package com.dvt.service.implement;

import com.dvt.pojos.Feedback;
import com.dvt.service.IFeedbackService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FeedbackService extends GenericsService<Feedback> implements IFeedbackService {
}
