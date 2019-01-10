package com.bit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {


  @RequestMapping(value = "insert", method = RequestMethod.GET)
  public String insert(Model model) {
    return "member/join";
  }

  @RequestMapping(value = "list", method = RequestMethod.GET)
  public String selectMember(Model model) {
    return "member/list";
  }
  
  
/*
  @RequestMapping(value = "view", method = RequestMethod.GET)
  public String infoMember(@RequestParam String id, Model model) {
    model.addAttribute("menu", boardAdminService.getBoardMenu());
    model.addAttribute("id", id);
    return "member/view";
  }
*/


}
