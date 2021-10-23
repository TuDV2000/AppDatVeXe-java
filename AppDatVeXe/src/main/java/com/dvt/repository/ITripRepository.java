package com.dvt.repository;

import com.dvt.pojos.Trip;

import java.util.List;

public interface ITripRepository extends IGenericsRepository<Trip>{
    public Trip getTripById(int id);
    public List<Trip> getTrips(int lineId);
    public Trip getTrip(int sPointId, int ePointId, String sDate);
}
