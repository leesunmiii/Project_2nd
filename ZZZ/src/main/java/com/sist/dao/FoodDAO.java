package com.sist.dao;
import java.sql.*;
import com.sist.vo.*;
import java.util.*;
import com.sist.dbcp.*;
public class FoodDAO {
   private Connection conn;
   private PreparedStatement ps;
   private CreateDBCPConnection dbconn=new CreateDBCPConnection();
   private static FoodDAO dao;
   public static FoodDAO newInstance()
   {
      if(dao==null)
         dao=new FoodDAO();
      return dao;
   }
   
// 목록
   public List<FoodVO> foodListData(String ss)
   {
      List<FoodVO> foodlist=new ArrayList<FoodVO>();
      try
      {
         conn=dbconn.getConnection();
         String sql="SELECT fno,poster,name,address,num "
                 +"FROM (SELECT fno,poster,name,address,rownum as num "
                 +"FROM (SELECT fno,poster,name,address "
                 +"FROM food_menu_house "
                 +"WHERE address LIKE '%'||?||'%' "
                 +"ORDER BY fno ASC)) "
                 +"WHERE num BETWEEN 1 AND 5";
            
         // 컬럼명 / 테이블명은 ?로 처리할수 없다
         // ps.setString(1,fd) => address => 'address'
         // MyBatis => ${} #{}
         ps=conn.prepareStatement(sql);
         
         
         ps.setString(1, ss);
         // fd => , ss
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
            FoodVO vo=new FoodVO();
            vo.setFno(rs.getInt(1));
            vo.setName(rs.getString(3));
            vo.setPoster("https://www.menupan.com"+rs.getString(2));
            vo.setAddress(rs.getString(4));
            
            foodlist.add(vo);
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
      return foodlist;
   }
   
   
   // 총페이지
   public int foodTotalPage(String fd,String ss)
   {
      int total=0;
      try
      {
         conn=dbconn.getConnection();
         String sql="SELECT CEIL(COUNT(*)/12.0) "
                 +"FROM food_menu_house "
                 +"WHERE "+fd+" LIKE '%'||?||'%' ";
         ps=conn.prepareStatement(sql);
         ps.setString(1, ss);
         ResultSet rs=ps.executeQuery();
         rs.next();
         total=rs.getInt(1);
         rs.close();
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }
      finally
      {
         dbconn.disConnection(conn, ps);
      }
      return total;
   }
   /*
    *  => 1. 데이터베이스 => 어떤 값(요청값)
    *     2. 화면의 어떤 데이터가 필요한지 ...
    *     
    *  => ajax / MVC
    *  
    *  자바
    *   1. 코딩 => 반복 => 메소드 (여러개) => 클래스
    *      재사용 (목적0
    *   2. 메소드
    *      ==== 1. 요청값 / 2. 결과값
    *  오라클 
    *   1. SQL문장 => JOIN / SubQuery
    *   
    *  JSP => 연결 
    *  ====================================
    *  | 체계적 : 스프링 
    */
   // 상세보기 
   public FoodVO foodDetailData(int firstFood)
   {
      // ss/fd => 화면 이동 변수
      FoodVO vo=new FoodVO();
      try
      {
         conn=dbconn.getConnection();
         String sql="SELECT fno,poster,name,type,address,phone,"
                 +"score,theme,price,time,seat,content "
                 +"FROM food_menu_house "
                 +"WHERE fno="+firstFood;
         ps=conn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         rs.next();
         vo.setFno(rs.getInt(1));
         vo.setPoster("https://www.menupan.com"+rs.getString(2));
         vo.setName(rs.getString(3));
         vo.setType(rs.getString(4));
         vo.setAddress(rs.getString(5));
         vo.setPhone(rs.getString(6));
         vo.setScore(rs.getDouble(7));
         vo.setTheme(rs.getString(8));
         vo.setPrice(rs.getString(9));
         vo.setTime(rs.getString(10));
         vo.setSeat(rs.getString(11));
         vo.setContent(rs.getString(12));
         rs.close();
      }catch(Exception ex)
      {
         ex.printStackTrace();
      }
      finally
      {
         dbconn.disConnection(conn, ps);
      }
      return vo;
   }
   
   public FoodVO foodfindDetailData(int fno)
	{
		FoodVO vo=new FoodVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT poster,name,score,phone,address,type,"
					+"theme,price,seat,time,content "
					+"FROM food_menu_house "
					+"WHERE fno="+fno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			
			vo.setPoster("https://www.menupan.com"+rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setScore(rs.getDouble(3));
			vo.setPhone(rs.getString(4));
			vo.setAddress(rs.getString(5));
			vo.setType(rs.getString(6));
			vo.setTheme(rs.getString(7));
			vo.setPrice(rs.getString(8));
			vo.setSeat(rs.getString(9));
			vo.setTime(rs.getString(10));
			vo.setContent(rs.getString(11));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		
		return vo;
	}
   
   
   
   
   
   
}



















