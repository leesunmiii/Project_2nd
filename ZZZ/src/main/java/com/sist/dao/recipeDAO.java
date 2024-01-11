package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.*;

public class recipeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPConnection dbconn=
			new CreateDBCPConnection();
	
	private static recipeDAO dao;
	
	
	public List<recipeVO> recipeMainListData()
	   {
		   List<recipeVO> list=
				   new ArrayList<recipeVO>();
		   
		   try
		   {
			   
		
			   conn=dbconn.getConnection();
			   String sql="SELECT no,title,poster,difficulty,timee,rownum "
					    + "FROM recipe "
					    + "WHERE rownum<=10";
			   ps=conn.prepareStatement(sql);
			   ResultSet rs=ps.executeQuery();
			   while(rs.next())
			   {
				  recipeVO vo= new recipeVO();
				  vo.setNo(rs.getInt(1));
				  vo.setTitle(rs.getString(2));
				  vo.setPoster(rs.getString(3));
				  vo.setDifficulty(rs.getString(4));
				  vo.setTimee(rs.getString(5));
				  list.add(vo);
			   }
			   rs.close();
		   }
		   catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally {
			dbconn.disConnection(conn, ps);
		   }
		   
		   return list;
	   }
}