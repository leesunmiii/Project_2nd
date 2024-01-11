package com.sist.dao;

import java.util.*;
import java.sql.*;

import com.sist.vo.*;

import oracle.jdbc.OracleTypes;

public class ReplyDAO {
	private Connection conn;
	private CallableStatement cs; // 프로시저를 호출하는 함수, SQL를 호출하는 함수는 PreparedStatement
	private final String URL="jdbc:oracle:thin:@211.238.142.111:1521:XE";
	private static ReplyDAO dao; // 싱글턴
	
	// 드라이버 등록 => 한 번만 수행
	public ReplyDAO(){
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	
	// 연결 == ssf.opensession()
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL, "hr", "happy");
		}catch(Exception ex) {}
	}
	
	// 해제
	public void disConnection()
	{
		try
		{
			if(cs!=null)
				cs.close();
			if(conn!=null)
				conn.close();
		}catch(Exception ex) {}
	}
	
	// 싱글턴
	public static ReplyDAO newInstance()
	{
		if(dao==null)
			dao=new ReplyDAO();
		return dao;
	}
	// 댓글 목록
	/*
	 * CREATE OR REPLACE PROCEDURE replyListData(
		    pNo NUMBER,   ================> cno
		    pType NUMBER,
		    pResult OUT SYS_REFCURSOR
		)
	 */
	/*
	 * no => 댓글 고유번호
	 * type => 구분자(명소:1, 자연:2, 쇼핑:3, 맛집:4)
	 * cno => 각 고유번호(리스트)
	 * 
	 * <select id="replyListData" resultType="ReplyVO" parameterMap="map" statement="CALLABLE">
	 *     {CALL replyListData(?, ?, ?)}
	 * </select>
	 * 
	 * SQLInjection
	 */
	public List<ReplyVO> store_replyListData(int type, int cno)
	{
		List<ReplyVO> list=new ArrayList<ReplyVO>();
		try
		{
			getConnection();
			String sql="{CALL store_replyListData(?, ?, ?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, cno);
			cs.setInt(2, type);
			// 문자, 숫자, 커서 ==> OUT 변수일 경우에만 사용
			// OracleTypes.VARCHAR => String
			// OracleTypes.INTEGER => int
			// OracleTypes.CURSOR => Resultset
			cs.registerOutParameter(3, OracleTypes.CURSOR); // OUT변수면 레지스터에 등록해서 읽어야 함
			
			// 실행
			cs.executeQuery(); // SELECT건 INSERT건 무조건 executeQuery()
			
			// 레지스터에 저장된 값 읽기
			// 커서인 경우 ResultSet으로 받음. 문자일 경우 그냥 String으로 받으면 됨
			ResultSet rs=(ResultSet)cs.getObject(3);
			// no, type, cno, id, name, msg, regdate
			while(rs.next())
			{
				ReplyVO vo=new ReplyVO();
				vo.setNo(rs.getInt(1));
				vo.setType(rs.getInt(2));
				vo.setCno(rs.getInt(3));
				vo.setId(rs.getString(4));
				vo.setName(rs.getString(5));
				vo.setMsg(rs.getString(6));
				vo.setDbday(rs.getString(7));
				
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return list;
	}
	/*
	 * CREATE OR REPLACE PROCEDURE replyInsert(
		    pType reply_all.type%TYPE,
		    pCno reply_all.cno%TYPE,
		    pId reply_all.id%TYPE,
		    pName reply_all.name%TYPE,
		    pMsg reply_all.msg%TYPE
		)
	 */
	public void store_replyInsert(ReplyVO vo)
	{
		try
		{
			getConnection();
			String sql="{CALL store_replyInsert(?, ?, ?, ?, ?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, vo.getType());
			cs.setInt(2, vo.getCno());
			cs.setString(3, vo.getId());
			cs.setString(4, vo.getName());
			cs.setString(5, vo.getMsg());
			
			cs.executeQuery();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
	/*
	 * CREATE OR REPLACE PROCEDURE store_replyDelete(
		   pNo store_reply_all.no%TYPE
		)
	 */
	public void store_replyDelete(int no)
	{
		try
		{
			getConnection();
			String sql="{CALL store_replyDelete(?)}";
			cs=conn.prepareCall(sql);
			cs.setInt(1, no);
			
			cs.executeQuery();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
	}
}
