package common;

public class Paging {

  /**
   * 페이지 GET
   * 
   * @param current_page
   * @param totalpage
   * @param list_url
   * @return
   */
  public static String pageListGet(int current_page, int totalpage, String list_url) {
    int pagenumber; // 화면에 보여질 페이지 인덱스수
    int startpage; // 화면에 보여질 시작 페이지 번호
    int endpage; // 화면에 보여질 마지막 페이지 번호
    int curpage; // 이동하고자 하는 페이지 번호

    String strList = ""; // 리턴될 페이지 인덱스 리스트

    pagenumber = 5; // 한 화면의 페이지 인덱스수

    // 시작 페이지 번호 구하기
    startpage = ((current_page - 1) / pagenumber) * pagenumber + 1;
    // 마지막 페이지 번호 구하기
    endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;
    // 총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
    // 총페이지수가 마지막 페이지 번호가 됨

    if (totalpage <= endpage)
      endpage = totalpage;

    // 첫번째 페이지 인덱스 화면이 아닌경우
    if (current_page > pagenumber) {
      curpage = startpage - 1; // 시작페이지 번호보다 1적은 페이지로 이동
      strList = strList + "<a href='" + list_url + "&r_page=" + curpage + "'><i class='fa fa-angle-double-left'></i></a>";
    }

    // 시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
    curpage = startpage;
    while (curpage <= endpage) {
      if (curpage == current_page) {
        strList = strList + "<a href='' class='active'>[" + current_page + "]</a>";
      } else {
        strList = strList + "<a href='" + list_url + "&r_page=" + curpage + "'><font color=#666699>[" + curpage + "]</font></a>";
      }
      curpage++;
    }
    // 뒤에 페이지가 더 있는 경우
    if (totalpage > endpage) {
      curpage = endpage + 1;
      strList = strList + "<a href='" + list_url + "&r_page=" + curpage + "'><i class='fa fa-angle-double-right'></i></a>";
    }

    return strList;
  }


  /**
   * 페이지 POST
   * 
   * @param current_page
   * @param totalpage
   * @return
   */
  public static String pageListPost(int current_page, int totalpage) {
    int pagenumber = 5; // 화면에 보여질 페이지 인덱스수

    int startpage; // 화면에 보여질 시작 페이지 번호
    int endpage; // 화면에 보여질 마지막 페이지 번호
    int curpage; // 이동하고자 하는 페이지 번호

    String strList = ""; // 리턴될 페이지 인덱스 리스트

    // 시작 페이지 번호 구하기
    startpage = ((current_page - 1) / pagenumber) * pagenumber + 1;
    // 마지막 페이지 번호 구하기
    endpage = (((startpage - 1) + pagenumber) / pagenumber) * pagenumber;
    // 총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
    // 총페이지수가 마지막 페이지 번호가 됨

    if (totalpage <= endpage)
      endpage = totalpage;

    // 첫번째 페이지 인덱스 화면이 아닌경우
    if (current_page > pagenumber) {
      curpage = startpage - 1; // 시작페이지 번호보다 1적은 페이지로 이동
      strList = strList + "<div onclick=goPage(" + curpage + ")><i class='fas fa-caret-left'></i></div>";
    }

    // 시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
    curpage = startpage;
    while (curpage <= endpage) {
      if (curpage == current_page) {
        strList = strList + "<div style='background: #558203; color: #fff;'>" + current_page + "</div>";
      } else {
        strList = strList + "<div onclick=goPage(" + curpage + ")>" + curpage + "</div>";
      }
      curpage++;
    }
    // 뒤에 페이지가 더 있는 경우
    if (totalpage > endpage) {
      curpage = endpage + 1;
      strList = strList + "<div onclick=goPage(" + curpage + ")><i class='fas fa-caret-right'></i></div>";
    }

    return strList;
  }

}
