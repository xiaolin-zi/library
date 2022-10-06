package com.lxg.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerController {
    @RequestMapping("/manager")
    public String manager(){
        return "manager/manager";
    }
}
