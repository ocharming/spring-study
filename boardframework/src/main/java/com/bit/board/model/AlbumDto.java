package com.bit.board.model;

public class AlbumDto extends BoardDto {

  private int aseq;
  private String orign_picture;
  private String save_picture;
  private String savefolder;
  private int type;
  

  public int getAseq() {
    return aseq;
  }

  public void setAseq(int aseq) {
    this.aseq = aseq;
  }

  public String getOrign_picture() {
    return orign_picture;
  }

  public void setOrign_picture(String orign_picture) {
    this.orign_picture = orign_picture;
  }

  public String getSave_picture() {
    return save_picture;
  }

  public void setSave_picture(String save_picture) {
    this.save_picture = save_picture;
  }

  public String getSavefolder() {
    return savefolder;
  }

  public void setSavefolder(String savefolder) {
    this.savefolder = savefolder;
  }

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
  }



}
