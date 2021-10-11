/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dvt.controllers;

import com.dvt.pojos.User;
import com.dvt.service.IPermissionService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    public String home(Model model) {

        return "index";
    }

    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("user", new User());

        return "page2";
    }

    @RequestMapping(path = "/add", method = RequestMethod.POST)
    public String addUser(Model model
            , @ModelAttribute(value = "user") User user) {
        if (userService.createUser(user)) {
            model.addAttribute("mgs", "Đăng ký thành công!");
        } else {
            model.addAttribute("mgs", "Đăng ký không thành công!");
        }
        return "page2";
    }
}
