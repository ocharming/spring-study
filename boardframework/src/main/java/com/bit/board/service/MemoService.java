package com.bit.board.service;

import java.util.List;
import com.bit.board.model.MemoDto;

public interface MemoService {
  
  int writeMemo(MemoDto memoDto);
  String listMemo(int seq);
  int modifyMemo(MemoDto memoDto);
  int deleteMemo(int seq);
  
  /*
  int writeMemo(MemoDto memoDto);
  List<MemoDto> listMemo(Map<String, String> param);
  void modifyMemo(MemoDto memoDto);
  void deleteMemo(int mseq);
   */
  
}
