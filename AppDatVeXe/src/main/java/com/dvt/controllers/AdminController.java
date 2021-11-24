package com.dvt.controllers;

import com.dvt.service.ILineService;
import com.dvt.service.ITripService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @Autowired
    ILineService lineService;

    @Autowired
    ITripService tripService;

    @Autowired
    IUserService userService;

    @RequestMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("lines", lineService.getOnlyLines());
        model.addAttribute("trips", tripService.getAllTripp());
        model.addAttribute("customers", userService.getAllCustomer());
        model.addAttribute("employees", userService.getAllDriverAndEmployee());
        return "admin";
    }
}
