package com.bit.board.admin.dao;

import java.util.List;
import com.bit.board.admin.model.BoardListDto;
import com.bit.board.admin.model.BoardTypeDto;
import com.bit.board.admin.model.CategoryDto;

public interface BoardAdminDao {
  List<BoardListDto> getBoardMenu();
  List<CategoryDto> getCategory();
  void makeCategory(CategoryDto categoryDto); // Category 테이블에 insert
  List<BoardTypeDto> getBoardType();
  void makeBoard(BoardListDto boardListDto); // BoardList 테이블에 insert
}
