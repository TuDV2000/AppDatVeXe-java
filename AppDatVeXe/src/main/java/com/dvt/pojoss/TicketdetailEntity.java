package com.dvt.pojoss;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "ticketdetail", schema = "bookticketsdb_java", catalog = "")
public class TicketdetailEntity implements Serializable {
    private long id;
    private String seatPosition;
    private String note;
    private long ticketId;
    private Long vehicleId;
    private int currentPrice;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "seat_position")
    public String getSeatPosition() {
        return seatPosition;
    }

    public void setSeatPosition(String seatPosition) {
        this.seatPosition = seatPosition;
    }

    @Basic
    @Column(name = "note")
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Basic
    @Column(name = "ticket_id")
    public long getTicketId() {
        return ticketId;
    }

    public void setTicketId(long ticketId) {
        this.ticketId = ticketId;
    }

    @Basic
    @Column(name = "vehicle_id")
    public Long getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(Long vehicleId) {
        this.vehicleId = vehicleId;
    }

    @Basic
    @Column(name = "current_price")
    public int getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(int currentPrice) {
        this.currentPrice = currentPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TicketdetailEntity that = (TicketdetailEntity) o;

        if (id != that.id) return false;
        if (ticketId != that.ticketId) return false;
        if (currentPrice != that.currentPrice) return false;
        if (seatPosition != null ? !seatPosition.equals(that.seatPosition) : that.seatPosition != null) return false;
        if (note != null ? !note.equals(that.note) : that.note != null) return false;
        if (vehicleId != null ? !vehicleId.equals(that.vehicleId) : that.vehicleId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (seatPosition != null ? seatPosition.hashCode() : 0);
        result = 31 * result + (note != null ? note.hashCode() : 0);
        result = 31 * result + (int) (ticketId ^ (ticketId >>> 32));
        result = 31 * result + (vehicleId != null ? vehicleId.hashCode() : 0);
        result = 31 * result + currentPrice;
        return result;
    }
}
