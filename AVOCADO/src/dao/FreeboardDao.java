package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import common.DBOracleConnection;
import dto.FreeboardDto;

public class FreeboardDao {
	
	 DBOracleConnection common = new DBOracleConnection();
	  Connection connection = null;
	  PreparedStatement ps = null;
	  ResultSet rs = null;	  

		// 공감하기 db 저장
		public int saveLikeStack(String post_no, String email, String no) {
			int result =0;
			String query=" insert into ta_freeboardlike\r\n " + 
						 "    (like_postnumber, like_gubun, like_memberemail, like_no)\r\n " + 
						 "    values\r\n" + 
						 "    ('"+post_no+"',1,'"+email+"','"+no+"') ";
			try {
				connection = common.getConnection();
				ps  = connection.prepareStatement(query);
				result = ps.executeUpdate();		
			}catch(SQLException se) {
				System.out.println("saveLikeStack() query 오류: "+query);
			}catch(Exception ee) {
				System.out.println("saveLikeStack() 오류");
			}finally {
				common.close(connection, ps, rs);
			}	
			return result;
		}	  
	  
		// 삭제
		public int deleteFreeboard(String no) {
			int result =0;
			String query=" delete from TA_FreeBoard " + 
						 " where freeboard_no='"+no+"' ";
			try {
				connection = common.getConnection();
				ps  = connection.prepareStatement(query);
				result = ps.executeUpdate();		
			}catch(SQLException se) {
				System.out.println("deleteFreeboard() query 오류: "+query);
			}catch(Exception ee) {
				System.out.println("deleteFreeboard() 오류");
			}finally {
				common.close(connection, ps, rs);
			}	
			return result;
		}	
	  
		// 수정
		public int updateFreeboard(FreeboardDto dto) {
			int result =0;
			String query ="update TA_FreeBoard \r\n" + 
					"set freeboard_title='"+dto.getFreeboard_title()+"', \r\n" + 
					"    freeboard_content='"+dto.getFreeboard_content()+"', \r\n" + 
					"    freeboard_attach='"+dto.getFreeboard_attach()+"' \r\n" + 
					"where freeboard_no ='"+dto.getFreeboard_no()+"'";
			try {
				connection = common.getConnection();
				ps  = connection.prepareStatement(query);
				result  = ps.executeUpdate();			
			}catch(SQLException se) {
				System.out.println("updateFreeboard() query 오류: "+query);
			}catch(Exception ee) {
				System.out.println("updateFreeboard() 오류");
			}finally {
				common.close(connection, ps, rs);
			}		
			return result;
		}
	  
		// 등록
		public int saveFreeboard(FreeboardDto dto) {
			int result =0;
			String query ="insert into TA_FreeBoard \r\n" + 
					"(freeboard_no,freeboard_title,freeboard_content,freeboard_regname,freeboard_regdate,freeboard_attach) \r\n" + 
					"values \r\n" + 
					"('"+dto.getFreeboard_no()+"','"+dto.getFreeboard_title()+"','"+dto.getFreeboard_content()+"','"+dto.getFreeboard_regName()+"',TO_DATE('"+dto.getFreeboard_regDate()+"','YYYY-MM-DD HH24:MI:SS'),'"+dto.getFreeboard_attach()+"')";
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
	  
	//상세조회
		public FreeboardDto getFreeboardView(String no){
			FreeboardDto dto = null; 
			String query =	" select b.freeboard_no, b.freeboard_title, b.freeboard_content, a.member_name, to_char(b.freeboard_regdate,'yyyy-MM-dd HH24:MI'), b.freeboard_hit, b.freeboard_attach, b.freeboard_regname, c.freeboard_likestack\r\n" + 
							" from   TA_FreeBoard b, \r\n" + 
							"        ta_member a, \r\n" + 
							"        (select like_postnumber, count(*) as freeboard_likestack   \r\n" + 
							"        from ta_freeboardlike \r\n" + 
							"        where like_gubun = 1 group by like_postnumber) c\r\n" + 
							" where a.member_email = b.freeboard_regname \r\n" + 
							"        and b.freeboard_no = c.like_postnumber(+)\r\n" + 
							"        and b.freeboard_no ='"+no+"'";
			try {
				connection = common.getConnection();
				ps  = connection.prepareStatement(query);
				rs  = ps.executeQuery();
				if(rs.next()) {
					String nn 		= rs.getString(1);
					String title 	= rs.getString(2);
					String content 	= rs.getString(3);
					String regName = rs.getString(4);
					String regDate = rs.getString(5);
					int hit 		= rs.getInt(6);
					String attach  = rs.getString(7);
					String regEmail = rs.getString(8);
					int like		= rs.getInt(9);
					dto = new FreeboardDto(nn, title, content, attach, regName,regDate, hit, regEmail, like);
				}
			}catch(SQLException se) {
				System.out.println("getFreeboardView() query 오류: "+query);
			}catch(Exception ee) {
				System.out.println("getFreeboardView() 오류");
			}finally {
				common.close(connection, ps, rs);
			}				
			return dto;
		}
	  
	// 조회수 증가
		public void setHitCount(String no) {
			String query=" update TA_FreeBoard set freeboard_hit = freeboard_hit + 1\r\n" + 
						 " where freeboard_no='"+no+"' ";
			try {
				connection = common.getConnection();
				ps  = connection.prepareStatement(query);
				ps.executeUpdate();		
			}catch(SQLException se) {
				System.out.println("setHitCount() query 오류: "+query);
			}catch(Exception ee) {
				System.out.println("setHitCount() 오류");
			}finally {
				common.close(connection, ps, rs);
			}				
		}

	//목록조회
		public ArrayList<FreeboardDto> getFreeboard(String select,String search){
			ArrayList<FreeboardDto> arr = new ArrayList<FreeboardDto>();
			
			String searchGubun = "b";
			if(select.equals("member_name")) searchGubun = "a";
			String query =  " select b.freeboard_no, b.freeboard_title, a.member_name, to_char(b.freeboard_regdate,'yyyy-MM-dd'), b.freeboard_attach, b.freeboard_hit, c.freeboard_likestack\r\n " + 
							" from TA_FreeBoard b, \r\n " + 
							"        ta_member a, \r\n " + 
							"        (select like_postnumber, count(*) as freeboard_likestack   \r\n" + 
							"        from ta_freeboardlike \r\n " + 
							"        where like_gubun = 1 group by like_postnumber) c\r\n " + 
							" where a.member_email = b.freeboard_regname \r\n " + 
							"        and b.freeboard_no = c.like_postnumber(+) \r\n " + 
							"        and "+searchGubun+"."+select+" like '%"+search+"%'  \r\n" + 
							"        order by freeboard_no desc ";
			
			try {
				connection = common.getConnection();
				ps  = connection.prepareStatement(query);
				rs  = ps.executeQuery();	
				while(rs.next()) {
					String no 		= rs.getString(1);
					String title 	= rs.getString(2);
					String regName  = rs.getString(3);
					String regDate  = rs.getString(4);
					String attach  = rs.getString(5);
					int hit 		= rs.getInt(6);
					int like		= rs.getInt(7);
					FreeboardDto dto = new FreeboardDto(no, title, "", regName, regDate, attach, hit, like);
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
		
		// 번호생성(ta_freeboardlike 테이블 기본키 번호자동생성
		public String getLikeStackNo() {
			String maxNo="";
			String query=" select max(Like_no) from TA_FreeBoardLike ";
			try {
				connection = common.getConnection();
				ps  = connection.prepareStatement(query);
				rs  = ps.executeQuery();
				if(rs.next()) {
					maxNo = rs.getString(1);
				}
				if(maxNo == null) {
					maxNo ="FL001";
				} else {
					String n = maxNo.substring(2);
					System.out.println(n);
					int i = Integer.parseInt(n); 
					i = i + 1;
					DecimalFormat df = new DecimalFormat("000");
					String newNo = df.format((double)i);
					maxNo = "FL"+newNo; // 
				}
			}catch(SQLException se) {
				System.out.println("getLikeStackNo() query 오류: "+query);
			}catch(Exception ee) {
				System.out.println("getLikeStackNo() 오류");
			}finally {
				common.close(connection, ps, rs);
			}		
			return maxNo;
		}
	  
		// 번호생성
		public String getFreeboardNo() {
			String maxNo="";
			String query=" select max(freeboard_no) from TA_FreeBoard ";
			try {
				connection = common.getConnection();
				ps  = connection.prepareStatement(query);
				rs  = ps.executeQuery();
				if(rs.next()) {
					maxNo = rs.getString(1);
				}
				if(maxNo == null) {
					maxNo ="F001";
				} else {
					String n = maxNo.substring(1); 
					int i = Integer.parseInt(n); 
					i = i + 1;
					DecimalFormat df = new DecimalFormat("000");
					String newNo = df.format((double)i);
					maxNo = "F"+newNo; // 
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
}
