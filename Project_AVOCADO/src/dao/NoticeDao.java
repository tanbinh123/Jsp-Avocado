package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.jasper.tagplugins.jstl.core.If;
import common.DBOracleConnection;
import dto.NoticeDto;

public class NoticeDao {

  DBOracleConnection common = new DBOracleConnection();
  Connection connection = null;
  PreparedStatement ps = null;
  ResultSet rs = null;

  /**
   * equalsCheck
   * 
   * @param a 비교할 대상
   * @param b 비교할 문자열
   * @return 같으면 true 다르면 false
   */
  private boolean equalsCheck(String a, String b) {
    if (a.equals(b))
      return true;
    return false;
  }

  /**
   * set query 쿼리문 설정
   * 
   * @param methodName 대상 메소드 이름
   * @return 각 메소드에 맞는 쿼리값
   */
  private String getQuery(String methodName) {
    if (equalsCheck(methodName, "getNoticeList"))
      return "select no, title, attach, content, reg_name, to_char(reg_date,'yyyy-MM-dd'), hit from avocado_notice order by no desc";

    return "";
  }

  /**
   * set query 쿼리문 설정 + dto
   * 
   * @param methodName 대상 메소드 이름
   * @param dto NoticeDto의 값
   * @return 각 메소드에 맞는 쿼리값
   */
  private String getQuery(String methodName, NoticeDto dto) {
    if (equalsCheck(methodName, "save"))
      return "insert into h05_News (no,title,content,reg_name,reg_date,hit) values ('" + dto.getNo() + "','" + dto.getTitle() + "','" + dto.getContent() + "','" + dto.getReg_name() + "','" + dto.getReg_date() + "','" + dto.getHit() + "')";
    if (equalsCheck(methodName, "update"))
      return "update h05_notice set title='" + dto.getTitle() + "', content='" + dto.getContent() + "', attach ='" + dto.getAttach() + "', reg_name ='" + dto.getReg_name() + "', reg_date ='" + dto.getReg_date() + "' where no ='" + dto.getNo() + "'";

    return "";
  }

  /**
   * set query 쿼리문 설정 + no
   * 
   * @param methodName 대상 메소드 이름
   * @param no DB의 no속성
   * @return 각 메소드에 맞는 쿼리값
   */
  private String getQuery(String methodName, String no) {
    if (equalsCheck(methodName, "delete"))
      return " delete from h05_notice where no ='" + no + "'";

    return "";
  }

  /**
   * SQL 오류시 메세지 출력
   * 
   * @param methodName 대상 메소드 이름
   * @param query 오류 쿼리문 출력
   */
  private void printSQLExceptionError(String methodName, String query) {
    System.out.println(methodName + "() query error: " + query);
  }

  /**
   * 오류시 메세지 출력
   * 
   * @param methodName 대상 메소드 이름
   */
  private void printExceptionError(String methodName) {
    System.out.println(methodName + "() error");
  }



  /**
   * DB조회 메소드
   * 
   * @param select 검색 속성 ex)title,content..
   * @param search 검색 내용 ex)주가,오늘 환율..
   * @return notice테이블 select한 내용
   */
  public ArrayList<NoticeDto> getNoticeList(String select, String search) {

    ArrayList<NoticeDto> arr = new ArrayList<NoticeDto>();

    String methodName = "getNoticeList";
    String query = getQuery(methodName);

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        String no = rs.getString(1);
        String title = rs.getString(2);
        String attach = rs.getString(3);
        String content = rs.getString(4);
        String reg_name = rs.getString(5);
        String reg_date = rs.getString(6);
        int hit = rs.getInt(7);

        NoticeDto dto = new NoticeDto(no, title, content, attach, reg_name, reg_date, hit);

        arr.add(dto);
      }
    } catch (SQLException se) {
      printSQLExceptionError(methodName, query);
    } catch (Exception ee) {
      printExceptionError(methodName);
    } finally {
      common.close(connection, ps, rs);
    }

    return arr;
  }


  /**
   * DB save 메소드
   * 
   * @param dto NoticeDto값
   * @return DB작업 성공시 1반환, 실패시 0반환
   */
  public int saveNotice(NoticeDto dto) {
    int result = 0;
    String methodName = "saveNotice";
    String query = getQuery(methodName, dto);

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      result = ps.executeUpdate();
    } catch (SQLException se) {
      printSQLExceptionError(methodName, query);
    } catch (Exception ee) {
      printExceptionError(methodName);
    } finally {
      common.close(connection, ps);
    }
    return result;
  }


  /**
   * DB update 메소드
   * 
   * @param dto NoticeDto값
   * @return DB작업 성공시 1반환, 실패시 0반환
   */
  public int updateNotice(NoticeDto dto) {
    int result = 0;
    String methodName = "updateNotice";
    String query = getQuery(methodName, dto);

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      result = ps.executeUpdate();
    } catch (SQLException se) {
      printSQLExceptionError(methodName, query);
    } catch (Exception ee) {
      printExceptionError(methodName);
    } finally {
      common.close(connection, ps);
    }
    return result;
  }


  /**
   * DB delete 메소드
   * 
   * @param no NoticeDtod의 no속성 값
   * @return DB작업 성공시 1반환, 실패시 0반환
   */
  public int deleteNotice(String no) {
    int result = 0;
    String methodName = "deleteNotice";
    String query = getQuery(methodName, no);

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      result = ps.executeUpdate();
    } catch (SQLException se) {
      printSQLExceptionError(methodName, query);
    } catch (Exception ee) {
      printExceptionError(methodName);
    } finally {
      common.close(connection, ps);
    }
    return result;
  }


}
