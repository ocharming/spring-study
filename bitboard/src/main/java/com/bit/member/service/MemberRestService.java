package com.bit.member.service;

import java.util.Map;
import com.bit.member.model.MemberDto;

public interface MemberRestService {
  
  String selectMember();

  String infoMember(String id);

  void insertMember(MemberDto memberDto);

  void updateMember(MemberDto memberDto);

  void deleteMember(MemberDto memberDto);
  
  int idcheck(String id);

  String searchMember(MemberDto memberDto);
  
}
