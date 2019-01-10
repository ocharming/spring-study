package com.bit.member.model;

public class MemberDto {

  private int seq;
  private String id;
  private String name;
  private String password;
  
  
  @Override
  public String toString() {
    return "MemberDto [seq=" + seq + ", id=" + id + ", name=" + name + ", password=" + password
        + "]";
  }
  
  
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    this.seq = seq;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  
}
