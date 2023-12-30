package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.GoodsVO;
import com.sist.vo.RecipeVO;

public class RecipeDAO {
	private Connection conn;
	   private PreparedStatement ps;
	   private CreateDBCPConnection dbconn=
	         new CreateDBCPConnection();
	   private static GoodsDAO dao;
	   
	   //싱글턴
	   public static GoodsDAO newInstance()
	   {
	      if(dao==null)
	         dao=new GoodsDAO();
	      return dao;
	   }
	public List<RecipeVO> recipeHomeData(int start, int end)
	{
		List<RecipeVO> list=new ArrayList<RecipeVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT no,title,poster,writer,timee "
					+"FROM recipe "
					+"WHERE no BETWEEN "+start+" AND "+end;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				RecipeVO vo=new RecipeVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setWriter(rs.getString(4));
				vo.setTimee(rs.getString(5));
				list.add(vo);
			}
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
