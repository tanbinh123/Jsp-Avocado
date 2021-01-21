package dto;

public class MemberDto {
  String member_no, member_name, member_email, member_phoneNumber, member_password, member_regDate,
      member_lastRentDate, member_rank;
  int member_useCount, member_accept, member_money,member_useTimes;

  public MemberDto(String member_no, String member_name, String member_email,
      String member_phoneNumber, String member_password, String member_lastRentDate,
      int member_money, int member_useTimes, String member_rank,String member_regDate, int member_useCount,
      int member_accept) {
    super();
    this.member_no = member_no;
    this.member_name = member_name;
    this.member_email = member_email;
    this.member_phoneNumber = member_phoneNumber;
    this.member_password = member_password;
    this.member_lastRentDate = member_lastRentDate;
    this.member_money = member_money;
    this.member_useTimes = member_useTimes;
    this.member_rank = member_rank;
    this.member_regDate = member_regDate;
    this.member_useCount = member_useCount;
    this.member_accept = member_accept;
  }



  public MemberDto(String member_no, String member_name, String member_email,
      String member_phoneNumber, String member_password, String member_regDate) {
    super();
    this.member_no = member_no;
    this.member_name = member_name;
    this.member_email = member_email;
    this.member_phoneNumber = member_phoneNumber;
    this.member_password = member_password;
    this.member_regDate = member_regDate;
  }



  public MemberDto(String member_email, String member_password) {
    super();
    this.member_email = member_email;
    this.member_password = member_password;
  }

  


  public MemberDto(String member_email) {
    super();
    this.member_email = member_email;
  }






  public String getMember_no() {
    return member_no;
  }

  public String getMember_name() {
    return member_name;
  }

  public String getMember_email() {
    return member_email;
  }

  public String getMember_phoneNumber() {
    return member_phoneNumber;
  }

  public String getMember_password() {
    return member_password;
  }

  public String getMember_lastRentDate() {
    return member_lastRentDate;
  }

  public int getMember_money() {
    return member_money;
  }

  public int getMember_useTimes() {
    return member_useTimes;
  }

  public String getMember_rank() {
    return member_rank;
  }
  
  public String getMember_regDate() {
    return member_regDate;
  }

  public int getMember_useCount() {
    return member_useCount;
  }

  public int getMember_accept() {
    return member_accept;
  }


}
