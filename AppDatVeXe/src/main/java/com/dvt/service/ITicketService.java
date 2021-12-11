package com.dvt.service;

import com.dvt.pojos.Ticket;
import com.dvt.pojos.TicketDetail;

import java.util.List;

public interface ITicketService extends IGenericsServevice<Ticket>{
    public List<Ticket> getTicketsByTrip(int tripId);
    public TicketDetail getTicketsDeTailByTicktetId(int ticketId);
}
