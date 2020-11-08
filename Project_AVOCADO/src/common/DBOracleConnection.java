package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBOracleConnection {

  /**
   * DB 연결
   * 
   */
  public Connection getConnection() {
    loadJDBCDriver();

    try {
      String DB_URL = "jdbc:oracle:thin:@220.123.54.12:1521:orcl";
      String DB_USER = "scott";
      String DB_PASSWORD = "tiger";

      printConnertionCheck(DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD));
      return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

    } catch (SQLException ex) {
      printSQLExceptionErrorMsg(ex);
    }

    return null;
  }



  /**
   * JDBC 드라이버 로드
   */
  private void loadJDBCDriver() {
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
    } catch (Exception ex) {
      printDriverErrorMsg(ex);
    }
  }

  /**
   * loadJDBCDriver의 예외사항
   * 
   * @param ex 오류인 경우
   */
  private void printDriverErrorMsg(Exception ex) {
    System.out.println("드라이버 없음 ojdbc6.jar : " + ex.getMessage());
  }

  /**
   * printConnertionCheck의 예외사항
   * 
   * @param ex SQL예외오류인 경우
   */
  private void printSQLExceptionErrorMsg(SQLException ex) {
    System.out.println("SQLException: " + ex.getMessage());
    System.out.println("SQLState: " + ex.getSQLState());
  }

  /**
   * DB연결 체크
   * 
   * @param con DB연결 정보를 담고 있음
   */
  private void printConnertionCheck(Connection con) {
    if (con == null) {
      System.out.println(" oracle db 연결실패===========");
      return;
    }
    System.out.println(" oracle db 연결성공~~~");
  }



  public void close(Connection con, PreparedStatement ps) {
    try {
      if (ps != null)
        ps.close();
      if (con != null)
        con.close();
    } catch (Exception e) {
      System.out.println("=========== 종료 error ===========");
    }
  }



  public void close(Connection con, PreparedStatement ps, ResultSet result) {
    try {
      if (result != null)
        result.close();
      if (ps != null)
        ps.close();
      if (con != null)
        con.close();
    } catch (Exception e) {
      System.out.println("=========== 종료 error ===========");
    }
  }
}
