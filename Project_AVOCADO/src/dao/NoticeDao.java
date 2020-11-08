package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBOracleConnection;
import dto.NoticeDto;

public class NoticeDao {

	DBOracleConnection common= new DBOracleConnection();
	Connection connection = null;
	PreparedStatement ps  = null;
	ResultSet         rs  = null;
	
	public ArrayList<NoticeDto> getNoticeList(String select,String search){
		ArrayList<NoticeDto> arr = new ArrayList<NoticeDto>();
		String query =" select no, title, attach, content, reg_name, to_char(reg_date,'yyyy-MM-dd'), hit\r\n" + 
					  " from avocado_notice\r\n" + 
					  " order by no desc";
		try {
			connection = common.getConnection();
			ps  = connection.prepareStatement(query);
			rs  = ps.executeQuery();	
			while(rs.next()) {
				String no 		= rs.getString(1);
				String title 	= rs.getString(2);
				String attach 	= rs.getString(3);
				String content 	= rs.getString(4);
				String reg_name = rs.getString(5);
				String reg_date = rs.getString(6);
				int hit 		= rs.getInt(7);
				NoticeDto dto = new NoticeDto(no,title,content,attach,reg_name,reg_date,hit);
				arr.add(dto);
			}			
		}catch(SQLException se) {
			System.out.println("getNoticeList() query 오류: "+query);
		}catch(Exception ee) {
			System.out.println("getNoticeList() 오류");
		}finally {
			common.close(connection, ps, rs);
		}		
		
		return arr;
	}
}
