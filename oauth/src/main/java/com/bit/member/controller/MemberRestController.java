package com.bit.member.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.bit.member.model.MemberDto;
import com.bit.member.service.MemberRestService;


@RestController
@RequestMapping("/member")
public class MemberRestController {

  @Autowired
  MemberRestService memberRestService;

  @RequestMapping(value = "rest", method = RequestMethod.POST)
  public void insert(@RequestBody MemberDto memberDto) {
    memberRestService.insertMember(memberDto);
  }
  
  @RequestMapping(value = "rest", method = RequestMethod.PUT)
  public void update(@RequestBody MemberDto memberDto) {
    memberRestService.updateMember(memberDto);
  }
  @RequestMapping(value = "search", method = RequestMethod.POST)
  public String search(@RequestBody String id) {
    MemberDto memberDto = new MemberDto();
    memberDto.setName(id);
    memberDto.setId(id);
    String list = memberRestService.searchMember(memberDto);
    return list;
  }

  @RequestMapping(value = "idcheck", method = RequestMethod.POST)
  public Map<Object, Object> idcheck(@RequestBody String id) {
    int count = 0;
    Map<Object, Object> map = new HashMap<Object, Object>();

    count = memberRestService.idcheck(id);
    map.put("cnt", count);

    return map;
  }

  @RequestMapping(value = "rest", method = RequestMethod.GET)
  public String list() {
    String list = memberRestService.selectMember();
    return list;
  }
  
  @RequestMapping(value = "rest/{id}", method = RequestMethod.GET)
  public String detail(@PathVariable(value="id") String id) {
    return memberRestService.infoMember(id).toString();
  }
  
  @RequestMapping(value="rest/{id}", method=RequestMethod.DELETE)
  public void delete(@PathVariable(value="id") String id, MemberDto meberDto) {
    meberDto.setId(id);
    memberRestService.deleteMember(meberDto);
  }


}




