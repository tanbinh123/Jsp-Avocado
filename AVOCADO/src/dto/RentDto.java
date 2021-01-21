package dto;

public class RentDto {
  String rent_no, rent_member_no, rent_kickboard_no, rent_startdate, rent_enddate;
  String member_name;
  int rent_stats, rent_useddate, rent_cost;
  
  public RentDto(String rent_no, String rent_member_no, String rent_kickboard_no, String rent_startdate, String rent_enddate, int rent_useddate, int rent_stats, int rent_cost) {
    super();
    this.rent_no = rent_no;
    this.rent_member_no = rent_member_no;
    this.rent_kickboard_no = rent_kickboard_no;
    this.rent_startdate = rent_startdate;
    this.rent_enddate = rent_enddate;
    this.rent_useddate = rent_useddate;
    this.rent_stats = rent_stats;
    this.rent_cost = rent_cost;
  }
  
  public RentDto(String rent_no, String rent_member_no, String member_name, String rent_kickboard_no, String rent_startdate, String rent_enddate, int rent_useddate, int rent_stats, int rent_cost) {
    super();
    this.rent_no = rent_no;
    this.rent_member_no = rent_member_no;
    this.member_name = member_name;
    this.rent_kickboard_no = rent_kickboard_no;
    this.rent_startdate = rent_startdate;
    this.rent_enddate = rent_enddate;
    this.rent_useddate = rent_useddate;
    this.rent_stats = rent_stats;
    this.rent_cost = rent_cost;
  }
  

  public RentDto(String rent_no, String rent_enddate, int rent_stats) {
    super();
    this.rent_no = rent_no;
    this.rent_enddate = rent_enddate;
    this.rent_stats = rent_stats;
  }

  


  


  public RentDto(int rent_useddate, int rent_cost) {
    super();
    this.rent_useddate = rent_useddate;
    this.rent_cost = rent_cost;
  }



  public RentDto(int rent_stats) {
    super();
    this.rent_stats = rent_stats;
  }



  public RentDto(String rent_no, String rent_enddate, int rent_useddate, int rent_stats) {
    super();
    this.rent_no = rent_no;
    this.rent_enddate = rent_enddate;
    this.rent_useddate = rent_useddate;
    this.rent_stats = rent_stats;
  }



  public String getRent_no() {
    return rent_no;
  }

  public String getRent_member_no() {
    return rent_member_no;
  }
  public String getMember_member_name() {
    return member_name;
  }

  public String getRent_kickboard_no() {
    return rent_kickboard_no;
  }

  public String getRent_startdate() {
    return rent_startdate;
  }

  public String getRent_enddate() {
    return rent_enddate;
  }

  public int getRent_useddate() {
    return rent_useddate;
  }

  public int getRent_stats() {
    return rent_stats;
  }

  public int getRent_cost() {
    return rent_cost;
  }
  
  
  
}
