package com.bit.board.common.service;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.board.common.dao.CommonDao;
import com.bit.util.BoardConstance;
import com.bit.util.PageNavigation;

//service가 2개일시 설정 필요
@Service
public class CommonServiceImpl implements CommonService{

  @Autowired
  SqlSession sqlSession;
  
  @Override
  public PageNavigation makePageNavigation(Map<String, String> param) {
    int pg = Integer.parseInt(param.get("pg"));
    int pageSize = BoardConstance.PAGE_COUNT;
    int listSize = BoardConstance.LIST_COUNT;
    
    PageNavigation navigation = new PageNavigation();
    int newArticleCount = 
        sqlSession.getMapper(CommonDao.class).getNewArticleCount(Integer.parseInt(param.get("bcode")));    
    navigation.setNewArticleCount(newArticleCount);
    
    int totalArticleCount = 
        sqlSession.getMapper(CommonDao.class).getTotalArticleCount(param);
    navigation.setTotalArticleCount(totalArticleCount);
    
    int totalPageCount = ((totalArticleCount-1)/listSize) + 1;
    navigation.setTotalPageCount(totalPageCount);
    navigation.setPageNo(pg);
    navigation.setNowFirst(pg <= pageSize);
    navigation.setNowEnd(pg > (totalPageCount-1)/pageSize*pageSize);
    
    return navigation;
  }

}
