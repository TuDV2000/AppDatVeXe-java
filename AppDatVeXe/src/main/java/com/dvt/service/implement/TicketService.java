package com.dvt.service.implement;

import com.dvt.pojos.Ticket;
import com.dvt.pojos.TicketDetail;
import com.dvt.repository.ITicketRepository;
import com.dvt.service.ITicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TicketService extends GenericsService<Ticket> implements ITicketService {
    @Autowired
    ITicketRepository ticketRepository;

    @Override
    public List<Ticket> getTicketsByTrip(int tripId) {
        return ticketRepository.getTicketsByTrip(tripId);
    }

    @Override
    public TicketDetail getTicketsDeTailByTicktetId(int ticketId){return ticketRepository.getTicketsDeTailByTicktetId(ticketId);}
}
