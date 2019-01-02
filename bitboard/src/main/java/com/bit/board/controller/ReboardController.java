package com.bit.board.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.bit.board.admin.service.BoardAdminService;
import com.bit.board.model.ReboardDto;
import com.bit.board.service.ReboardService;
import com.bit.common.service.CommonService;
import com.bit.member.model.MemberDto;
import com.bit.member.service.MemberService;
import com.bit.util.PageNavigation;

@Controller
@RequestMapping("/reboard")
public class ReboardController {
  
  @Autowired
  private BoardAdminService boardAdminService;
  
  @Autowired
  private ReboardService reboardService;
  
  @Autowired
  private CommonService commonService;
  
  @Autowired
  private MemberService memberSevice;
  
  @RequestMapping("list")
  public ModelAndView list(@RequestParam Map<String, String> param, @RequestParam int bcode) {
    ModelAndView mav = new ModelAndView();
    List<ReboardDto> list = reboardService.listArticle(param);
    
    PageNavigation navigation = commonService.makePageNavigation(param);
    navigation.setRoot("/board");
    navigation.makeNavigator();
    mav.addObject("articlelist", list);
    mav.addObject("navigator", navigation);
    mav.addObject("menu", boardAdminService.getBoardMenu());
    mav.addObject("bname", boardAdminService.getBoardName(bcode));
    mav.setViewName("reboard/list");
    return mav;
  }
  
  @RequestMapping(value="write", method=RequestMethod.GET)
  public String write(@RequestParam Map<String, String> param, Model model) {
    model.addAttribute("menu", boardAdminService.getBoardMenu());
    return "reboard/write";
  }
  
  @RequestMapping(value="write", method=RequestMethod.POST)
  public String write(ReboardDto reboardDto, Model model) {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    MemberDto memberDto = memberSevice.infoMember(auth.getName());
    model.addAttribute("menu", boardAdminService.getBoardMenu());
    if(memberDto != null) {
      reboardDto.setId(memberDto.getId());
      reboardDto.setName(memberDto.getName());
      reboardDto.setEmail(memberDto.getEmail());
      
      int seq = reboardService.writeArticle(reboardDto);
      if (seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "서버 문제로 글작성이 실패 했습니다.!!!");
      }
    } else {
      model.addAttribute("errorMsg", "회원전용 게시판입니다!!!");
    }
    return "reboard/writeOk";
  }
  
  @RequestMapping("view")
  public String view(@RequestParam int seq, HttpSession httpSession, Model model) {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    MemberDto memberDto = memberSevice.infoMember(auth.getName());
    model.addAttribute("menu", boardAdminService.getBoardMenu());
    if (memberDto != null) {
      ReboardDto reboardDto = reboardService.viewArticle(seq);
      model.addAttribute("article", reboardDto);
    }
    return "reboard/view";
  }
  
  @RequestMapping(value="reply", method=RequestMethod.GET)
  public String reply(@RequestParam int seq, HttpSession httpSession, Model model) {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    MemberDto memberDto = memberSevice.infoMember(auth.getName());
    model.addAttribute("menu", boardAdminService.getBoardMenu());
    if (memberDto != null) {
      ReboardDto reboardDto = reboardService.getArticle(seq);
      model.addAttribute("article", reboardDto);
    }
    return "reboard/reply";
  }
  
  @RequestMapping(value="reply", method=RequestMethod.POST)
  public String reply(ReboardDto reboardDto, HttpSession httpSession, @RequestParam Map<String, String> param, Model model) {
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    MemberDto memberDto = memberSevice.infoMember(auth.getName());
    model.addAttribute("menu", boardAdminService.getBoardMenu());
    if(memberDto != null) {
      reboardDto.setId(memberDto.getId());
      reboardDto.setName(memberDto.getName());
      reboardDto.setEmail(memberDto.getEmail());
      
      int seq = reboardService.replyArticle(reboardDto);
      if (seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "서버 문제로 글작성이 실패 했습니다.!!!");
      }
    } else {
      model.addAttribute("errorMsg", "회원전용 게시판입니다!!!");
    }
    return "reboard/writeOk";
  }
  
}
