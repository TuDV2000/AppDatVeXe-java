/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dvt.controllers;

import com.dvt.pojos.User;
import com.dvt.service.IPermissionService;
import com.dvt.service.IPointService;
import com.dvt.service.ITripService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VanTu
 */
@Controller
public class HomeController {
    @Autowired
    IPointService pointService;
    @Autowired
    ITripService tripService;

    @ModelAttribute
    public void commonAttrs(Model model, HttpSession session) {
        model.addAttribute("points", pointService.getAll());
    }

    @RequestMapping("/")
    public String index(Model model) {

        return "index";
    }

    @RequestMapping("/trips")
    public String searchTrips(Model model
            , @RequestParam(value = "sPoint", required = false) int sPointId
            , @RequestParam(value = "ePoint", required = false) int ePointId
            , @RequestParam(value = "sDate", required = false) String sDate){

        System.out.println("controller: " + sDate);
        System.out.println(tripService.getTrips(sPointId, ePointId, sDate));
        if (sPointId != 0 && ePointId != 0 && sDate != null) {
            model.addAttribute("trips", tripService.getTrips(sPointId, ePointId, sDate));
        }

        return "schedule";
    }

    @RequestMapping("/vexe")
    public String ticket(Model model) {
        return "ticket";
    }

    @RequestMapping("/thanhtoan")
    public String payment(Model model) {
        return "payment";
    }
}
