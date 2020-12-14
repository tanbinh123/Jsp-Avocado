package common;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class commonUtil {
  /**
   * 현재 날짜 구하기
   * @return 현재 날짜
   */
  public static String getToday() {
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
    String formatted = format1.format(cal.getTime());
    return formatted;
  }
}
