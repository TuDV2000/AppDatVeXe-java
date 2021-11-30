package com.dvt.controllers;

import com.dvt.pojos.Line;
import com.dvt.pojos.Point;
import com.dvt.service.ILineService;
import com.dvt.service.IPointService;
import com.dvt.service.ITripService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
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
        return "admin";
    }
    @PostMapping("/add-line")
    public String createLine(Model model
            , @RequestParam(value = "lineName") String lineName
            , @RequestParam(value = "startPlace") String startPlace
            , @RequestParam(value = "endPlace") String endPlace
            , @RequestParam(value = "price") BigDecimal price
            , @RequestParam(value = "distance") int distance
            , @RequestParam(value = "time") int time) {
        String mgs = "";
//        System.out.println("# line name =" + lineName );
//        System.out.println("# startPlace =" + startPlace );
//        System.out.println("# endPlace =" + endPlace );
//        System.out.println("# price =" + price );
//        System.out.println("# distance =" + distance );
//        System.out.println("# time =" + time );

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
//        System.out.println("Start-Point " + startPoint.getAddress());
//        System.out.println("Start-Point " + endPoint.getAddress());
        lineService.createLine(new Line(lineName,startPoint,endPoint,price,distance,time));
        mgs ="sus";
        System.out.println("%%% === MGS =  " + mgs);
        model.addAttribute("mgs", mgs);
        return "redirect:/admin";
    }
    @RequestMapping("/line/{lineId}/delete")
    public String deleteLine(@PathVariable(value = "lineId") Integer lineId){
        Line line = lineService.getLineById(lineId);
//        List<Line> ls = lineService.getAll();
//        for(Line l: ls){
//            if(l.getId() == lineId)
//                line = l;
//        }
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
}
