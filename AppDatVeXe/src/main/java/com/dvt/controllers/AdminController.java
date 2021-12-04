package com.dvt.controllers;

import com.dvt.pojos.Line;
import com.dvt.pojos.Point;
import com.dvt.pojos.Trip;
import com.dvt.pojos.User;
import com.dvt.service.ILineService;
import com.dvt.service.IPointService;
import com.dvt.service.ITripService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    ILineService lineService;

    @Autowired
    ITripService tripService;

    @Autowired
    IUserService userService;

    @Autowired
    IPointService pointService;

    @RequestMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("lines", lineService.getAll());
        model.addAttribute("trips", tripService.getAllTripp());
        model.addAttribute("points", pointService.getAll());
        model.addAttribute("customers", userService.getAllCustomer());
        model.addAttribute("employees", userService.getAllDriverAndEmployee());
        model.addAttribute("drivers", userService.getAllDriver());
        return "admin";
    }
//    ==================================================== Line Controller=======================
    @PostMapping("/add-line")
    public String createLine(Model model
            , @RequestParam(value = "lineName") String lineName
            , @RequestParam(value = "startPlace") String startPlace
            , @RequestParam(value = "endPlace") String endPlace
            , @RequestParam(value = "price") BigDecimal price
            , @RequestParam(value = "distance") int distance
            , @RequestParam(value = "time") int time) {
        String mgs = "";

        List<Line> lines = lineService.getAll();
        for(Line l :lines){
            if(startPlace.equals(l.getStartPoint().getAddress()) && endPlace.equals(l.getEndPoint().getAddress())){
                mgs="err";
                break;
            }
        }
        Point startPoint = null;
        Point endPoint = null;
        List<Point> ps = pointService.getAllPoint();
        for(Point p :ps){
            if(p.getAddress().equals(startPlace))
                startPoint = p;
            if(p.getAddress().equals(endPlace))
                endPoint = p;
        }

        lineService.createLine(new Line(lineName,startPoint,endPoint,price,distance,time));
        mgs ="sus";
        System.out.println("%%% === MGS =  " + mgs);
        model.addAttribute("mgs", mgs);
        return "redirect:/admin";
    }
    @RequestMapping("/line/{lineId}/delete")
    public String deleteLine(@PathVariable(value = "lineId") Integer lineId){
        Line line = lineService.getLineById(lineId);

        lineService.deleteLine(line);
        return "redirect:/admin";
    }

    @PostMapping("/line-update")
    public String updateLine(Model model
            , @RequestParam(value = "idline") int lineId
            , @RequestParam(value = "price") BigDecimal price
            , @RequestParam(value = "distance") int distance
            , @RequestParam(value = "time") int time){
        String mgs = "";
        Line l = lineService.getLineById(lineId);
        l.setPrice(price);
        l.setKilometer(distance);
        l.setTime(time);
        lineService.update(l);
        return "redirect:/admin";
    }
    //    ==================================================== Trip Controller=======================
    @PostMapping("/add-trip")
    public String createTrip(Model model
            , @RequestParam(value = "tripName") String tripName
            , @RequestParam(value = "tripLine") int tripLine
            , @RequestParam(value = "startTrip") String startTrip
            , @RequestParam(value = "endTrip") String endTrip
            , @RequestParam(value = "blankSeat") int blankSeat
            , @RequestParam(value = "tripDriver") int tripDriver
            , @RequestParam(value = "extraChanges") BigDecimal extraChanges) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String formatSTrip = startTrip.replace("T", " ");
        String formatETrip = endTrip.replace("T", " ");
        try {
            Date sTrip = formatter.parse(formatETrip);
            Date eTrip = formatter.parse(formatSTrip);
            Line line = lineService.getLineById(tripLine);
            User driver = userService.getUserById(tripDriver);
            tripService.save(new Trip(tripName, sTrip, eTrip,blankSeat,extraChanges,driver,line));

        } catch (ParseException e) {
            e.printStackTrace();
        }

        return "redirect:/admin";
    }
    @RequestMapping("/trip/{tripId}/delete")
    public String deleteTrip(@PathVariable(value = "tripId") Integer tripId){
        Trip trip = tripService.getTripById(tripId);
        tripService.delete(trip);
        return "redirect:/admin";
    }
    @PostMapping("/trip-update")
    public String updateTrip(Model model
            ,@RequestParam(value = "tripId") int tripId
            , @RequestParam(value = "blankSeat") int blankSeat
            , @RequestParam(value = "tripDriver") int tripDriver
            , @RequestParam(value = "extraChanges") BigDecimal extraChanges){
        String mgs = "";
        Trip trip = tripService.getTripById(tripId);
        trip.setBlankSeat(blankSeat);
        User driver = userService.getUserById(tripDriver);
        trip.setDriver(driver);
        trip.setExtra_changes(extraChanges);
        tripService.update(trip);
        return "redirect:/admin";
    }
}
