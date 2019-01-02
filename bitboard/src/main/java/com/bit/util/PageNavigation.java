package com.bit.util;

public class PageNavigation {

  private String root;
  private boolean nowFirst;
  private boolean nowEnd;
  private int totalArticleCount;
  private int newArticleCount;
  private int totalPageCount;
  private int pageNo;
  private String navigator;

  public String getRoot() {
    return root;
  }

  public void setRoot(String root) {
    this.root = root;
  }

  public boolean isNowFirst() {
    return nowFirst;
  }

  public void setNowFirst(boolean nowFirst) {
    this.nowFirst = nowFirst;
  }

  public boolean isNowEnd() {
    return nowEnd;
  }

  public void setNowEnd(boolean nowEnd) {
    this.nowEnd = nowEnd;
  }

  public int getTotalArticleCount() {
    return totalArticleCount;
  }

  public void setTotalArticleCount(int totalArticleCount) {
    this.totalArticleCount = totalArticleCount;
  }

  public int getNewArticleCount() {
    return newArticleCount;
  }

  public void setNewArticleCount(int newArticleCount) {
    this.newArticleCount = newArticleCount;
  }

  public int getTotalPageCount() {
    return totalPageCount;
  }

  public void setTotalPageCount(int totalPageCount) {
    this.totalPageCount = totalPageCount;
  }

  public int getPageNo() {
    return pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  public String getNavigator() {
    return navigator;
  }

  public void makeNavigator() {
    StringBuffer tmpNavigator = new StringBuffer();
    int pageSize = BoardConstance.PAGE_COUNT;
    int preEnd = (pageNo - 1) / pageSize * pageSize;

    tmpNavigator.append("<nav>\n");
    tmpNavigator.append(" <ul class='pagination pagination-sm pagination-sm'>\n");
    if (this.isNowFirst()) {
      tmpNavigator.append("  <li class='disabled'>\n");
      tmpNavigator.append("   <span>\n");
      tmpNavigator.append("   <span aria-hidden='true'>&laquo</span>\n");
      tmpNavigator.append("   </span>\n");
      tmpNavigator.append("   </li>\n");
    } else {
      tmpNavigator.append("  <li>\n");
      tmpNavigator.append("   <span>");
      tmpNavigator.append("   <a href='#' class='mvpage' move-page-no='" + preEnd + "'>&laquo</a>\n");
      tmpNavigator.append("   </span>\n");
      tmpNavigator.append("   </li>");
    }
    int startPage = preEnd + 1;

    int endPage = preEnd + pageSize;
    if(endPage > totalPageCount)
      endPage = totalPageCount;

    for (int i = startPage; i <= endPage; i++) {
      if (pageNo == i) {
        tmpNavigator.append("     <li class='active'>\n");
        tmpNavigator.append("     <span>" + i + "<span class='sr-only'>(current)</span></span>");
        tmpNavigator.append(" </li>\n");
      } else {
        tmpNavigator.append("     <li>\n");
        tmpNavigator.append("     <a href='#' class='mvpage' move-page-no='" + i + "'>" + i + "</a>");
        tmpNavigator.append(" </li>\n");
      }
    }

    if (this.isNowEnd()) {
      tmpNavigator.append("   <li class='disabled'>");
      tmpNavigator.append("   <span>");
      tmpNavigator.append("   <span aria-hidden='true'>&raquo</span>\n");
      tmpNavigator.append("   </span>");
      tmpNavigator.append(" </li>\n");
    } else {
      tmpNavigator.append("   <li>");
      tmpNavigator.append("   <span>");
      tmpNavigator.append("   <a href='#' class='mvpage' move-page-no='" + (preEnd + pageSize + 1) + "'>&raquo</a>\n");
      tmpNavigator.append("   </span>");
      tmpNavigator.append(" </li>\n");
    }

    tmpNavigator.append("  </ul>\n");
    tmpNavigator.append(" </nav>\n");

    this.navigator = tmpNavigator.toString();
  }

}
