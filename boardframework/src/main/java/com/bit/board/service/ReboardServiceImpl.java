package com.bit.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bit.board.common.dao.CommonDao;
import com.bit.board.dao.ReboardDao;
import com.bit.board.model.ReboardDto;
import com.bit.util.BoardConstance;

@Service
public class ReboardServiceImpl implements ReboardService{

  @Autowired
  private SqlSession sqlSession;
  
  @Override
  public int writeArticle(ReboardDto reboardDto) {
    int seq = sqlSession.getMapper(CommonDao.class).getNextSeq();
    reboardDto.setSeq(seq);
    reboardDto.setRef(seq);
    int cnt = sqlSession.getMapper(ReboardDao.class).writeArticle(reboardDto);
    return cnt != 0 ? seq : 0;
  }

  @Override
  public List<ReboardDto> listArticle(Map<String, String> param) {
    int pg = Integer.parseInt(param.get("pg"));
    int end = pg * BoardConstance.LIST_COUNT;
    int start = end - BoardConstance.LIST_COUNT;    
    param.put("start", start+""); // Integer.toString, stringValueOf ???
    param.put("end", end+"");
    return sqlSession.getMapper(ReboardDao.class).listArticle(param);
  }

  @Override
  public ReboardDto viewArticle(int seq) {    
    ReboardDto reboardDto = sqlSession.getMapper(ReboardDao.class).viewArticle(seq);
    if(reboardDto != null) {// 에디터 안쓸때 줄바꿈 로직
      reboardDto.setContent(reboardDto.getContent().replace("\n", "<br>"));
      sqlSession.getMapper(CommonDao.class).updateHit(seq);
    }
    return reboardDto; 
  }
  
  @Override
  public ReboardDto getArticle(int seq) {    
    ReboardDto reboardDto = sqlSession.getMapper(ReboardDao.class).viewArticle(seq);
    return reboardDto; 
  }

  @Override 
  @Transactional
  public int replyArticle(ReboardDto reboardDto) {
    int seq = sqlSession.getMapper(CommonDao.class).getNextSeq();
    reboardDto.setSeq(seq);
    ReboardDao reboardDao = sqlSession.getMapper(ReboardDao.class);
    
    reboardDao.updateStep(reboardDto);
    reboardDao.replyArticle(reboardDto);
    reboardDao.updateReply(reboardDto.getPseq());
    
    return seq;
  }

  @Override
  public void modifyArticle(ReboardDto reboardDto) {
    
    
  }

  @Override
  public void deleteArticle(int seq) {
    // TODO Auto-generated method stub
    
  }

}

/*
숫자확인 메서드 예시
public int StringToInt(String tmp) {
  boolean flag;
  if(tmp != null) {
    int len = tmp.length();
    for (int i =0; i <len;i++) {
      int x = tmp.charAt(i) - 48; // 문자(char)를 숫자(int)로 변환 ascii코드값
      if(x<0||x>9) {
        flag=false;
        break;
      }
    }
  }
  if(flag)
    return Integer.parseInt(tmp);
  return 0;
}
*/