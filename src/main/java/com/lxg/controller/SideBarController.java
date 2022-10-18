package com.lxg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SideBarController {

    @RequestMapping("/music")
    public String tomusic(){
        return "user/music";
    }
}
