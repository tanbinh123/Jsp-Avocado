package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import common.DBOracleConnection;
import common.commonJDBC;
import dto.KickboardDto;
import dto.MemberDto;
import dto.RentDto;

public class RentDao {

  DBOracleConnection common = new DBOracleConnection();
  Connection connection = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  commonJDBC jdbc = new commonJDBC();

  // 렌트 테이블 목록 조회
  public ArrayList<RentDto> getRent() {
    ArrayList<RentDto> arr = new ArrayList<RentDto>();

    String query = "select * from ta_rent order by rent_no asc";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        String no = rs.getString(1);
        String member_no = rs.getString(2);
        String kickboard_no = rs.getString(3);
        String startdate = rs.getString(4);
        String enddate = rs.getString(5);
        int useddate = rs.getInt(6);
        int stats = rs.getInt(7);
        int cost = rs.getInt(8);
        RentDto dto = new RentDto(no, member_no, kickboard_no, startdate, enddate, useddate, stats, cost);
        arr.add(dto);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }

    return arr;
  }

  // 렌트 테이블 쿼리 한개 조회
  public ArrayList<RentDto> getRent(String rent_no) {
    ArrayList<RentDto> arr = new ArrayList<RentDto>();

    String query = "select * from ta_rent where rent_no = '" + rent_no + "'";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        String no = rs.getString(1);
        String member_no = rs.getString(2);
        String kickboard_no = rs.getString(3);
        String startdate = rs.getString(4);
        String enddate = rs.getString(5);
        int useddate = rs.getInt(6);
        int stats = rs.getInt(7);
        int cost = rs.getInt(8);
        RentDto dto = new RentDto(no, member_no, kickboard_no, startdate, enddate, useddate, stats, cost);
        arr.add(dto);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }

    return arr;
  }

  // 서비스 시작
  public int serviceStart(RentDto dto) {
    int result = 0;
    String query = "insert into ta_rent \r\n" + "(rent_no, rent_member_no, rent_kickboard_no, rent_startdate, rent_enddate, rent_useddate, rent_stats) \r\n" + "values \r\n" + "('" + dto.getRent_no() + "','" + dto.getRent_member_no() + "','" + dto.getRent_kickboard_no() + "',TO_DATE('"
        + dto.getRent_startdate() + "','YYYY-MM-DD HH24:MI:SS'),TO_DATE('" + dto.getRent_enddate() + "','YYYY-MM-DD HH24:MI:SS')," + dto.getRent_useddate() + "," + dto.getRent_stats() + ")";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      result = ps.executeUpdate();
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return result;
  }

  // 서비스 끝
  public int serviceEnd(RentDto dto) {
    int result = 0;
    String query = "update ta_rent set rent_enddate = TO_DATE('" + dto.getRent_enddate() + "','YYYY-MM-DD HH24:MI:SS'), rent_stats = " + dto.getRent_stats() + " where rent_no = '" + dto.getRent_no() + "'";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      result = ps.executeUpdate();
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return result;
  }



  // 서비스 끝 이용시간 조회
  public String getServiceUsedDate(RentDto dto) {
    String result = "";
    String query = "SELECT ROUND((rent_enddate-rent_startdate)*24*60*60) FROM ta_rent where rent_no = '" + dto.getRent_no() + "'";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        result = rs.getString(1);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return result;
  }


  // 서비스 끝 이용시간 이용 요금 업데이트
  public void serviceEndUsedDate(int useddate, int cost, String rent_no) {
    String query = "update ta_rent set rent_useddate = '" + useddate + "', rent_cost = '" + cost + "' where rent_no = '" + rent_no + "'";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      ps.executeUpdate();
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
  }

  // 서비스 끝 멤버 테이블에 유저 마지막 이용날짜 업데이트, 유저 이용횟수 증가 all
  public void updateMemberServiceEnd(RentDto dto, String member_no, int usedTimes) {
    String query = "update ta_member set member_usetimes = member_usetimes + " + usedTimes + ", member_lastrentdate = TO_DATE('" + dto.getRent_enddate() + "','YYYY-MM-DD HH24:MI:SS'), member_useCount = member_useCount + 1 where member_no = '" + member_no + "'";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      ps.executeUpdate();
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
  }

  // 서비스 끝 멤버 테이블에 유저 마지막 이용날짜 업데이트
  public void updateMemberLastRentDate(RentDto dto, String member_no) {
    String query = "update ta_member set member_lastrentdate = TO_DATE('" + dto.getRent_enddate() + "','YYYY-MM-DD HH24:MI:SS') where member_no = '" + member_no + "'";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      ps.executeUpdate();
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
  }

  // 서비스 끝 멤버 테이블에 유저 이용횟수 증가
  public void addMemberUseCount(String member_no) {
    String query = " update ta_member set member_useCount = member_useCount + 1\r\n" + " where member_no='" + member_no + "' ";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      ps.executeUpdate();
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
  }

  // 서비스 끝 멤버 테이블에 유저 총 이용시간 증가
  public void addMemberUseTimes(String member_no, int useTimes) {
    String query = " update ta_member set member_usetimes = member_usetimes + " + useTimes + "\r\n" + " where member_no='" + member_no + "' ";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      ps.executeUpdate();
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
  }


  // 서비스 이용 중인 킥보드 상태 단일 조회
  public int getUsingServiceStats(String MemberNo) {
    int rent_stats = -1;
    String query = "select count(rent_stats)\r\n" + "from ta_rent\r\n" + "where rent_member_no = '" + MemberNo + "' and rent_stats = 0";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        rent_stats = rs.getInt(1);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return rent_stats;
  }


  // 서비스 이용 중인 킥보드 번호 조회
  public String getUsingServiceKickboardNo(String MemberNo) {
    String rent_kickboard_no = "";
    String query = "select rent_kickboard_no from ta_rent where rent_stats = 0 and rent_member_no = '" + MemberNo + "'";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        rent_kickboard_no = rs.getString(1);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return rent_kickboard_no;
  }


  // 서비스 이용 중인 사람이 내가 아닐때
  public String getUsingServiceWho(String KickboardNo) {
    String rent_member_no = "";
    String query = "select rent_member_no\r\n" + "from ta_rent\r\n" + "where rent_kickboard_no = '" + KickboardNo + "'\r\n" + "and rent_stats = 0";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        rent_member_no = rs.getString(1);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return rent_member_no;
  }

  // 세션 이메일로 회원 번호 찾기
  public String getMemberNo(String sessionEmail) {
    String member_no = "";
    String query = "select member_no\r\n" + "from ta_member\r\n" + "where member_email = '" + sessionEmail + "'";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        member_no = rs.getString(1);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return member_no;
  }

  // 현재 대여중인 킥보드 번호로 렌트 번호 찾기
  public String getRentNo(String rent_kickboard_no) {
    String rent_no = "";
    String query = "select rent_no\r\n" + "from ta_rent\r\n" + "where rent_kickboard_no = '" + rent_kickboard_no + "'\r\n" + "and rent_stats = 0";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        rent_no = rs.getString(1);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return rent_no;
  }



  // 킥보드 이용횟수 증가
  public void addkickboardTotalusedtimeCount(String kickboard_no) {
    String query = " update ta_kickboard set kickboard_totalusedtimes = kickboard_totalusedtimes + 1\r\n" + " where kickboard_no='" + kickboard_no + "' ";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      ps.executeUpdate();
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
  }

  // 킥보드 렌트 상태 변경
  public void changekickboardRentStats(String kickboard_no, int gubun) {
    String query = " update ta_kickboard set kickboard_rentstats = " + gubun + "\r\n" + " where kickboard_no='" + kickboard_no + "' ";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      ps.executeUpdate();
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
  }

  // 번호생성
  public String getRentNo() {
    String maxNo = "";
    String query = " select max(rent_no) from ta_rent ";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        maxNo = rs.getString(1);
      }
      if (maxNo == null) {
        maxNo = "R001";
      } else {
        String n = maxNo.substring(1);
        int i = Integer.parseInt(n);
        i = i + 1;
        DecimalFormat df = new DecimalFormat("000");
        String newNo = df.format((double) i);
        maxNo = "R" + newNo; //
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

  // 멤버 번호로 멤버 검색
  public MemberDto getUser(String member_no) {
    MemberDto dto = null;

    String query = "select *\r\n" + "from ta_member\r\n" + "where member_no = '" + member_no + "' order by member_no asc";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        String no = rs.getString("member_no");
        String name = rs.getString("member_name");
        String email = rs.getString("member_email");
        String phoneNumber = rs.getString("member_phoneNumber");
        String password = "";
        String lastRentDate = rs.getString("member_lastRentDate");
        int money = rs.getInt("member_money");
        int useTimes = rs.getInt("member_useTimes");
        int accept = rs.getInt("member_accept");
        int useCount = rs.getInt("member_useCount");
        String rank = rs.getString("member_rank");
        String regDate = rs.getString("member_regDate");
        dto = new MemberDto(no, name, email, phoneNumber, password, lastRentDate, money, useTimes, rank, regDate, useCount, accept);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return dto;
  }

  // 멤버 번호로 멤버 검색
  public RentDto getRentResult(String rent_no) {
    RentDto dto = null;

    String query = "select rent_useddate, rent_cost\r\n" + "from ta_rent\r\n" + "where rent_no = '" + rent_no + "'";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        int useddate = rs.getInt(1);
        int cost = rs.getInt(2);

        dto = new RentDto(useddate, cost);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }

    return dto;
  }

  // 현재 이용시간 구하기
  public String getUsingTimes(String rent_no) {
    String times = "";

    String query = "select TO_char(rent_startdate, 'YYYYMMDDHH24MISS') FROM TA_rent where rent_no = '" + rent_no + "'";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        times = rs.getString(1);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }

    return times;
  }

}
