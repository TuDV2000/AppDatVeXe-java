package com.dvt.service.implement;

import com.dvt.pojos.Trip;
import com.dvt.repository.ITripRepository;
import com.dvt.service.ITripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TripService extends GenericsService<Trip> implements ITripService {
    @Autowired
    ITripRepository tripRepository;

    @Override
    public List<Trip> getTrips(int sPointId, int ePointId, String sDate) {
        System.out.println("servvice: " + sDate);
        return tripRepository.getTrips(sPointId, ePointId, sDate);
    }
}
