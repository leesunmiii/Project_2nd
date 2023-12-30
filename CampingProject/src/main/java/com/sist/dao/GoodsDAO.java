package com.sist.dao;
import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.*;
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
import com.sist.vo.GoodsVO;
public class GoodsDAO {
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
                  +"FROM goods1 ORDER BY no ASC))";
                  
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
}
