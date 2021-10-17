package com.dvt.service;

import com.dvt.pojos.Trip;

import java.util.List;

public interface ITripService extends IGenericsServevice<Trip>{
    public List<Trip> getTrips(int sPointId, int ePointId, String sDate);
}
