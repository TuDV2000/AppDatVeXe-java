package com.dvt.repository.implement;

import com.dvt.pojos.Feedback;
import com.dvt.repository.IFeedbackRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class FeedbackRepository extends GenericsRepository<Feedback> implements IFeedbackRepository {
}
