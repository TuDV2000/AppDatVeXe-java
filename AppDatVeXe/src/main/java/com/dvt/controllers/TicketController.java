package com.dvt.controllers;

import com.dvt.pojos.Ticket;
import com.dvt.pojos.Trip;
import com.dvt.service.ITicketService;
import com.dvt.service.ITripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TicketController {
    @Autowired
    ITripService tripService;
    @Autowired
    ITicketService ticketService;

    @GetMapping("/trip/{tripId}/book-ticket")
    public String showTicket(Model model, @PathVariable(value = "tripId") int tripId) {
        model.addAttribute("trip", tripService.getTripById(tripId));

        Trip trip = tripService.getTripById(tripId);
        Map<Integer, Boolean> seats = new HashMap<>();
        List<Ticket> tickets = ticketService.getTicketsByTrip(tripId);
        for (int i = 1; i <= trip.getDriver().getVehicles().get(0).getSeat(); i++) {
            seats.put(i, false);
        }
        for (Ticket t: tickets) {
            seats.put(t.getTicketDetails().get(0).getSeatPosition(), true);
        }

        model.addAttribute("seats", seats);
        return "ticket";
    }

    @GetMapping("/trip/{tripId}/book-ticket/{seat}")
    public String bookTicket(Model model
            , @PathVariable(value = "tripId") int tripId
            , @PathVariable(value = "seat") int seat) {
        Trip trip = tripService.getTripById(tripId);



        return "";
    }
}
