package com.dvt.controllers;

import com.dvt.pojos.Permission;
import com.dvt.pojos.User;
import com.dvt.service.IPermissionService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    IUserService userDetailsService;
    @Autowired
    IPermissionService permissionService;

    @RequestMapping("/signup-form")
    public String signupForm(Model model) {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(Model model
            , @RequestParam(value = "fullname") String fullName
            , @RequestParam(value = "username") String username
            , @RequestParam(value = "phone") String phone
            , @RequestParam(value = "password") String password
            , @RequestParam(value = "password2") String password2) {
        String msg = "";

        if (password.equals(password2)) {
            Permission permission = permissionService.getPerByName("Customer");
            if (userDetailsService.createUser(new User(username, password, "firstName"
                    , fullName, phone, permission))) {
                    return "redirect:/signin";
                } else {
                    msg = "Da co loi xay ra khi tao moi user!!";
                }
        } else {
            msg = "Mat khau khong khop";
        }

        model.addAttribute("mgsErr", msg);
        return "index";
    }

    @RequestMapping("/signin")
    public String signin(Model model) {
        return "signin";
    }
}
