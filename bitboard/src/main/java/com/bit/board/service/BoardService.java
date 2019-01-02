package com.bit.board.service;

import java.util.List;
import java.util.Map;
import com.bit.board.model.BoardDto;

public interface BoardService {
  int writeArticle(BoardDto boardDto);
  List<BoardDto> listArticle(Map<String, String> param);
  BoardDto viewArticle(int seq);
  int replyArticle(BoardDto boardDto);
  
  void modifyArticle(BoardDto boardDto);
  void deleteArticle(int seq);
}
