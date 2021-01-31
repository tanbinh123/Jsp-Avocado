package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import common.DBOracleConnection;
import common.commonJDBC;
import dto.MemberDto;

public class MemberDao {

  DBOracleConnection common = new DBOracleConnection();
  Connection connection = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  commonJDBC jdbc = new commonJDBC();

  /**
   * 멤버 번호 생성 메소드
   * 
   * @return 테이블에 아무것도 없으면 M001부터 생성, 하나라도 있으면 최고값 + 1
   */
  public String getMemberNo() {
    String maxNo = "";
    String query = getQuery(null);
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        maxNo = rs.getString(1);
      }
      if (maxNo == null) {
        return "M001";
      }
      if (maxNo != null) {
        DecimalFormat df = new DecimalFormat("000");
        return "M" + df.format((double) Integer.parseInt(maxNo.substring(1)) + 1);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
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
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
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
   * @return 로그인 성공시 해당 회원의 이름 출력, 실패시 공백
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
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
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
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return 0;
  }

  /**
   * 회원 등급 조회 메소드
   * 
   * @param email 로그인폼에서 입력
   * @param password 로그인폼에서 입력
   * @return 로그인 성공시 해당 회원의 이름 출력, 실패시 공백
   */
  public String getRank(String sessionEmail) {
    String member_rank = "";
    String query = "select member_rank\r\n" + "from ta_member\r\n" + "where member_email = '" + sessionEmail + "'";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        member_rank = rs.getString(1);
      }

    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return member_rank;
  }

  /**
   * 쿼리문 가져오기
   * 
   * @param dto
   * @return
   */
  private String getQuery(MemberDto dto) {

    if (jdbc.getMethodName().equals("joinMember")) {
      return " insert into ta_member \r\n" + " (member_no, member_name, member_email, member_phoneNumber, member_password, member_regDate,member_lastRentDate,\r\n" + "          member_money, member_useTimes, member_rank, member_useCount,\r\n" + "          member_accept) \r\n" + "values \r\n" + "('"
          + dto.getMember_no() + "','" + dto.getMember_name() + "','" + dto.getMember_email() + "','" + dto.getMember_phoneNumber() + "','" + dto.getMember_password() + "','" + dto.getMember_regDate() + "','" + dto.getMember_lastRentDate() + "'," + dto.getMember_money() + ",'"
          + dto.getMember_useTimes() + "','" + dto.getMember_rank() + "'," + dto.getMember_useCount() + "," + dto.getMember_accept() + ") ";
    }

    if (jdbc.getMethodName().equals("getLoginName")) {
      return " select member_name from ta_member \r\n" + " where member_email ='" + dto.getMember_email() + "' \r\n" + " and member_password='" + dto.getMember_password() + "'";
    }

    if (jdbc.getMethodName().equals("idCheckCount")) {
      return "select count(*) from ta_member where member_email ='" + dto.getMember_email() + "'";
    }
    if (jdbc.getMethodName().equals("getMemberNo")) {
      return "select max(member_no) from ta_member";
    }

    return "";
  }
}
