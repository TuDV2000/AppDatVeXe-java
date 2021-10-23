package com.dvt.service;

import com.dvt.pojos.Trip;

import java.util.List;

public interface ITripService extends IGenericsServevice<Trip>{
    public Trip getTripById(int id);
    public List<Trip> getTrips(int lineId);
    public Trip getTrip(int sPointId, int ePointId, String sDate);
}
