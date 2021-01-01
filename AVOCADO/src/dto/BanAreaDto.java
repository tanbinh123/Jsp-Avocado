package dto;

public class BanAreaDto {

  int banarea_no;
  String banarea_name, banarea_loacationValue;
  
  public BanAreaDto(int banarea_no, String banarea_name, String banarea_loacationValue) {
    super();
    this.banarea_no = banarea_no;
    this.banarea_name = banarea_name;
    this.banarea_loacationValue = banarea_loacationValue;
  }

  public int getBanarea_no() {
    return banarea_no;
  }

  public String getBanarea_name() {
    return banarea_name;
  }

  public String getBanarea_loacationValue() {
    return banarea_loacationValue;
  }
  
  
}
