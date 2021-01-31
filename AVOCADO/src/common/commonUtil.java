package common;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class commonUtil {
  /**
   * 파일폴더 경로
   */
  public static String file_dir_notice = "C:/Users/junh2/git/Project_AVOCADO/AVOCADO/WebContent/file_room/freooboard";

  /**
   * null 검사
   * 
   * @param 검사값
   * @return null이면 공백, null이 아니면 값
   */
  public static String checkNull(String sValue) {
    String result = "";
    if (sValue != null)
      result = sValue;
    return result;
  }

  /**
   * 현재 날짜 구하기
   * 
   * @return 현재 날짜
   */
  public static String getToday() {
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
    String formatted = format1.format(cal.getTime());
    return formatted;
  }

  /**
   * 현재 날짜 구하기 시간 분 추가
   * 
   * @return 현재 날짜
   */
  public static String getTodayHHmmss() {
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String formatted = format1.format(cal.getTime());
    return formatted;
  }

  /**
   * 문자열을 전달받아 암호화하여 반환하는 메소드 /*단방향 암호 알고리즘(MD5, SHA-1, SHA-256, SHA-512등) 사용 /*MessageDigest 클래스 이용
   **/
  public static String encoding(String str) {
    String encodeString = "";
    try {
      // MessageDigest 객체 생성
      // => 암호화 알고리즘을 선택하여 객체 생성
      MessageDigest md = MessageDigest.getInstance("SHA-256");

      // MessageDigest 객체에 암호화 하고자 하는 원본문자열을 update() 메소드를 이용하여 전달
      // => String 객체가 아닌 byte 배열 형태로 전달(문자열객체.getBytes()
      md.update(str.getBytes());

      // 원본문자열을 digest() 메소드로 암호화 하여 byte 배열로 반환받아 저장
      byte[] encodeData = md.digest();

      // 암호화된 byte 배열을 String 객체로 변환하여 저장
      for (int i = 0; i < encodeData.length; i++) {
        // byte 데이터를 16진수 문자열로 변환하여 반환 문자열에 추가(한번 더 암호화)
        encodeString += Integer.toHexString(encodeData[i] & 0xFF);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return encodeString;
  }
}
