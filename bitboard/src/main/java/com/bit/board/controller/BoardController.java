package com.bit.board.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.bit.board.model.BoardDto;
import com.bit.board.service.BoardService;
import com.bit.common.service.CommonService;
import com.bit.member.model.MemberDto;
import com.bit.util.PageNavigation;

@Controller
@RequestMapping("/board")
public class BoardController {
  @Autowired
  private BoardService boardService;

  @Autowired
  private CommonService commonService;

  @RequestMapping("list.bit")
  public ModelAndView list(@RequestParam Map<String, String> param) {
    ModelAndView mav = new ModelAndView();
    List<BoardDto> list = boardService.listArticle(param);

    PageNavigation navigation = commonService.makePageNavigation(param);
    navigation.setRoot("/board");
    navigation.makeNavigator();

    mav.addObject("articlelist", list);
    mav.addObject("navigator", navigation);
    mav.setViewName("board/list");
    return mav;
  }

  @RequestMapping(value="write.bit", method=RequestMethod.GET)
  public String write(@RequestParam Map<String, String> param) {
    return "board/write";
  }

  @RequestMapping(value="write.bit", method=RequestMethod.POST)
  public String write(BoardDto boardDto, HttpSession httpSession, @RequestParam Map<String, String> param, Model model) {
    MemberDto memberDto =(MemberDto) httpSession.getAttribute("userInfo");
    if(memberDto != null) {
      boardDto.setId(memberDto.getId());
//      boardDto.setName(memberDto.getName());
//      boardDto.setEmail(memberDto.getEmail());

      int seq = boardService.writeArticle(boardDto);
      if (seq != 0) {
        model.addAttribute("wseq", seq);
      } else {
        model.addAttribute("errorMsg", "서버 문제로 글작성이 실패 했습니다.!!!");
      }
    } else {
      model.addAttribute("errorMsg", "회원전용 게시판입니다!!!");
    }
    return "board/writeOk";
  }

  @RequestMapping("view.bit")
  public String view(@RequestParam int seq, HttpSession httpSession, Model model) {
    MemberDto memberDto = (MemberDto) httpSession.getAttribute("userInfo");
    if (memberDto != null) {
      BoardDto boardDto = boardService.viewArticle(seq);
      model.addAttribute("article", boardDto);
    }
    return "board/view";
  }
}
