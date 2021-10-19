package com.dvt.repository;

import com.dvt.pojos.Trip;

import java.util.List;

public interface ITripRepository extends IGenericsRepository<Trip>{
    public List<Trip> getTrips(int sPointId, int ePointId, String sDate);
}
