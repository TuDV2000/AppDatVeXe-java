package com.dvt.controllers.admin;

import com.dvt.service.IStatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    IStatsService statsService;

    @RequestMapping("")
    public String showAdmin() {
        return "baseAdminLayout";
    }

    @GetMapping("/line-stats")
    public String statsForLine(Model model) {
        model.addAttribute("lineStats", statsService.lineStats());

        return "lineStats";
    }

    @GetMapping("/trip-stats")
    public String statsForTrip(Model model) {
        model.addAttribute("tripStats", statsService.tripStats());

        return "tripStats";
    }

    @GetMapping("/month-stats")
    public String statsForMonth() {
        return "monthStats";
    }

    @GetMapping("/month-stats/{year}")
    public String statsForMonth(Model model, @PathVariable(value = "year") int year) {

        model.addAttribute("monthStats", statsService.monthStats(year));
        return "monthStats";
    }
}

