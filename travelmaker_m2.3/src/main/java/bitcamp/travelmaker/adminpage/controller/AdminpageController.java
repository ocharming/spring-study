
package bitcamp.travelmaker.adminpage.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import bitcamp.travelmaker.dto.BlacklistDTO;
import bitcamp.travelmaker.dto.MemberDTO;
import bitcamp.travelmaker.gowith.dto.GowithDTO;
import bitcamp.travelmaker.gowith.service.GowithService;
import bitcamp.travelmaker.mypage.service.MypageMemberService;
import bitcamp.travelmaker.reviewpage.dto.TravelDTO;
import bitcamp.travelmaker.reviewpage.service.TravelService;
import bitcamp.travelmaker.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminpageController {
	
	@Autowired
	private View jsonview;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MypageMemberService mypageservice;
	@Autowired
	private GowithService gowithservice;
	@Autowired
	private TravelService travelService;
	
	
	@RequestMapping("/adminpage.htm")
	public String getMemberList(HttpServletRequest request,Principal principal,Model model) throws SQLException {
		MemberDTO dto = new MemberDTO();
		System.out.println(principal.getName());
		String m_Email = principal.getName();
		dto = mypageservice.mypageMember(m_Email);
		List<MemberDTO> member = memberService.getMemberList();
//		System.out.println("controller -----------> " + member);
		model.addAttribute("dto", dto);
		model.addAttribute("member", member);
		request.getSession().setAttribute("tile", "tile");
		
		return "adminpage.adminpage";
	}
	
	@RequestMapping("/deleteMember.htm")
	public @ResponseBody String adminDeleteMember(HttpServletRequest request,MemberDTO memberdto) throws IOException {
		
		String r = "";
		int result = 0;
		try {	result = mypageservice.deleteMember(memberdto);
			if(result > 0) {
				System.out.println("회원삭제 성공");
					
				r="success";
			}else {
				System.out.println("회원삭제 실패");
				r="fail";
			}
	} catch (Exception e) {
		System.out.println("예외발생 : " +  e.getMessage());
		System.out.println("회원탈퇴 실패");
		r="fail";
	}
	
	return r; //주의 (website/index.htm
	
	}
	
	@RequestMapping("/memberfeed.htm")
	public String memberfeed(HttpServletRequest request, Model model) throws SQLException {
		
		request.getSession().setAttribute("tile", "tile");
		String m_Email = request.getParameter("m_Email");
		List<GowithDTO> dto = gowithservice.getWithListAdmin(m_Email);
		String email = dto.get(0).getM_Email();
		
		model.addAttribute("go", dto);
		model.addAttribute("m", email);
		
		return "adminpage.memberfeed";
	}
	
	@RequestMapping("/memberreview.htm")
	public String memberreview(HttpServletRequest request, Model model) throws SQLException {
		request.getSession().setAttribute("tile", "tile");
		String m_Email = request.getParameter("m_EMAIL");
//		System.out.println("-------->" + m_Email);
		List<TravelDTO> dto = travelService.getReviewAdmin(m_Email);
		String email = dto.get(0).getM_Email();
//		System.out.println("-------->" + dto);
		
		model.addAttribute("review", dto);
		model.addAttribute("m", email);
		return "adminpage.memberreview";
	}
	
// 회원 검색 ajax
	@RequestMapping(value="/search.htm")
	public View searchMember(String selectbox, String keyword, Model model){
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("selectbox", selectbox);
		map.put("keyword", keyword);
		System.out.println(map);
		
		List<MemberDTO> search = memberService.searchMember(map);
		model.addAttribute("search", search);
		
		return jsonview;
		
	}
	
	@RequestMapping("/blacklist.htm")
	public String blacklist(HttpServletRequest request, Principal principal, Model model) throws SQLException {
		
		MemberDTO dto = new MemberDTO();
		String m_Email = principal.getName();
		dto = mypageservice.mypageMember(m_Email);
		List<BlacklistDTO> black = memberService.getBlackList();
		model.addAttribute("dto", dto);
		model.addAttribute("black", black);
		
		return "adminpage.blacklist";
	}
	
	@RequestMapping(value="/blackinsert.htm", method=RequestMethod.POST)
	public @ResponseBody String blackinsert(HttpServletRequest request, BlacklistDTO dto) throws SQLException {
		
		String r = "";
		int result = 0;
		try{
			result = memberService.blackinsert(dto);
			System.out.println("-----controller------ " + dto.toString());
		
			if(result > 0) {
				System.out.println("닉네임 변경 성공");
					r="success";
			}else {
				System.out.println("닉네임 변경 실패");
				r="fail";
			}
		} catch (Exception e) {
			System.out.println("예외발생 : " +  e.getMessage());
			System.out.println("닉네임사진 변경 실패");
			r="fail";
		}
		
		return r; //주의 (website/index.htm
	
	}
	
	@RequestMapping("/deleteblack.htm")
	public View deleteblack(HttpServletRequest request,int b_Num,Model model) {

		int re = 0;
		re = memberService.deleteblack(b_Num);
		if(re > 0) {
			List<BlacklistDTO> black = memberService.getBlackList();
			model.addAttribute("black", black);
		}
		else {
			model.addAttribute("fail", "fail");
		}
		//return "index.jsp";
		return jsonview;
	}
	
	@RequestMapping("/adminDeleteMember.htm")
	public View adminDeleteMember(HttpServletRequest request, String m_Email, Model model) {
		
		int re = 0;
		re = memberService.adminDeleteMember(m_Email);
		if(re > 0) {
			List<MemberDTO> member = memberService.getMemberList();
			model.addAttribute("member", member);
		}
		else {
			model.addAttribute("fail", "fail");
		}
		//return "index.jsp";
		return jsonview;
	}
	
	@RequestMapping("/memberreport.htm")
	public String memberReport(HttpServletRequest request, Principal principal, Model model) throws SQLException {
		request.getSession().setAttribute("tile", "tile");
		
		System.out.println("memberreport hello~~");
		MemberDTO dto = new MemberDTO();
		String m_Email = principal.getName();
		dto = mypageservice.mypageMember(m_Email);
		
		List<MemberDTO> report = memberService.memberReport();
		int count = memberService.countMember();
		System.out.println("controller -----------> " + report);
		
		model.addAttribute("dto", dto);
		model.addAttribute("report", report);
		model.addAttribute("count", count);
		
		return "adminpage.memberreport";
	}
	
	@RequestMapping("/travelreport.htm")
	public String travelReport(HttpServletRequest request, Principal principal, Model model) throws SQLException {
		request.getSession().setAttribute("tile", "tile");

		MemberDTO dto = new MemberDTO();
		String m_Email = principal.getName();
		dto = mypageservice.mypageMember(m_Email);
		List<TravelDTO> report = travelService.travelReport();
		List<TravelDTO> mreport = travelService.travelMreport();
		List<TravelDTO> wreport = travelService.travelWreport();
//		System.out.println("controller -----------> " + mreport);
		
		model.addAttribute("dto", dto);
		model.addAttribute("report", report);
		model.addAttribute("mreport", mreport);
		model.addAttribute("wreport", wreport);
		
		return "adminpage.travelreport";
	}
	
	@RequestMapping("/blackcheck.htm")
	public @ResponseBody String blackcheck(HttpServletRequest request,String m_Email,Model model) throws SQLException {
		String re="";
		int result = memberService.blackcheck(m_Email);
		if(result>0) {
			re="success";
		}else {
			re="fail";
		}
		return re;
	}
	
	
}
