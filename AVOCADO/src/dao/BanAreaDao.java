package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import common.DBOracleConnection;
import dto.BanAreaDto;

public class BanAreaDao {

  DBOracleConnection common = new DBOracleConnection();
  Connection connection = null;
  PreparedStatement ps = null;
  ResultSet rs = null;
  
//목록조회
  public ArrayList<BanAreaDto> getBanAreaLocationValueInDB(String banAreaName){
      ArrayList<BanAreaDto> arr = new ArrayList<BanAreaDto>();
      
      String query =  "select banarea_no, banarea_name, banarea_locationvalue\r\n"
          + "from ta_banarea\r\n"
          + "where banarea_name = '"+banAreaName+"' order by banarea_no asc";
      
      try {
          connection = common.getConnection();
          ps  = connection.prepareStatement(query);
          rs  = ps.executeQuery();    
          while(rs.next()) {
              int no       = rs.getInt(1);
              String name    = rs.getString(2);
              String locationValue  = rs.getString(3);
              BanAreaDto dto = new BanAreaDto(no,name,locationValue);
              arr.add(dto);
          }           
      }catch(SQLException se) {
          System.out.println("getFreeboard() query 오류: "+query);
      }catch(Exception ee) {
          System.out.println("getFreeboard() 오류");
      }finally {
          common.close(connection, ps, rs);
      }       
      
      return arr;
  }
  
  //디비에서 값 가져와서 스트링 변수에 한번에 담아주기 
  public String getBanAreaLocationValue(String banAreaName) {
    ArrayList<BanAreaDto> banAreaArray = getBanAreaLocationValueInDB(banAreaName);
    banAreaName = ""; //초기화 (넘겨받은 이름값 가지고 있음)
    for (int i = 0; i < banAreaArray.size()-1; i++) {
      banAreaName += banAreaArray.get(i).getBanarea_loacationValue() + ",\n";
    }
    for (int i = banAreaArray.size()-1; i < banAreaArray.size(); i++) {
      banAreaName += banAreaArray.get(i).getBanarea_loacationValue();
    }
    return banAreaName;
  }
  
  // 번호생성
  public int getBanAreaNo() {
      int maxNo = 0;
      String query=" select max(BanArea_no) from TA_BanArea";
      try {
          connection = common.getConnection();
          ps  = connection.prepareStatement(query);
          rs  = ps.executeQuery();
          if(rs.next()) {
              maxNo = rs.getInt(1);
          }
          if(maxNo == 0) {
              maxNo = 1;
          } else {
            maxNo += 1;
          }
      }catch(SQLException se) {
          System.out.println("getFreeboardNo() query 오류: "+query);
      }catch(Exception ee) {
          System.out.println("getFreeboardNo() 오류");
      }finally {
          common.close(connection, ps, rs);
      }       
      return maxNo;
  }
  
  // 등록
  public int saveBanArea(BanAreaDto dto) {
      int result =0;
      String query ="insert into ta_banarea \r\n" + 
              "(banarea_no,banarea_name,banarea_locationvalue) \r\n" + 
              "values \r\n" + 
              "('"+dto.getBanarea_no()+"','"+dto.getBanarea_name()+"','"+dto.getBanarea_loacationValue()+"')";
      try {
          connection = common.getConnection();
          ps  = connection.prepareStatement(query);
          result  = ps.executeUpdate();           
      }catch(SQLException se) {
          System.out.println("saveFreeboard() query 오류: "+query);
      }catch(Exception ee) {
          System.out.println("saveFreeboard() 오류");
      }finally {
          common.close(connection, ps, rs);
      }       
      return result;
  }
}
