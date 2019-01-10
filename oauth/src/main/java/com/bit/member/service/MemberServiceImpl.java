package com.bit.member.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.member.dao.MemberDao;
import com.bit.member.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
  
  @Autowired
  SqlSession sqlSession;

  @Override
  public MemberDto infoMember(String id) {
    return sqlSession.getMapper(MemberDao.class).infoMember(id);
  }

}
