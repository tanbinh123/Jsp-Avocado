package test;

import dao.BanAreaDao;
import dto.BanAreaDto;

public class BanAreaDataInsert {

  public static void main(String[] args) {
    // TODO Auto-generated method stub
    BanAreaDao dao = new BanAreaDao();
    String[] location =     {
        "new naver.maps.LatLng(36.324026499385354, 127.43458819202093)",
        "new naver.maps.LatLng(36.32360781004883, 127.43492578826826)",
        "new naver.maps.LatLng(36.32388286169126, 127.43572615689958)",
        "new naver.maps.LatLng(36.32431377397926, 127.43549856392384)"
        };
    
    
    for (int i = 0; i < location.length; i++) {
      int banarea_no = dao.getBanAreaNo();
      String banarea_name = "hanoulAPT";
      String banarea_loacationValue = location[i];
      BanAreaDto dto = new BanAreaDto(banarea_no, banarea_name, banarea_loacationValue);
      int result = dao.saveBanArea(dto);
      if (result == 1) {
        System.out.println(i +"번 성공");
      }else {
          System.out.println(i +"번 실패");
        }
      }
  }

}
