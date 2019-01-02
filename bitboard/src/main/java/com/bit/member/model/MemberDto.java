package com.bit.member.model;

public class MemberDto {

  private int seq;
  private String id;
  private String name;
  private String email;
  private String password;
  private String birth;
  private int gender;
  private String phone;
  private String addrcode;
  private String addr;
  private String addr2;

  
  @Override
  public String toString() {
    return "MemberDto [seq=" + seq + ", id=" + id + ", name=" + name + ", email=" + email
        + ", password=" + password + ", birth=" + birth + ", gender=" + gender + ", phone=" + phone
        + ", addrcode=" + addrcode + ", addr=" + addr + ", addr2=" + addr2 + "]";
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
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getBirth() {
    return birth;
  }
  public void setBirth(String birth) {
    this.birth = birth;
  }
  public int getGender() {
    return gender;
  }
  public void setGender(int gender) {
    this.gender = gender;
  }
  public String getPhone() {
    return phone;
  }
  public void setPhone(String phone) {
    this.phone = phone;
  }
  public String getAddrcode() {
    return addrcode;
  }
  public void setAddrcode(String addrcode) {
    this.addrcode = addrcode;
  }
  public String getAddr() {
    return addr;
  }
  public void setAddr(String addr) {
    this.addr = addr;
  }
  public String getAddr2() {
    return addr2;
  }
  public void setAddr2(String addr2) {
    this.addr2 = addr2;
  }

}
