package test;

import java.util.ArrayList;
import java.util.Random;
import common.commonUtil;
import dao.KickboardDao;
import dto.KickboardDto;

public class KickboardDataInsert {

  public static void main(String[] args) {
  KickboardDao dao = new KickboardDao();

    String[] location =     {
        "new naver.maps.LatLng(36.32908196990477, 127.42456225985184)",
        "new naver.maps.LatLng(36.32887012967181, 127.42303714887701)",
        "new naver.maps.LatLng(36.32318016692447, 127.41281683358346)",
        "new naver.maps.LatLng(36.323134629229294, 127.41015150879174)",
        "new naver.maps.LatLng(36.32742401621243, 127.40962521002982)",
        "new naver.maps.LatLng(36.32699460067121, 127.4267928801413)",
        "new naver.maps.LatLng(36.32394799584896, 127.42238013163477)",
        "new naver.maps.LatLng(36.32140266230591, 127.43343120519492)",
        "new naver.maps.LatLng(36.3332749063202, 127.4152319954952)",
        "new naver.maps.LatLng(36.335216644546726, 127.42359293195015)"
        };
    
    
//    Random random = new Random();
//    
//    for (int i = 0; i < location.length; i++) {
//
//      String kickboard_no = dao.getKickboardNo();
//      String kickboard_name = "아보카도킥보드";
//      String kickboard_type = "나노휠프리미엄";
//      String kickboard_location = location[i];
//      String kickboard_regdate = commonUtil.getTodayHHmmss();
//      int kickboard_totalusedtimes = 0;
//      String kickboard_img = "";
//      int kickboard_rentstats = 0;
//      int kickboard_battery = random.nextInt(101);
//      KickboardDto dto = new KickboardDto(kickboard_no, kickboard_name, kickboard_type, kickboard_location, kickboard_regdate, kickboard_img, kickboard_rentstats, kickboard_totalusedtimes, kickboard_battery);
//      int result = dao.saveKickboard(dto);
//      if (result == 1) {
//        System.out.println(i + 1 + "번 성공");
//      } else {
//        System.out.println(i + 1 + "번 실패");
//      }
//    }

    
    
  //조회
//    ArrayList<KickboardDto> arr = dao.getKickboardValue();
//    
//    for (int i = 0; i < arr.size(); i++) {
//    String no = arr.get(i).getKickboard_no();
//    String name = arr.get(i).getKickboard_name();
//    String type = arr.get(i).getKickboard_type();
//    String location = arr.get(i).getKickboard_location();
//    int totalusedtimes = arr.get(i).getKickboard_totalusedtimes();
//    int rentstats = arr.get(i).getKickboard_rentstats();
//    int battery = arr.get(i).getKickboard_battery();
//    
//    System.out.println(i + " 번 : " + no + "\t" +  name + "\t" +  type + "\t" +  location + "\t" +  totalusedtimes  + "\t" +  rentstats  + "\t" + battery);
//    }
  }
    
    

}
