package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.*;


public class Reserve1DAO {
	
	private static Connection conn;
	private static PreparedStatement ps; 
	private static Reserve1DAO dao;
	private static CreateDBCPConnection dbconn=new CreateDBCPConnection();			
																				
	
	// 싱글턴
	public static Reserve1DAO newInstance()
	{
		if(dao==null)
			dao=new Reserve1DAO();
		return dao;
	}
	//==================== 여기까지 필수사항 (dao 나올 때마다 꼭 해야하는 것) ===========================
	
	public static void reserveInsert(ReserveVO vo)
	{
		try
		{
			conn=dbconn.getConnection();
			/*
			 * 	 INSERT INTO cart VALUES(
			     (SELECT NVL(MAX(cart_no)+1,1) FROM cart),
			     #{goods_no},#{type},#{amount},#{price},#{id},
			     0,0,SYSDATE
			 */
			
			String sql="INSERT INTO reserve VALUES("
					+ "(SELECT NVL(MAX(rsvno)+1,1) FROM reserve),"
					+ " ?,?,?,?,?,?,?,?,0,SYSDATE)";
			ps=conn.prepareStatement(sql);

			ps.setString(1, vo.getId());
			ps.setInt(2, vo.getCampingno());
			ps.setString(3, vo.getCheckin());
			ps.setString(4, vo.getCheckout());
			ps.setString(5, vo.getTimein());
			ps.setString(6, vo.getTimeout());
			ps.setString(7, vo.getInwon());
			ps.setString(8, vo.getPrice());
			ps.executeUpdate();
		
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
	}
	
	public List<ReserveVO> mypagecampingreserveok(String id)
	{
		List<ReserveVO> list=new ArrayList<ReserveVO>();
		try
		{
			conn=dbconn.getConnection();
			
			String sql="SELECT rsvno,id,campingno,checkin,checkout,timein,timeout,inwon,price,ischeck,regdate,"
					+ "(SELECT poster FROM gocamping1 WHERE mno=reserve.campingno) as poster,"
					+ "(SELECT title FROM gocamping1 WHERE mno=reserve.campingno) as title, "
					+ "(SELECT loc FROM gocamping1 WHERE mno=reserve.campingno) as loc "
					+ "FROM reserve "
					+ "WHERE id=?"
					+ " ORDER BY rsvno DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ReserveVO vo=new ReserveVO();
				vo.setRsvno(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setCampingno(rs.getInt(3));
				vo.setCheckin(rs.getString(4));
				vo.setCheckout(rs.getString(5));
				vo.setTimein(rs.getString(6));
				vo.setTimeout(rs.getString(7));
				vo.setInwon(rs.getString(8));
				vo.setPrice(rs.getString(9));
				vo.setIscheck(rs.getInt(10));
				vo.setRegdate(rs.getDate(11));
				vo.getGvo().setPoster(rs.getString("poster"));
	            vo.getGvo().setTitle(rs.getString("title"));
	            vo.getGvo().setLoc(rs.getString("loc"));
	            list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
}
