package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import common.DBOracleConnection;
import common.commonJDBC;
import dto.BanAreaDto;
import dto.KickboardDto;

public class KickboardDao {


  DBOracleConnection common = new DBOracleConnection();
  Connection connection = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  commonJDBC jdbc = new commonJDBC();

  // 번호생성
  public String getKickboardNo() {
    String maxNo = "";
    String query = " select max(kickboard_no) from TA_KICKBOARD ";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        maxNo = rs.getString(1);
      }
      if (maxNo == null) {
        maxNo = "AVOCADO0001";
      } else {
        String n = maxNo.substring(7);
        int i = Integer.parseInt(n);
        i = i + 1;
        DecimalFormat df = new DecimalFormat("0000");
        String newNo = df.format((double) i);
        maxNo = "AVOCADO" + newNo; //
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

  // 등록
  public int saveKickboard(KickboardDto dto) {
    int result = 0;
    String query = "insert into TA_KICKBOARD \r\n" + "(kickboard_no, kickboard_name, kickboard_type,kickboard_rentstats, kickboard_location, kickboard_regdate, kickboard_totalusedtimes,kickboard_img,kickboard_battery) \r\n" + "values \r\n" + "('" + dto.getKickboard_no() + "','"
        + dto.getKickboard_name() + "','" + dto.getKickboard_type() + "'," + dto.getKickboard_rentstats() + ",'" + dto.getKickboard_location() + "',TO_DATE('" + dto.getKickboard_regdate() + "','YYYY-MM-DD HH24:MI:SS')," + dto.getKickboard_totalusedtimes() + ",'" + dto.getKickboard_img() + "',"
        + dto.getKickboard_battery() + ")";
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

  // 목록조회
  public ArrayList<KickboardDto> getKickboardValue() {
    ArrayList<KickboardDto> arr = new ArrayList<KickboardDto>();

    String query = "select kickboard_no, kickboard_name, kickboard_type, kickboard_rentstats, kickboard_location, kickboard_battery\r\n" + "from ta_kickboard order by kickboard_no asc";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        String no = rs.getString(1);
        String name = rs.getString(2);
        String type = rs.getString(3);
        int rentstats = rs.getInt(4);
        String location = rs.getString(5);
        int battery = rs.getInt(6);
        KickboardDto dto = new KickboardDto(no, name, type, location, rentstats, battery);
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

  // 현재 킥보드 대여 가능 한 킥보드 번호 조회
  public ArrayList<KickboardDto> getKickboardRentStatsOK() {
    ArrayList<KickboardDto> kickboard_no_arr = new ArrayList<KickboardDto>();
    String query = "select kickboard_no\r\n" + "from ta_kickboard\r\n" + "where kickboard_rentstats = 0 order by kickboard_no asc";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        String kickboard_no = rs.getString(1);
        KickboardDto dto = new KickboardDto(kickboard_no);
        kickboard_no_arr.add(dto);
      }
    } catch (SQLException se) {
      jdbc.printSQLExceptionError(query);
    } catch (Exception ee) {
      jdbc.printExceptionError();
    } finally {
      common.close(connection, ps, rs);
    }
    return kickboard_no_arr;
  }
}
