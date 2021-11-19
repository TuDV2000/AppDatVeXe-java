package com.dvt.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dvt.pojos.Permission;
import com.dvt.pojos.User;
import com.dvt.service.IPermissionService;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    IUserService userDetailsService;
    @Autowired
    IUserService userService;
    @Autowired
    IPermissionService permissionService;
    @Autowired
    Cloudinary cloudinary;

    @GetMapping("/signup")
    public String signupForm() {
        return "signup";
    }

    @PostMapping(value = "/signup")
    public String signup(Model model
            , @RequestParam(value = "lastName") String lastName
            , @RequestParam(value = "firstName") String firstName
            , @RequestParam(value = "username") String username
            , @RequestParam(value = "phone") String phone
            , @RequestParam(value = "password") String password
            , @RequestParam(value = "password2") String password2) {
        String mgs = "";

        System.out.println("lastName ===============" + lastName);
        System.out.println("fistName ===============" + firstName);

        if (password.equals(password2)) {
            Permission permission = permissionService.getPerByName("Customer");
            if (userDetailsService.createUser(new User(username, password, firstName
                    , lastName, phone, permission))) {
                    return "redirect:/signin";
                } else {
                mgs = "Username đã tồn tại!!";
                }
        } else {
            mgs = "Mật khẩu không khớp";
        }

        model.addAttribute("mgs", mgs);
        return "signup";
    }

//    @RequestMapping(value = "/new-info", method = RequestMethod.POST)
//    public String updateProfile(Model model) {
//        System.out.println("test update");
//
//        return "profile";
//    }

    @PostMapping("/profile")
    public String updateProfile(Model model
        ,@RequestParam(value = "userName") String userName
        ,@RequestParam(value = "email") String email
        ,@RequestParam(value = "phone") String phone
        ,@RequestParam(value = "address") String address) {
        String mgs = "";
        System.out.println(userName + "-------------" + email + "-------------" + phone + "-------------" + address);

        User user = userService.getUserByUsername(userName);
        user.setEmail(email);
        user.setNumberPhone(phone);
        user.setAddress(address);
        if(userService.updateUser(user)){
            mgs = "sus";
    //            model.addAttribute("rel", mgs);
    //            System.out.println(mgs);
    //            return "redirect:/profile";
        }else {
            mgs ="err";
        }
        System.out.println(mgs);

        return "redirect:/profile/" + mgs;
    }

    @PostMapping("/password")
    public String updatePass(Model model,Principal principal
        ,@RequestParam(value = "newpass") String newPass
        ,@RequestParam(value = "oldpass") String oldPass){
        String mgs = "";
        User user = userService.getUserByUsername(principal.getName());
        System.out.println("user.getPassword()       " + user.getPassword());
        System.out.println("oldPass                   " + oldPass);
        System.out.println("userService.enCode(oldPass)      " + userService.enCode(oldPass));
        System.out.println("userService.enCode(oldPass)      " + userService.enCode(oldPass));
        if (user.getPassword().equals(userService.enCode(oldPass))){
            String enPass = userService.enCode(newPass);
            user.setPassword(enPass);
            if(userService.updateUser(user)){
                mgs = "sus";
            }else{
                mgs = "err";
            }
        }
        else {
            mgs = "err2";
        }

        System.out.println(mgs);
        model.addAttribute("result", mgs);
        return "/profile";
    }
    @RequestMapping(path="/update-avatar", method = RequestMethod.POST)
    public String updateAvatar(@ModelAttribute("user") User user){
        System.out.println("aaaaaaaaa");
        String mgs = "";
        try {
            this.cloudinary.uploader().upload(user.getImg().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            mgs = "sus";
        } catch (IOException ex) {
            System.out.println("==Change profile avata ==" +ex.getMessage());
        }
        return "/profile";
    }

    @RequestMapping("/signin")
    public String signin(Model model) {
        return "signin";
    }


    @GetMapping(value = {"/profile", "/profile/{result}"})
    public String searchUser(Model model, @PathVariable(value = "result", required = false) String result, Principal principal){
        model.addAttribute("user", userService.getUserByUsername(principal.getName()));
        model.addAttribute("ticket", userService.getTicketByUsername(principal.getName()));
        return "profile";
    }
}
