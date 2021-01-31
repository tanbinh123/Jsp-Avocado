package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import common.DBOracleConnection;
import common.commonJDBC;
import dto.QnaDto;

public class QnaDao {

  DBOracleConnection common = new DBOracleConnection();
  Connection connection = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  commonJDBC jdbc = new commonJDBC();

  // 공감하기 db 저장
  public int saveLikeStack(String post_no, String email, String no) {
    int result = 0;
    String query = " insert into ta_qnalike\r\n " + "    (like_postnumber, like_gubun, like_memberemail, like_no)\r\n " + "    values\r\n" + "    ('" + post_no + "',1,'" + email + "','" + no + "') ";
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

  // 삭제
  public int deleteQna(String no) {
    int result = 0;
    String query = " delete from TA_qna " + " where qna_no='" + no + "' ";
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

  // 수정
  public int updateQna(QnaDto dto) {
    int result = 0;
    String query = "update TA_qna \r\n" + "set qna_title='" + dto.getqna_title() + "', \r\n" + "    qna_content='" + dto.getqna_content() + "', \r\n" + "    qna_attach='" + dto.getqna_attach() + "' \r\n" + "where qna_no ='" + dto.getqna_no() + "'";
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

  // 등록
  public int saveQna(QnaDto dto) {
    int result = 0;
    String query = "insert into TA_qna \r\n" + "(qna_no,qna_title,qna_content,qna_regname,qna_regdate,qna_attach) \r\n" + "values \r\n" + "('" + dto.getqna_no() + "','" + dto.getqna_title() + "','" + dto.getqna_content() + "','" + dto.getqna_regName() + "',TO_DATE('" + dto.getqna_regDate()
        + "','YYYY-MM-DD HH24:MI:SS'),'" + dto.getqna_attach() + "')";
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

  // 상세조회
  public QnaDto getQnaView(String no) {
    QnaDto dto = null;
    String query = " select b.qna_no, b.qna_title, b.qna_content, a.member_name, to_char(b.qna_regdate,'yyyy-MM-dd HH24:MI'), b.qna_hit, b.qna_attach, b.qna_regname, c.qna_likestack\r\n" + " from   TA_qna b, \r\n" + "        ta_member a, \r\n"
        + "        (select like_postnumber, count(*) as qna_likestack   \r\n" + "        from ta_qnalike \r\n" + "        where like_gubun = 1 group by like_postnumber) c\r\n" + " where a.member_email = b.qna_regname \r\n" + "        and b.qna_no = c.like_postnumber(+)\r\n"
        + "        and b.qna_no ='" + no + "'";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        String nn = rs.getString(1);
        String title = rs.getString(2);
        String content = rs.getString(3);
        String regName = rs.getString(4);
        String regDate = rs.getString(5);
        int hit = rs.getInt(6);
        String attach = rs.getString(7);
        String regEmail = rs.getString(8);
        int like = rs.getInt(9);
        dto = new QnaDto(nn, title, content, attach, regName, regDate, hit, regEmail, like);
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

  // 조회수 증가
  public void setHitCount(String no) {
    String query = " update TA_qna set qna_hit = qna_hit + 1\r\n" + " where qna_no='" + no + "' ";
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

  // 목록조회
  public ArrayList<QnaDto> getQna(String select, String search) {
    ArrayList<QnaDto> arr = new ArrayList<QnaDto>();

    String searchGubun = "b";
    if (select.equals("member_name"))
      searchGubun = "a";
    String query =
        " select b.qna_no, b.qna_title, a.member_name, to_char(b.qna_regdate,'yyyy-MM-dd'), b.qna_attach, b.qna_hit, c.qna_likestack\r\n " + " from TA_qna b, \r\n " + "        ta_member a, \r\n " + "        (select like_postnumber, count(*) as qna_likestack   \r\n" + "        from ta_qnalike \r\n "
            + "        where like_gubun = 1 group by like_postnumber) c\r\n " + " where a.member_email = b.qna_regname \r\n " + "        and b.qna_no = c.like_postnumber(+) \r\n " + "        and " + searchGubun + "." + select + " like '%" + search + "%'  \r\n" + "        order by qna_no desc ";

    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {
        String no = rs.getString(1);
        String title = rs.getString(2);
        String regName = rs.getString(3);
        String regDate = rs.getString(4);
        String attach = rs.getString(5);
        int hit = rs.getInt(6);
        int like = rs.getInt(7);
        QnaDto dto = new QnaDto(no, title, "", regName, regDate, attach, hit, like);
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

  // 번호생성(ta_qnalike 테이블 기본키 번호자동생성
  public String getLikeStackNo() {
    String maxNo = "";
    String query = " select max(Like_no) from TA_qnaLike ";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        maxNo = rs.getString(1);
      }
      if (maxNo == null) {
        maxNo = "QL001";
      } else {
        String n = maxNo.substring(2);
        System.out.println(n);
        int i = Integer.parseInt(n);
        i = i + 1;
        DecimalFormat df = new DecimalFormat("000");
        String newNo = df.format((double) i);
        maxNo = "QL" + newNo; //
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

  // 번호생성
  public String getQnaNo() {
    String maxNo = "";
    String query = " select max(qna_no) from TA_qna ";
    try {
      connection = common.getConnection();
      ps = connection.prepareStatement(query);
      rs = ps.executeQuery();
      if (rs.next()) {
        maxNo = rs.getString(1);
      }
      if (maxNo == null) {
        maxNo = "Q001";
      } else {
        String n = maxNo.substring(1);
        int i = Integer.parseInt(n);
        i = i + 1;
        DecimalFormat df = new DecimalFormat("000");
        String newNo = df.format((double) i);
        maxNo = "Q" + newNo; //
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
}
