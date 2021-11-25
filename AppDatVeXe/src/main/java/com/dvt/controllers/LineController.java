package com.dvt.controllers;

import com.dvt.pojos.Line;
import com.dvt.service.ILineService;
import com.dvt.service.IPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
public class LineController {
    @Autowired
    IPointService pointService;
    @Autowired
    ILineService lineService;

    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session) {
        model.addAttribute("points", pointService.getAll());
    }

    @PostMapping("/line")
    public String createLine(Model model
            , @RequestParam(value = "lineName") String lineName
            , @RequestParam(value = "startPlace") String startPlace
            , @RequestParam(value = "endPlace") String endPlace
            , @RequestParam(value = "price") String price
            , @RequestParam(value = "distance") String distance
            , @RequestParam(value = "time") String time) {
        String mgs = "";
        System.out.println("# line name =" + lineName );
        System.out.println("# startPlace =" + startPlace );
        System.out.println("# endPlace =" + endPlace );
        System.out.println("# price =" + price );
        System.out.println("# distance =" + distance );
        System.out.println("# time =" + time );

        List<Line> lines = lineService.getAll();
        for(Line l :lines){
            System.out.println("@ line name =" + l.getStartPoint().getAddress());
            System.out.println("@ startPlace =" + l.getEndPoint().getAddress() );
            if(startPlace.equals(l.getStartPoint().getAddress()) && endPlace.equals(l.getEndPoint().getAddress())){
                System.out.println("# line name =" + lineName );
                System.out.println("# startPlace =" + startPlace );
                System.out.println("@ line name =" + l.getStartPoint().getAddress());
                System.out.println("@ startPlace =" + l.getEndPoint().getAddress() );
            }
        }
        return "";
    }


    @RequestMapping("/lines")
    public String searchLines(Model model
            , @RequestParam(value = "sPoint", required = false, defaultValue = "-1") int sPointId
            , @RequestParam(value = "ePoint", required = false, defaultValue = "-1") int ePointId){

        if (sPointId > 0 && ePointId > 0) {
            model.addAttribute("line", lineService.getLine(sPointId, ePointId));
        } else {
            model.addAttribute("lines", lineService.getAllLines());
        }

        return "schedule";
    }

}
