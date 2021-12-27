package com.dvt.repository.implement;

import com.dvt.pojos.Feedback;
import com.dvt.repository.IFeedbackRepository;
import com.dvt.repository.ITripRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;

@Repository
@Transactional
public class FeedbackRepository extends GenericsRepository<Feedback> implements IFeedbackRepository {
    @Autowired
    ITripRepository tripRepository;

    @Override
    public String getContentFBByTripAndUser(int tripId, int userId) {
        String hql = "from Feedback where trip.id = :tripId and customer.id = :userId";
        try {
            Feedback fb = (Feedback) getCurrentSession().createQuery(hql)
                    .setParameter("tripId", tripId)
                    .setParameter("userId", userId)
                    .getSingleResult();
            return fb.getContent();
        } catch (NoResultException e) {
            e.printStackTrace();
        }
        return null;
    }
}
