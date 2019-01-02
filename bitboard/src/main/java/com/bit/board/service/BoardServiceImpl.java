package com.bit.board.service;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.board.dao.BoardDao;
import com.bit.board.model.BoardDto;
import com.bit.common.dao.CommonDao;
import com.bit.util.BoardConstance;

@Service
public class BoardServiceImpl implements BoardService{

  @Autowired
  private SqlSession sqlSession;
  
  @Override
  public int writeArticle(BoardDto boardDto) {
    int seq = sqlSession.getMapper(CommonDao.class).getNextSeq();
    boardDto.setSeq(seq);
    int cnt = sqlSession.getMapper(BoardDao.class).writeArticle(boardDto);
    return cnt != 0 ? seq : 0;
  }

  @Override
  public List<BoardDto> listArticle(Map<String, String> param) {
    int pg = Integer.parseInt(param.get("pg"));
    int end = pg * BoardConstance.LIST_COUNT;
    int start = end - BoardConstance.LIST_COUNT;
    param.put("start", Integer.toString(start));
    param.put("end", Integer.toString(end));
    return sqlSession.getMapper(BoardDao.class).listArticle(param);
  }

  @Override
  public BoardDto viewArticle(int seq) {
    BoardDto boardDao = sqlSession.getMapper(BoardDao.class).viewArticle(seq);
    if(boardDao != null) {
      sqlSession.getMapper(CommonDao.class).updateHit(seq);
      boardDao.setContent(boardDao.getContent().replace("\n", "<br>"));
    }
    return boardDao;
  }

  @Override
  public int replyArticle(BoardDto boardDto) {
    return 0;
  }

  @Override
  public void modifyArticle(BoardDto boardDto) {
    
  }

  @Override
  public void deleteArticle(int seq) {
    
  }

}
