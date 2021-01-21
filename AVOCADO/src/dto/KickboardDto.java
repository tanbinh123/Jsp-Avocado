package dto;

public class KickboardDto {
  
  String kickboard_no, kickboard_name, kickboard_type, kickboard_location, kickboard_regdate, kickboard_img;
  int kickboard_rentstats, kickboard_totalusedtimes, kickboard_battery;
  
  
  public KickboardDto(String kickboard_no, String kickboard_name, String kickboard_type, String kickboard_location, String kickboard_regdate, String kickboard_img, int kickboard_rentstats, int kickboard_totalusedtimes, int kickboard_battery) {
    super();
    this.kickboard_no = kickboard_no;
    this.kickboard_name = kickboard_name;
    this.kickboard_type = kickboard_type;
    this.kickboard_location = kickboard_location;
    this.kickboard_regdate = kickboard_regdate;
    this.kickboard_img = kickboard_img;
    this.kickboard_rentstats = kickboard_rentstats;
    this.kickboard_totalusedtimes = kickboard_totalusedtimes;
    this.kickboard_battery = kickboard_battery;
  }
  
  
  
  public KickboardDto(String kickboard_no, String kickboard_name, String kickboard_type, String kickboard_location, int kickboard_rentstats, int kickboard_battery) {
    super();
    this.kickboard_no = kickboard_no;
    this.kickboard_name = kickboard_name;
    this.kickboard_type = kickboard_type;
    this.kickboard_location = kickboard_location;
    this.kickboard_rentstats = kickboard_rentstats;
    this.kickboard_battery = kickboard_battery;
  }



  public KickboardDto(String kickboard_no) {
    super();
    this.kickboard_no = kickboard_no;
  }



  public String getKickboard_no() {
    return kickboard_no;
  }
  public String getKickboard_name() {
    return kickboard_name;
  }
  public String getKickboard_type() {
    return kickboard_type;
  }
  public String getKickboard_location() {
    return kickboard_location;
  }
  public String getKickboard_regdate() {
    return kickboard_regdate;
  }
  public String getKickboard_img() {
    return kickboard_img;
  }
  public int getKickboard_rentstats() {
    return kickboard_rentstats;
  }
  public int getKickboard_totalusedtimes() {
    return kickboard_totalusedtimes;
  }
  public int getKickboard_battery() {
    return kickboard_battery;
  }
 
  
  
  

}
