/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dvt.controllers;

import com.dvt.pojos.Permission;
import com.dvt.pojos.User;
import com.dvt.service.IPermissionService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VanTu
 */
@Controller
public class HomeController {
    @Autowired
    IPermissionService permissionService;
    @Autowired
    IUserService userService;

    @RequestMapping("/")
    public String index(Model model) {
        List<String> a = new ArrayList<>();
        a.add("dumamay tức vl");
        a.add("cmn");
        a.add("Bố mày làm thủ công");
        a.add("dmm");

        model.addAttribute("place", a);

        return "index";
    }

}
