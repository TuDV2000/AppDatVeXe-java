package com.dvt.repository.implement;

import com.dvt.pojos.Line;
import com.dvt.pojos.Trip;
import com.dvt.repository.ITripRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Repository
@Transactional
public class TripRepository extends GenericsRepository<Trip> implements ITripRepository {

    @Override
    public List<Trip> getTrips(int sPointId, int ePointId, String sDate) {
        System.out.println("repo: " + sDate);
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date sd = formatter.parse(sDate);
            Date ed = (Date) sd.clone();
            ed.setTime(ed.getTime() + 86400000);
            System.out.println("sd: " + sd);
            System.out.println("ed: " + ed);
            if (sPointId != 0 && ePointId != 0) {

                String hql1 = "from Line where startPoint.id = :idSPoint and endPoint.id = :idEPoint";
                Line l = (Line) getCurrentSession().createQuery(hql1)
                        .setParameter("idSPoint", sPointId)
                        .setParameter("idEPoint", ePointId)
                        .getSingleResult();
                return l.getTrips().stream().filter(t ->
                        t.getStartTime().getTime() >= sd.getTime() && t.getStartTime().getTime() < ed.getTime()
                        ).collect(Collectors.toList());
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
