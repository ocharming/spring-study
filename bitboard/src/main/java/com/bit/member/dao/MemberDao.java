package com.bit.member.dao;

import java.util.List;
import java.util.Map;
import com.bit.member.model.MemberDto;

public interface MemberDao {

  List<MemberDto> selectMember();

  MemberDto infoMember(String id);

  void insertMember(MemberDto memberDto);
  
  int getSeq(MemberDto memberDto);
  
  void insertUsers(MemberDto memberDto);
  
  void insertAuthorities(MemberDto memberDto);

  void updateMember(MemberDto memberDto);

  void deleteMember(int seq);
  
  void deleteAuthorities(int seq);
  
  void deleteUsers(int seq);
  
  int idcheck(String id);

  List<MemberDto> searchMember(MemberDto memberDto);
  
}
