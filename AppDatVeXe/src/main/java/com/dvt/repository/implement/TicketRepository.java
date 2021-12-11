package com.dvt.repository.implement;

import com.dvt.pojos.Ticket;
import com.dvt.pojos.TicketDetail;
import com.dvt.pojos.Trip;
import com.dvt.repository.ITicketRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class TicketRepository extends GenericsRepository<Ticket> implements ITicketRepository {

    @Override
    public List<Ticket> getTicketsByTrip(int tripId) {
        if (tripId > 0) {
            String hql = "from Trip where id = :id";
            Trip t = (Trip) getCurrentSession().createQuery(hql)
                    .setParameter("id", tripId).getSingleResult();
            if (t != null)
                return t.getTickets();
        }
        return null;
    }
    @Override
    public TicketDetail getTicketsDeTailByTicktetId(int ticketId){
        if (ticketId > 0) {
            String hql = "from TicketDetail where ticket.id = :id";
            TicketDetail t = (TicketDetail) getCurrentSession().createQuery(hql)
                    .setParameter("id", ticketId).getSingleResult();
            if (t != null)
                return t;
        }
        return null;
    }
}
