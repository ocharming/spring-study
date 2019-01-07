package bitcamp.travelmaker.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bitcamp.travelmaker.dto.MemberDTO;
import bitcamp.travelmaker.gowith.dto.GowithDTO;
import bitcamp.travelmaker.gowith.service.GowithService;
import bitcamp.travelmaker.mypage.service.MypageMemberService;
import bitcamp.travelmaker.reviewpage.dto.TravelDTO;
import bitcamp.travelmaker.reviewpage.service.TravelService;

@Controller
public class IndexController {
	
	@Autowired
	private MypageMemberService service;
	
	@Autowired
	private TravelService tservice;
	
	@Autowired
	private GowithService gservice;
	
	@Autowired
	private TravelService travelService;
		
	@RequestMapping("/index.htm")
		public String index(HttpServletRequest request,Principal principal, Model model) {
//		System.out.println(principal.getName());
//		model.addAttribute("tile", "index");
		List<TravelDTO> list = tservice.getMainReview();
		model.addAttribute("list", list);
		List<GowithDTO> list1 = gservice.getMainGo();
		model.addAttribute("glist", list1);

		List<TravelDTO> report = travelService.travelReport();
		List<TravelDTO> mreport = travelService.travelMreport();
		List<TravelDTO> wreport = travelService.travelWreport();
		model.addAttribute("report", report);
		model.addAttribute("mreport", mreport);
		model.addAttribute("wreport", wreport);
		
			if(principal!=null) {
				request.getSession().setAttribute("m_Email",principal.getName());				
				MemberDTO dto = new MemberDTO();
				System.out.println(request.getSession().getAttribute("m_Email"));
				dto = service.mypageMember(principal.getName());
				model.addAttribute("dto", dto);
//				model.addAttribute("social", "no");
				
			return "home.home";
		}
			else {
				
				return "home.home";
			}
}
	@RequestMapping("/delpage.htm")
	public String delpage(HttpServletRequest request) {
		 	
		return "home.delpage";
	}
	
	
	
	@RequestMapping("/logout.htm")
	public String logout(HttpServletRequest request) {
			request.getSession().setAttribute("social", "no");
		return "home.logout";
	}
}
