package bitcamp.travelmaker.mypage.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import bitcamp.travelmaker.mypage.service.MessageService;



@Controller
public class MessageController {

	@Autowired
	private View jsonview;
	
	@Autowired
	private MessageService messageService;

	@RequestMapping("/message_list.htm")
	public String gowith_connect(Principal principal,Model model) {
		String m_Email=principal.getName();
		
		List<HashMap<String, Object>> list = messageService.listMessage(m_Email);
		List<HashMap<String, Object>> Slist = messageService.SlistMessage(m_Email);
		model.addAttribute("list", list);
		model.addAttribute("Slist", Slist);
		
		return "message";
	}
	
/*	@RequestMapping("/ms_list.htm")
	public View gowith_list(Principal principal,Model model) {
		System.out.println("메시지컨트"+principal.getName());
		String m_Email=principal.getName();
		
		List<HashMap<String, Object>> list = messageService.listMessage(m_Email);
		model.addAttribute("aaData", list);
		System.out.println("뿌리기 전"+list.toString());
		return jsonview;
	}*/
	
	@RequestMapping(value = "/message_insert.htm", method = { RequestMethod.POST })
	public View gowith_insert(Principal principal,Model model,String m_Remail, String n_Content, HashMap<String, Object> map) {
		System.out.println("메시지컨트"+principal.getName());
		String m_Semail = principal.getName();
		
		map.put("m_Remail", m_Remail);
		map.put("m_Semail", m_Semail);
		map.put("n_Content", n_Content);
		
		System.out.println("인서트 컨트롤러 : "+map.toString());
		int result = messageService.insertMessage(map);
		
		return jsonview;
	
	}

	
	@RequestMapping(value = "/message_delete.htm", method = { RequestMethod.POST })
	public View gowith_delete(Principal principal,String num) {
		System.out.println("메시지컨트"+principal.getName());
		String m_Semail = principal.getName();
		
		int n_Num=Integer.parseInt(num);
		
		messageService.deleteMessage(n_Num);
		
		return jsonview;
	}
	
	
	
}
