package com.dvt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @RequestMapping("/signup")
    public String signup(Model model) {
        return "signup";
    }

    @RequestMapping("/signin")
    public String signin(Model model) {
        return "signin";
    }
}
