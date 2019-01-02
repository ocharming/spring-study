package com.bit.member.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bit.member.dao.MemberDao;
import com.bit.member.model.MemberDto;

@Service
public class MemberRestServiceImpl implements MemberRestService {
  
  @Autowired
  SqlSession sqlSession;
  
  @Autowired
  BCryptPasswordEncoder encoder;

  @Override
  public String selectMember() {
    List<MemberDto> list = sqlSession.getMapper(MemberDao.class).selectMember();
    JSONArray array = new JSONArray();
    for(MemberDto memberDto : list) {
      JSONObject mem = new JSONObject();
      mem.put("seq", memberDto.getSeq());
      mem.put("id", memberDto.getId());
      mem.put("name", memberDto.getName());
      mem.put("phone", memberDto.getPhone());
      mem.put("email", memberDto.getEmail());
      array.put(mem);
    }
    
    return array.toString();
  }

  @Override
  public String infoMember(String id) {
    JSONObject member = new JSONObject();
    MemberDto memberDto = sqlSession.getMapper(MemberDao.class).infoMember(id);
    member.put("id", memberDto.getId());
    member.put("name", memberDto.getName());
    member.put("birth", memberDto.getBirth());
    member.put("gender", memberDto.getGender());
    member.put("phone", memberDto.getPhone());
    member.put("email", memberDto.getEmail());
    member.put("addr", memberDto.getAddr());
    member.put("addrcode", memberDto.getAddrcode());
    member.put("addr2", memberDto.getAddr2());
    return member.toString();
        
  }

  @Transactional
  @Override
  public void insertMember(MemberDto memberDto) {
    memberDto.setPassword(encoder.encode(memberDto.getPassword()));
    sqlSession.getMapper(MemberDao.class).insertUsers(memberDto);
    memberDto.setSeq(sqlSession.getMapper(MemberDao.class).getSeq(memberDto));
    sqlSession.getMapper(MemberDao.class).insertMember(memberDto);
    sqlSession.getMapper(MemberDao.class).insertAuthorities(memberDto);
  }
  
  @Transactional
  @Override
  public void updateMember(MemberDto memberDto) {
    memberDto.setSeq(sqlSession.getMapper(MemberDao.class).getSeq(memberDto));
    sqlSession.getMapper(MemberDao.class).updateMember(memberDto);
  }
  
  
  @Transactional
  @Override
  public void deleteMember(MemberDto memberDto) {
    memberDto.setSeq(sqlSession.getMapper(MemberDao.class).getSeq(memberDto));
    sqlSession.getMapper(MemberDao.class).deleteAuthorities(memberDto.getSeq());
    sqlSession.getMapper(MemberDao.class).deleteMember(memberDto.getSeq());
    sqlSession.getMapper(MemberDao.class).deleteUsers(memberDto.getSeq());
  }
  
  @Override
  public int idcheck(String id) {
    int count = 0;
    count = sqlSession.getMapper(MemberDao.class).idcheck(id);
    return count;
  }

  @Override
  public String searchMember(MemberDto memberDto) {
    List<MemberDto> list = sqlSession.getMapper(MemberDao.class).searchMember(memberDto);
    JSONArray array = new JSONArray();
    for(MemberDto member : list) {
      JSONObject mem = new JSONObject();
      mem.put("seq", member.getSeq());
      mem.put("id", member.getId());
      mem.put("name", member.getName());
      mem.put("phone", member.getPhone());
      mem.put("email", member.getEmail());
      array.put(mem);
    }
    System.out.println(array.toString());
    return array.toString();
  }
}
