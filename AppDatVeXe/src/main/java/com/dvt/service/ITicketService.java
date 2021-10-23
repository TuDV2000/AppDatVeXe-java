package com.dvt.service;

import com.dvt.pojos.Ticket;

import java.util.List;

public interface ITicketService extends IGenericsServevice<Ticket>{
    public List<Ticket> getTicketsByTrip(int tripId);
}
