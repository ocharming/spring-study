package com.bit.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.bit.board.admin.service.BoardAdminService;

@Controller
@RequestMapping("/member")
public class MemberController {

  @Autowired
  private BoardAdminService boardAdminService;

  @RequestMapping(value = "list", method = RequestMethod.GET)
  public String selectMember(Model model) {
    model.addAttribute("menu", boardAdminService.getBoardMenu());
    return "member/list";
  }

  @RequestMapping(value = "view", method = RequestMethod.GET)
  public String infoMember(@RequestParam String id, Model model) {
    model.addAttribute("menu", boardAdminService.getBoardMenu());
    model.addAttribute("id", id);
    return "member/view";
  }

  @RequestMapping(value = "insert", method = RequestMethod.GET)
  public String insert(Model model) {
    model.addAttribute("menu", boardAdminService.getBoardMenu());
    return "member/join";
  }

}
