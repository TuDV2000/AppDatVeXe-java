package com.dvt.repository;

import com.dvt.pojos.Ticket;

import java.util.List;

public interface ITicketRepository extends IGenericsRepository<Ticket>{
    public List<Ticket> getTicketsByTrip(int tripId);
}
