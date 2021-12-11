package com.dvt.repository;

import com.dvt.pojos.Ticket;
import com.dvt.pojos.TicketDetail;

import java.util.List;

public interface ITicketRepository extends IGenericsRepository<Ticket>{
    public List<Ticket> getTicketsByTrip(int tripId);
    public TicketDetail getTicketsDeTailByTicktetId(int ticketId);
}
