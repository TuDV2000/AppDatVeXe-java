package com.dvt.controllers;

import com.dvt.pojos.Feedback;
import com.dvt.pojos.Trip;
import com.dvt.pojos.User;
import com.dvt.service.IFeedbackService;
import com.dvt.service.ITripService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
public class TripController {
    @Autowired
    ITripService tripService;
    @Autowired
    IUserService userService;
    @Autowired
    IFeedbackService feedbackService;

    @GetMapping("/line/{lineId}/trips")
    public String searchTrips(Model model, @PathVariable(value = "lineId") Integer lineId){
        model.addAttribute("trips", tripService.getTrips(lineId));

        return "trips";
    }


    @RequestMapping("/trip")
    public String searchTrips(Model model
            , @RequestParam(value = "sPoint", required = false) int sPointId
            , @RequestParam(value = "ePoint", required = false) int ePointId
            , @RequestParam(value = "sDate", required = false) String sDate){

        System.out.println("controller: " + sDate);
        System.out.println(tripService.getTrip(sPointId, ePointId, sDate));

        if (sPointId != 0 && ePointId != 0 && sDate != null) {
            Trip trip = tripService.getTrip(sPointId, ePointId, sDate);
            model.addAttribute("trip", trip);
            if (trip != null)
                return "redirect:/trip/" + trip.getId() + "/book-ticket";
            else
                model.addAttribute("mgsSearchtrip", false);
        }

        return "redirect:/";
    }

    @PostMapping("/trip/feed-back")
    public String feedBack(Model model, Principal principal
            , @RequestParam(value = "tripId") int tripId
            , @RequestParam(value = "ticketId") int ticketId
            , @RequestParam(value = "content") String content) {
        User user = userService.getUserByUsername(principal.getName());
        Trip trip = tripService.getById(tripId);

        if (!content.equals("")) {
            feedbackService.save(new Feedback(content, trip, user));

            model.addAttribute("fbContent", content);
        }

        return "redirect:/" + ticketId + "/ticketdetail";
    }
}
