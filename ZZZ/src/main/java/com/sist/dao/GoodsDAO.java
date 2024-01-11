package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.*;
import com.sist.dbcp.*;
/*
 *  Web Site
 *  1) 메뉴 => 화면 이동 확인
 *  2) 데이터베이스 연동
 *  3) 화면 출력 완료
 *  ======================
 *      Front => Ajax / Vue / React
 *  4) 사용자 입력 유도 ===> 사용자 요구사항 분석
 *     예)
 *        예약 =========> 예약번호 /  ID / 맛집 번호 / 예약일
 *                    ======  =====
 *                         예약시간 / 인원 / 예약여부 / 등록일
 *                                 ======   =====
 *  5) 결과를 출력      
 *  
 *  ==> 입문
 *     => 1. 데이터베이스 연결 (DBCP/MyBatis)
 *     => 2. 목록 = 상세보기
 *           => 페이징
 *     => 3. CRUD (게시판)             
 */
import com.sist.vo.*;
public class GoodsDAO {
   private Connection conn;
   private PreparedStatement ps;
   private CreateDBCPConnection dbconn=
         new CreateDBCPConnection();
   private static GoodsDAO dao;
   private final int rowSize=9;
   
   private String[] tables={"",
			  "goods1",
			  "goods2",
			  "goods3",
			  "goods4"};
   
   private static SqlSessionFactory ssf=CommonsDataBase.getSsf();
   
   //싱글턴
   public static GoodsDAO newInstance()
   {
      if(dao==null)
         dao=new GoodsDAO();
      return dao;
   }
   
   
 //메인 상품 목록2
   public List<GoodsVO> goodsMainListData(int type)
   {
	   List<GoodsVO> list=
			   new ArrayList<GoodsVO>();
	   
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT cno,gno,poster,title,original_price,brand,rownum "
				    + "FROM "+tables[type] 
				    + " WHERE rownum<=8";
		   ps=conn.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			  GoodsVO vo= new GoodsVO();
			  vo.setCno(rs.getInt(1));
			  vo.setGno(rs.getInt(2));
			  vo.setPoster(rs.getString(3));
			  vo.setTitle(rs.getString(4));
			  vo.setOriginal_price(rs.getInt(5));
			  vo.setBrand(rs.getString(6));
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
 //전체상품 목록
   public List<GoodsVO> goodsAllListData()
   {
      List<GoodsVO> list=
            new ArrayList<GoodsVO>();
      try
      {
         conn=dbconn.getConnection();
         String sql="SELECT gno, title, poster, selling_price,original_price,mileage,brand,delivery_price,after_service,num "
                  +"FROM(SELECT gno, title, poster, selling_price,original_price,mileage,brand,delivery_price,after_service,rownum AS num "
                  +"FROM(SELECT gno, title, poster, selling_price,original_price,mileage,brand,delivery_price,after_service "
                  +"FROM goods1 ORDER BY gno ASC))";
                  
         ps=conn.prepareStatement(sql);
  
         ResultSet rs=ps.executeQuery(); 
        
         while(rs.next())  //rs=> 단위가 Record단위 => 여러개를 동시에
         {
            GoodsVO vo=new GoodsVO();
            vo.setGno(rs.getInt(1));
            vo.setTitle(rs.getString(2));
            vo.setPoster(rs.getString(3));
            vo.setSelling_price(rs.getInt(4));
            vo.setOriginal_price(rs.getInt(5));
            vo.setMileage(rs.getInt(6));
            vo.setBrand(rs.getString(7));
            vo.setDelivery_price(rs.getString(8));
            vo.setAfter_service(rs.getString(9));
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
   
   // 동우 ver.총 상품 목록
   public List<GoodsVO> goodsListData(int page, int type)
   {
      List<GoodsVO> list=new ArrayList<GoodsVO>();
      try
      {
         conn=dbconn.getConnection();
         String sql="SELECT cno, gno, title, poster, original_price, selling_price, mileage, brand, num "
                + "FROM(SELECT cno, gno, title, poster, original_price, selling_price, mileage, brand, rownum AS num "
                + "FROM(SELECT cno, gno, title, poster, original_price, selling_price, mileage, brand "
                + "FROM " + tables[type] + " ORDER BY gno ASC)) "
                + "WHERE num BETWEEN ? AND ?";
         
         ps=conn.prepareStatement(sql);
         int start=(rowSize*page)-(rowSize-1);
         int end=rowSize*page;
         
         ps.setInt(1, start);
         ps.setInt(2, end);
         
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
            GoodsVO vo=new GoodsVO();
            vo.setCno(rs.getInt(1));
            vo.setGno(rs.getInt(2));
            vo.setTitle(rs.getString(3));
            vo.setPoster(rs.getString(4));
            vo.setOriginal_price(rs.getInt(5));
            vo.setSelling_price(rs.getInt(6));
            vo.setMileage(rs.getInt(7));
            vo.setBrand(rs.getString(8));
            
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
   
// 동우 ver.총 페이지
   public int goodsTotalPage(int type)
   {
      int total=0;
      try
      {
         conn=dbconn.getConnection();
         String sql="SELECT CEIL(COUNT(*)/" + rowSize + ") "
                + "FROM " + tables[type];
         ps=conn.prepareStatement(sql);
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
   
   // 동우 ver.상세보기
   public GoodsVO goodsDetailData(int type, int gno)
   {
      GoodsVO vo=new GoodsVO();
      try
      {
         conn=dbconn.getConnection();
         String sql="SELECT * FROM " + tables[type] + " WHERE gno=" + gno;
         ps=conn.prepareStatement(sql);
         ResultSet rs=ps.executeQuery();
         rs.next();
         vo.setCno(rs.getInt(1));
         vo.setGno(rs.getInt(2));
         vo.setTitle(rs.getString(3));
         vo.setPoster(rs.getString(4));
         vo.setOriginal_price(rs.getInt(5));
         vo.setSelling_price(rs.getInt(6));
         vo.setMileage(rs.getInt(7));
         vo.setBrand(rs.getString(8));
         vo.setDelivery_price(rs.getString(9));
         vo.setAfter_service(rs.getString(10));
         vo.setDetail_poster(rs.getString(11));
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
   
   /*
	 * <select id="cartIsGoodsCount" resultType="int" parameterType="CartVO">
	 	SELECT COUNT(*)
	 	FROM cart
	 	WHERE goods_no=#{goods_no} AND type=#{type} AND issale!=1
	 	AND id=#{id}
	 </select>
	 <update id="cartGoodsUpdate" parameterType="CartVO">
	 	UPDATE cart SET 
	 	amount=amount+#{amount}
	 	WHERE goods_no=#{goods_no} AND type=#{type} AND id=#{id}
	 </update>
	 <!-- 
	 	cart_no NUMBER,
		goods_no NUMBER,
		TYPE NUMBER,
		amount NUMBER,
		price NUMBER,
		id VARCHAR(20),
		ischeck NUMBER DEFAULT 0,
		issale NUMBER DEFAULT 0,
		regdate DATE DEFAULT SYSDATE
	  -->
	 <insert id="cartGoodsInsert" parameterType="CartVO">
	 	INSERT INTO cart VALUES(
	 		(SELECT NVL(MAX(cart_no)+1, 1) FROM cart),
	 		#{goods_no}, #{type}, #{amount}, #{price}, #{id},
	 		0, 0, SYSDATE
	 	)
	 </insert>
	 */
   
   
   // 메인 장바구니 숫자
     
   
   
	public static void cartInsert(CartVO vo)
	{
		SqlSession session=null;
		try
		{
			// autocommit
			session=ssf.openSession(true); // true는 commit (Insert, Update, Delete는 true를 줘아함)
			int count=session.selectOne("cartIsGoodsCount", vo);
			// 구매가 안된 상품이 있는지 확인
			if(count!=0)
			{
				// 존재한다면
				session.update("cartGoodsUpdate", vo);
			}
			else
			{
				// 없다면
				session.insert("cartGoodsInsert", vo);
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	/*
	 * <resultMap type="com.sist.vo.CartVO" id="cartMap">
	 	<result property="gvo.goods_poster" column="goods_poster"/>
	 	<result property="gvo.goods_name" column="goods_name"/>
	 	<result property="gvo.goods_price" column="goods_price"/>
	 </resultMap>
	 <select id="mypageGoodsCartData" resultMap="cartMap" parameterType="hashmap">
	 	SELECT cart_no, goods_no, amount, regdate, issale, ischeck, price,
	 	(SELECT goods_poster FROM ${tab_name} WHERE no=cart.goods_no) as goods_poster,
	 	(SELECT goods_name FROM ${tab_name} WHERE no=cart.goods_no) as goods_name,
	 	(SELECT goods_price FROM ${tab_name} WHERE no=cart.goods_no) as goods_price,
	 	FROM cart
	 	WHERE id=#{id} AND issale!=1
	 	ORDER BY cart_no DESC
	 </select>
	 */
	public static List<CartVO> mypageGoodsCartData(Map map)
	{
		List<CartVO> list=new ArrayList<CartVO>();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("mypageGoodsCartData", map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static void cartBuyInsert(CartVO vo)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.insert("cartBuyInsert", vo);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	
	public static List<CartVO> mypageGoodsBuyData(Map map)
	{
		List<CartVO> list=new ArrayList<CartVO>();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("mypageGoodsBuyData", map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static void cartDelete(int cart_no)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.delete("cartDelete", cart_no);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	/*
	 * <update id="goodsCartBuy" parameterType="int">
	     	UPDATE cart SET
	     	issale=1
	     	WHERE cart_no#{cart_no}
	     </update>
	 */
	public static void goodsCartBuy(int cart_no)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.update("goodsCartBuy", cart_no);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	
	public GoodsVO goodsCookieData(int type, int gno)
	{
		GoodsVO vo=new GoodsVO();
		try
		{
			conn=dbconn.getConnection();
		    String sql="SELECT cno,gno,title,poster,original_price,selling_price,mileage,brand,delivery_price,after_service,detail_poster FROM " + tables[type] + " WHERE gno=" + gno;
		       
		    ps=conn.prepareStatement(sql);
		    ResultSet rs=ps.executeQuery();
		       
		    rs.next();
	        vo.setCno(rs.getInt(1));
	        vo.setGno(rs.getInt(2));
	        vo.setTitle(rs.getString(3));
	        vo.setPoster(rs.getString(4));
	        vo.setOriginal_price(rs.getInt(5));
	        vo.setSelling_price(rs.getInt(6));
	        vo.setMileage(rs.getInt(7));
	        vo.setBrand(rs.getString(8));
	        vo.setDelivery_price(rs.getString(9));
	        vo.setAfter_service(rs.getString(10));
	        vo.setDetail_poster(rs.getString(11));
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