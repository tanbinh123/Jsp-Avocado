package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import common.DBOracleConnection;
import dto.MemberDto;

public class MemberDao {

  DBOracleConnection common = new DBOracleConnection();
  Connection connection = null;
  PreparedStatement ps = null;
  ResultSet rs = null;

  // 번호생성
  public String getMemberNo() {
    String maxNo = "";
    String query = " select max(member_no) from ta_01member ";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        maxNo = rs.getString(1);
      }
      if (maxNo == null) {
        maxNo = "M001";
      } else {
        String n = maxNo.substring(1);
        int i = Integer.parseInt(n);
        i = i + 1;
        DecimalFormat df = new DecimalFormat("000");
        String newNo = df.format((double) i);
        maxNo = "M" + newNo; //
      }
    } catch (SQLException se) {
      System.out.println("getNoticeNo() query 오류: " + query);
    } catch (Exception ee) {
      System.out.println("getNoticeNo() 오류");
    } finally {
      common.close(connection, ps, rs);
    }
    return maxNo;
  }

  /**
   * 아이디 중복검사 메소드
   * 
   * @param email
   * @return 중복 있으면 1이상 중복 없으면 0
   */
  public int idCheckCount(String email) {
    MemberDto dto = new MemberDto(email);
    String query = getQuery(dto);
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next())
        return rs.getInt(1);
    } catch (SQLException se) {
      printSQLExceptionError(query);
    } catch (Exception ee) {
      printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return 0;
  }

  /**
   * 로그인 메소드
   * 
   * @param email 로그인폼에서 입력
   * @param password 로그인폼에서 입력
   * @return 로그인 성공시 해당 회원의 이름 출력, 실패시 null
   */
  public String getLoginName(String email, String password) {
    MemberDto dto = new MemberDto(email, password);
    String member_name = "";
    String query = getQuery(dto);
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        member_name = rs.getString(1);
      }

    } catch (SQLException se) {
      printSQLExceptionError(query);
    } catch (Exception ee) {
      printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return member_name;
  }

  /**
   * 회원가입 메소드
   * 
   * @param dto 회원가입 폼에서 Member dto에 넘겨준 값을 받아옴
   * @return 성공시 1 반환 실패시 0 반환
   */
  public int joinMember(MemberDto dto) {
    String query = getQuery(dto);
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      return ps.executeUpdate();
    } catch (SQLException se) {
      printSQLExceptionError(query);
    } catch (Exception ee) {
      printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return 0;
  }



  /**
   * 쿼리문 가져오기
   * 
   * @param dto
   * @return
   */
  private String getQuery(MemberDto dto) {

    if (getMethodName().equals("joinMember")) {
      return " insert into ta_01member \r\n"
          + " (member_no, member_name, member_email, member_phoneNumber, member_password, member_regDate) \r\n"
          + "values \r\n" + "('" + dto.getMember_no() + "','" + dto.getMember_name() + "','"
          + dto.getMember_email() + "','" + dto.getMember_phoneNumber() + "','"
          + dto.getMember_password() + "','" + dto.getMember_regDate() + "') ";
    }

    if (getMethodName().equals("getLoginName")) {
      return " select member_name from ta_01member \r\n" + " where member_email ='"
          + dto.getMember_email() + "' \r\n" + " and member_password='" + dto.getMember_password()
          + "'";
    }

    if (getMethodName().equals("idCheckCount")) {
      return "select count(*) from ta_01member where member_email ='" + dto.getMember_email() + "'";
    }
    return "";
  }

  /**
   * 실행중인 메소드를 취득
   * 
   * @return 함수명
   */
  public static String getMethodName() {
    return Thread.currentThread().getStackTrace()[3].getMethodName();
  }

  /**
   * SQL 오류시 메세지 출력
   * 
   * @param methodName 대상 메소드 이름
   * @param query 오류 쿼리문 출력
   */
  private void printSQLExceptionError(String query) {
    System.out.println(getMethodName() + "() query error: " + query);
  }

  /**
   * 오류시 메세지 출력
   * 
   * @param methodName 대상 메소드 이름
   */
  private void printExceptionError() {
    System.out.println(getMethodName() + "() error");
  }

}
