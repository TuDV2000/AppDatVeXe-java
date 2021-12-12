package com.dvt.controllers;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dvt.pojos.*;
import com.dvt.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class AdminController {

    @Autowired
    IUserService userDetailsService;

    @Autowired
    ILineService lineService;

    @Autowired
    ITripService tripService;

    @Autowired
    IUserService userService;

    @Autowired
    IPointService pointService;

    @Autowired
    Cloudinary cloudinary;

    @Autowired
    IPermissionService permissionService;


    @RequestMapping(value = {"/admin", "/admin/{result}/{mgs}"})
    public String admin(Model model
            , @PathVariable(value = "result", required = false) String result
            , @PathVariable(value = "mgs", required = false) String mgs) {
        model.addAttribute("lines", lineService.getAll());
        model.addAttribute("trips", tripService.getAllTripp());
        model.addAttribute("points", pointService.getAll());
        model.addAttribute("customers", userService.getAllCustomer());
        model.addAttribute("employees", userService.getAllDriverAndEmployee());
        model.addAttribute("drivers", userService.getAllDriver());
        model.addAttribute("users", userService.getAllUser());
        model.addAttribute("permission", permissionService.getAll());
        return "admin";
    }

    //    ==================================================== Line Controller=======================
    @PostMapping("/add-line")
    public String createLine(Model model
            , @RequestParam(value = "lineName") String lineName
            , @RequestParam(value = "startPlace") String startPlace
            , @RequestParam(value = "endPlace") String endPlace
            , @RequestParam(value = "price") BigDecimal price
            , @RequestParam(value = "distance") int distance
            , @RequestParam(value = "time") int time) {
        String mgs = "";
        try {
            List<Line> lines = lineService.getAll();
            for (Line l : lines) {
                if (startPlace.equals(l.getStartPoint().getAddress()) && endPlace.equals(l.getEndPoint().getAddress())) {
                    mgs = "Tao tuyen that bai! Tuyen nay da ton tai! ";
                    return "redirect:/admin/err/" + mgs;
                }
                if (startPlace.equals(endPlace)) {
                    mgs = "Tao tuyen that bai! Diem khoi hanh va ket thuc trung nhau! ";
                    return "redirect:/admin/err/" + mgs;
                }
            }
            Point startPoint = null;
            Point endPoint = null;
            List<Point> ps = pointService.getAllPoint();
            for (Point p : ps) {
                if (p.getAddress().equals(startPlace))
                    startPoint = p;
                if (p.getAddress().equals(endPlace))
                    endPoint = p;
            }
            lineService.createLine(new Line(lineName, startPoint, endPoint, price, distance, time));
            mgs = "Tao tuyen thanh cong!";
        } catch (Exception e) {
            mgs = "Tao tuyen that bai! " + e;
            return "redirect:/admin/err/" + mgs;
        }
        return "redirect:/admin/sus/" + mgs;
    }

    @RequestMapping("/line/{lineId}/delete")
    public String deleteLine(@PathVariable(value = "lineId") Integer lineId) {
        String mgs = "";
        try {
            Line line = lineService.getLineById(lineId);
            if (line.getTrips().size() > 0) {
                mgs = "Xoa tuyen that bai! Yeu cau xoa cac chuyen tren tuyen nay truoc!";
                return "redirect:/admin/err/" + mgs;
            }
            lineService.deleteLine(line);
            mgs = "Xoa tuyen thanh cong! ";
        } catch (Exception e) {
            mgs = "Xoa tuyen that bai! " + e;
            return "redirect:/admin/err/" + mgs;
        }

        return "redirect:/admin/sus/" + mgs;
    }

    @PostMapping("/line-update")
    public String updateLine(Model model
            , @RequestParam(value = "idline") int lineId
            , @RequestParam(value = "price") BigDecimal price
            , @RequestParam(value = "distance") int distance
            , @RequestParam(value = "time") int time) {
        String mgs = "";
        try {
            Line l = lineService.getLineById(lineId);
            l.setPrice(price);
            l.setKilometer(distance);
            l.setTime(time);
            lineService.update(l);
            mgs = "Cap nhat tuyen thanh cong!";
        } catch (Exception e) {
            mgs = "Cap nhat tuyen khong thanh cong! " + e;
            return "redirect:/admin/err/" + mgs;
        }
        return "redirect:/admin/sus/" + mgs;
    }

    //    ==================================================== Trip Controller=======================
    @PostMapping("/add-trip")
    public String createTrip(Model model
            , @RequestParam(value = "tripName") String tripName
            , @RequestParam(value = "tripLine") int tripLine
            , @RequestParam(value = "startTrip") String startTrip
            , @RequestParam(value = "endTrip") String endTrip
            , @RequestParam(value = "blankSeat") int blankSeat
            , @RequestParam(value = "tripDriver") int tripDriver
            , @RequestParam(value = "extraChanges") BigDecimal extraChanges) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String formatSTrip = startTrip.replace("T", " ");
        String formatETrip = endTrip.replace("T", " ");
        String mgs = "";
        try {
            Date sTrip = formatter.parse(formatETrip);
            Date eTrip = formatter.parse(formatSTrip);
            Line line = lineService.getLineById(tripLine);
            User driver = userService.getUserById(tripDriver);
            tripService.save(new Trip(tripName, sTrip, eTrip, blankSeat, extraChanges, driver, line));
            mgs = "Tao chuyen thanh cong! ";
        } catch (ParseException e) {
            e.printStackTrace();
            mgs = "Tao chuyen that bai " + e;
            return "redirect:/admin/err/" + mgs;
        }

        return "redirect:/admin/sus/" + mgs;
    }

    @RequestMapping("/trip/{tripId}/delete")
    public String deleteTrip(@PathVariable(value = "tripId") Integer tripId) {
        Trip trip = tripService.getTripById(tripId);
        String mgs = "";
        try {
            tripService.delete(trip);
            mgs = "Xoa chuyen thanh cong!";
        } catch (Exception e) {
            mgs = "Xoa chuyen that bai! " + e;
            return "redirect:/admin/err/" + mgs;
        }

        return "redirect:/admin/sus/" + mgs;
    }

    @PostMapping("/trip-update")
    public String updateTrip(Model model
            , @RequestParam(value = "tripId") int tripId
            , @RequestParam(value = "blankSeat") int blankSeat
            , @RequestParam(value = "tripDriver") int tripDriver
            , @RequestParam(value = "extraChanges") BigDecimal extraChanges) {
        String mgs = "";
        try {
            Trip trip = tripService.getTripById(tripId);
            trip.setBlankSeat(blankSeat);
            User driver = userService.getUserById(tripDriver);
            trip.setDriver(driver);
            trip.setExtra_changes(extraChanges);
            tripService.update(trip);
            mgs = "Cap nhat chuyen thanh cong";
        } catch (Exception e) {
            mgs = "Cap nhat chuyen that bai" + e;
            return "redirect:/admin/err/" + mgs;
        }
        return "redirect:/admin/sus/" + mgs;
    }

    // =================================================== Point Controller =====================================
    @PostMapping("/add-place")
    public String createPlace(Model model
            , @RequestParam(value = "placeName") String placeName
            , @RequestParam(value = "placePicture") MultipartFile placePicture) {
        String mgs = "";
        String placeImage = "";
        try {
            Map imgCloud = this.cloudinary.uploader()
                    .upload(placePicture.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            placeImage = (String) imgCloud.get("secure_url");
        } catch (IOException e) {
            e.printStackTrace();
            mgs = "Them diem that bai" + e;
            return "redirect:/admin/err/" + mgs;
        }
        pointService.save(new Point(placeName, placeImage));
        mgs = "Them diem thanh cong";
        System.out.println(mgs);
        return "redirect:/admin/sus/" + mgs;
    }

    @PostMapping("/place-update")
    public String updatePlace(@RequestParam(value = "placePictureUpdate") MultipartFile placePicture
            , @RequestParam(value = "placeId") int placeId) {
        String mgs = "";
        String placeImage = "";
        if (placePicture == null) {
            return "redirect:/admin";
        } else {
            try {
                Map imgCloud = this.cloudinary.uploader()
                        .upload(placePicture.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                placeImage = (String) imgCloud.get("secure_url");
                mgs = "Cap nhat diem thanh cong";
            } catch (IOException e) {
                e.printStackTrace();
                mgs = "Cap nhap diem that bai" + e;
                return "redirect:/admin/err/" + mgs;
            }
        }
        Point p = pointService.getPointById(placeId);
        p.setPicture(placeImage);
        pointService.update(p);
        return "redirect:/admin/sus/" + mgs;
    }

    @RequestMapping("/place/{placeId}/delete")
    public String deletePlace(@PathVariable(value = "placeId") Integer placeId) {
        String mgs = "";
        try {
            List<Line> ls = lineService.getLinesBySPoint(placeId);
            System.out.println(ls.size());
            if (ls.size() > 0) {
                mgs = "Xoa diem khong thanh cong! Yeu cau xoa cac tuyen su dung dia diem truoc. ";
                return "redirect:/admin/err/" + mgs;
            }
            Point p = pointService.getPointById(placeId);
            pointService.delete(p);
            mgs = "Xoa diem thanh cong!";
        } catch (Exception e) {
            mgs = "Xoa diem that bai!" + e;
            return "redirect:/admin/err/" + mgs;
        }

        return "redirect:/admin/sus/" + mgs;
    }

    // =========================================================== User Controller ============================================
    @PostMapping("/create-user")
    public String addUser(
            @RequestParam(value = "lastName") String lastName
            , @RequestParam(value = "firstName") String firstName
            , @RequestParam(value = "username") String username
            , @RequestParam(value = "phone") String phone
            , @RequestParam(value = "password") String password
            , @RequestParam(value = "password2") String password2
            , @RequestParam(value = "permission") int permission) {
        String mgs = "";
        List<User> ls = userService.getAllUser();
        for(User u : ls){
            if (u.getUsername().equals(username)){
                mgs="Tao nguoi dung that bai! Username trung";
                return "redirect:/admin/err/" + mgs;
            }
        }
        if (password.equals(password2)) {
            System.out.println(permission);
            Permission per = permissionService.getPerById(permission);
            System.out.println(per.getName());
            if (userDetailsService.createUser(new User(username, password, firstName
                    , lastName, phone, per))) {
            } else {
                mgs = "Tao nguoi dung that bai";
                return "redirect:/admin/err/" + mgs;
            }
        } else {
            mgs = "Mat khau khong khop";
            return "redirect:/admin/err/" + mgs;
        }
        mgs = "Tao nguoi dung thanh cong";
        return "redirect:/admin/sus/" + mgs;
    }

    @PostMapping("/update-user")
    public String updateUser(
            @RequestParam(value = "id") int id
            , @RequestParam(value = "lastName") String lastName
            , @RequestParam(value = "firstName") String firstName
            , @RequestParam(value = "permission") int permission
            , @RequestParam(value = "address", required = false) String address
            , @RequestParam(value = "phoneNumber") String phoneNumber) {
        System.out.println(lastName);
        System.out.println(firstName);
        System.out.println(permission);
        System.out.println(address);
        System.out.println(phoneNumber);
        String mgs = "";
        try {
            User user = userService.getUserById(id);
            user.setLastName(lastName);
            user.setFirstName(firstName);
            Permission per = permissionService.getPerById(permission);
            user.setPermission(per);
            user.setNumberPhone(phoneNumber);
            if (address != null)
                user.setAddress(address);
            userService.update(user);
            mgs = "Cap nhat user thanh cong";
        } catch (Exception e) {
            mgs = "Cap nhat user that bai" + e;
            return "redirect:/admin/err/" + mgs;
        }
        return "redirect:/admin/sus/" + mgs;
    }
    @RequestMapping("/user/{userId}/delete")
    public String deleteUser(@PathVariable(value = "userId") Integer userId) {
        String mgs = "";
        try {
            User user = userService.getUserById(userId);
            user.setActive(false);
            userService.update(user);
            mgs = "Xoa nguoi dung thanh cong!";
        } catch (Exception e) {
            mgs = "Xoa nguoi dung that bai!" + e;
            return "redirect:/admin/err/" + mgs;
        }

        return "redirect:/admin/sus/" + mgs;
    }
}

