package com.bit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {
  
  @RequestMapping("/")
  public String index(@RequestParam String error) {
    System.out.println(error);
    return "index";
  }
  
}
