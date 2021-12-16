package com.dvt.controllers.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.dvt.pojos.Line;
import com.dvt.pojos.Point;
import com.dvt.service.ILineService;
import com.dvt.service.IPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/points")
public class PointAdminController {
    @Autowired
    Cloudinary cloudinary;
    @Autowired
    IPointService pointService;
    @Autowired
    ILineService lineService;

    @GetMapping(value = {"", "/{result}"})
    public String showPoint(Model model
            , @PathVariable(value = "result", required = false) String result) {
        model.addAttribute("points", pointService.getAll());
        System.out.println("result: " + result);
        if(result != null)
            model.addAttribute("result", result);

        return "pointsAdmin";
    }

    @PostMapping("/add-point")
    public String createPlace(Model model
            , @RequestParam(value = "placeName") String placeName
            , @RequestParam(value = "placePicture") MultipartFile placePicture) {

        String placeImage = "";
        try {
            Map imgCloud = this.cloudinary.uploader()
                    .upload(placePicture.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
            placeImage = (String) imgCloud.get("secure_url");
        } catch (IOException e) {
            return "redirect:/admin/points/err";
        }
        pointService.save(new Point(placeName, placeImage));

        return "redirect:/admin/points/createSus";
    }

    @PostMapping("/point-update")
    public String updatePlace(@RequestParam(value = "placePictureUpdate") MultipartFile placePicture
            , @RequestParam(value = "placeId") int placeId) {

        String placeImage = "";
        if (placePicture == null) {
            return "redirect:/admin/points/err";
        } else {
            try {
                Map imgCloud = this.cloudinary.uploader()
                        .upload(placePicture.getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                placeImage = (String) imgCloud.get("secure_url");
            } catch (IOException e) {
                e.printStackTrace();
                return "redirect:/admin/points/err";
            }
        }
        Point p = pointService.getPointById(placeId);
        p.setPicture(placeImage);
        pointService.update(p);
        return "redirect:/admin/points/updateSus";
    }

    @RequestMapping("/{placeId}/delete")
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
}
