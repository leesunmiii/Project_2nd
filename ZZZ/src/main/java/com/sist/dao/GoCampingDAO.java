package com.sist.dao;
// DBCP => 미리 Connection을 연결 = POOL안에 저장
// 사용 후에 다시 POOL안에 반환해야 재사용이 가능
// Connetion 생성을 제한 => 연결시간을 줄일 수 있음
// 웹 개발을 하는 업체는 DBCP를 사용한다
// Mybatis / JPA의 기본은 DBCP
import java.util.*;
import java.sql.*;
import javax.sql.*; // 데이터베이스 정보 => DataSource

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.*;

import javax.naming.*; // Context => 이름으로 객체를 찾는다
public class GoCampingDAO {

	private Connection conn;
	private PreparedStatement ps; 
	private static GoCampingDAO dao;
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();			
																				
	
	// 싱글턴
	public static GoCampingDAO newInstance()
	{
		if(dao==null)
			dao=new GoCampingDAO();
		return dao;
	}
	//==================== 여기까지 필수사항 (dao 나올 때마다 꼭 해야하는 것) ===========================
	public List<GoCampingVO> GoCampingListData(int page)
	{
		List<GoCampingVO> list=new ArrayList<GoCampingVO>();
		try
		{
			// 1. 연결
			conn=dbconn.getConnection();
			
			// 2.SQL 문장 전송
			String sql="SELECT mno,title,Subtitle,poster,loc,num,numbb "
					+"FROM (SELECT mno,title,Subtitle,poster,loc,num,rownum as numbb "
					+"FROM (SELECT /*+ INDEX_ASC(GoCamping GoCamping_mno_pk)*/mno,title,Subtitle,poster,loc,num "
					+"FROM GoCamping)) "
					+"WHERE numbb BETWEEN ? AND ?";
			
			// 3. 미리 전송
			ps=conn.prepareStatement(sql);
			
			// 4. 실행 요청전에 ?에 값을 채운다
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1); // 오라클 => 1번
			int end=rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			// 5. 실행 후 결과값을 받는다
			ResultSet rs=ps.executeQuery();
			while(rs.next()) // 출력 첫번째 위치부터 읽기 시작
			{
				GoCampingVO vo=new GoCampingVO();
				vo.setMno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubtitle(rs.getString(3));
				vo.setPoster(rs.getString(4));
				vo.setLoc(rs.getString(5));
				list.add(vo);
			}
			
		}catch(Exception ex)
		{
			// 에러 출력
			ex.printStackTrace();
		}
		finally
		{
			//	반환 => 재사용
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	

	//	총페이지
	public int GoCampingTotalPage()
	{
		int total=0;
		try
		{
			// 주소 얻기
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
						+"FROM GoCamping1";
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
			// 반환
			dbconn.disConnection(conn, ps);
		}
		System.out.println("total="+total);
		return total;
		
	}
	
	// 상세보기
	public GoCampingVO GoCampingDetailData(int mno)
	{
		GoCampingVO vo=new GoCampingVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="UPDATE GoCamping1 SET "
					+"hit=hit+1 "
					+"WHERE mno="+mno;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate(); // commit을 포함 => INSERT/UPDATE
			// SELECT => 실행된 결과를 읽어온다 => executeQuery
			// 실제 데이터를 가지고 온다
			sql="SELECT mno,title,subtitle,poster,loc,num,envir,category,season,openclose,homepage,reserve,facility,pic1,pic2,pic3,explain,"
					+"picc1,picc2,picc3,picc4,picc5,picc6,picc7,picc8,picc9,picc10,"
					+"picc11,picc12,picc13,picc14,picc15,picc16,picc17,picc18,picc19,picc20 "
					+"FROM GoCamping1 "
					+"WHERE mno="+mno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setMno(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setSubtitle(rs.getString(3));
			vo.setPoster(rs.getString(4));
			vo.setLoc(rs.getString(5));
			vo.setNum(rs.getString(6));
			vo.setEnvir(rs.getString(7));
			vo.setCategory(rs.getString(8));
			vo.setSeason(rs.getString(9));
			vo.setOpenclose(rs.getString(10));
			vo.setHomepage(rs.getString(11));
			vo.setReserve(rs.getString(12));
			vo.setFacility(rs.getString(13));
			vo.setPic1(rs.getString(14));
			vo.setPic2(rs.getString(15));
			vo.setPic3(rs.getString(16));
			vo.setExplain(rs.getString(17));
			vo.setPicc1(rs.getString(18));
			vo.setPicc2(rs.getString(19));
			vo.setPicc3(rs.getString(20));
			vo.setPicc4(rs.getString(21));
			vo.setPicc5(rs.getString(22));
			vo.setPicc6(rs.getString(23));
			vo.setPicc7(rs.getString(24));
			vo.setPicc8(rs.getString(25));
			vo.setPicc9(rs.getString(26));
			vo.setPicc10(rs.getString(27));
			vo.setPicc11(rs.getString(28));
			vo.setPicc12(rs.getString(29));
			vo.setPicc13(rs.getString(30));
			vo.setPicc14(rs.getString(31));
			vo.setPicc15(rs.getString(32));
			vo.setPicc16(rs.getString(33));
			vo.setPicc17(rs.getString(34));
			vo.setPicc18(rs.getString(35));
			vo.setPicc19(rs.getString(36));
			vo.setPicc20(rs.getString(37));
			
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
	
	public List<GoCampingVO> GoCampingHomeData(int startno,int endno)
	{ 
		List<GoCampingVO> list=new ArrayList<GoCampingVO>();
		try
		{
			// 1. 연결
			conn=dbconn.getConnection();
			
			// 2.SQL 문장 전송
			 String sql = "SELECT mno,title,subtitle,poster,loc,num "
	                   + "FROM GoCamping "
	                   + "WHERE mno BETWEEN "+startno+" AND "+endno;
	        

	        // 3. 미리 전송
	        ps = conn.prepareStatement(sql);

			
			// 5. 실행 후 결과값을 받는다
			ResultSet rs=ps.executeQuery();
			while(rs.next()) // 출력 첫번째 위치부터 읽기 시작
			{
				GoCampingVO vo=new GoCampingVO();
				vo.setMno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubtitle(rs.getString(3));
				vo.setPoster(rs.getString(4));
				vo.setLoc(rs.getString(5));
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex)
		{
			// 에러 출력
			ex.printStackTrace();
		}
		finally
		{
			//	반환 => 재사용
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public GoCampingVO GoCampingRoomDetailData(int no,int no2)
	{
		GoCampingVO vo=new GoCampingVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT gcrnoo,gocampingno,roomno,roomname,roomprice, roompersonnel, roommaxpersonnel, checkin, checkout, room1,room2,room3,room4,room5,room6,room7,room8,room9,room10 "
					+"FROM gocampingroomdasi "
					+"WHERE gocampingno="+no+" AND roomno="+no2;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setGcrnoo(rs.getInt(1));
			vo.setGocampingno(rs.getInt(2));
			vo.setRoomno(rs.getInt(3));
			vo.setRoomname(rs.getString(4));
			vo.setRoomprice(rs.getString(5));
			vo.setRoompersonnel(rs.getString(6));
			vo.setRoommaxpersonnel(rs.getString(7));
			vo.setCheckin(rs.getString(8));
			vo.setCheckout(rs.getString(9));
			vo.setRoom1(rs.getString(10));
			vo.setRoom2(rs.getString(11));
			vo.setRoom3(rs.getString(12));
			vo.setRoom4(rs.getString(13));
			vo.setRoom5(rs.getString(14));
			vo.setRoom6(rs.getString(15));
			vo.setRoom7(rs.getString(16));
			vo.setRoom8(rs.getString(17));
			vo.setRoom9(rs.getString(18));
			vo.setRoom10(rs.getString(19));

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
	
	public GoCampingVO GoCampingInfoDetailData(int no)
	{
		GoCampingVO vo=new GoCampingVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT ino,notice,info,roominfo,personnel,service,bbq,cancle,etc "
					+"FROM gocampinginfo "
					+"WHERE ino="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setIno(rs.getInt(1));
			vo.setNotice(rs.getString(2));
			vo.setInfo(rs.getString(3));
			vo.setRoominfo(rs.getString(4));
			vo.setPersonnel(rs.getString(5));
			vo.setService(rs.getString(6));
			vo.setBbq(rs.getString(7));
			vo.setCancle(rs.getString(8));
			vo.setEtc(rs.getString(9));
			
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
	
	public GoCampingVO GoCampingCookieData(int mno)
	{
		GoCampingVO vo=new GoCampingVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT mno,title,subtitle,poster,loc,num,envir,category,season,openclose,homepage,reserve,facility,pic1,pic2,pic3,explain,"
					+"picc1,picc2,picc3,picc4,picc5,picc6,picc7,picc8,picc9,picc10,"
					+"picc11,picc12,picc13,picc14,picc15,picc16,picc17,picc18,picc19,picc20 "
					+"FROM GoCamping1 "
					+"WHERE mno="+mno;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setMno(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setSubtitle(rs.getString(3));
			vo.setPoster(rs.getString(4));
			vo.setLoc(rs.getString(5));
			vo.setNum(rs.getString(6));
			vo.setEnvir(rs.getString(7));
			vo.setCategory(rs.getString(8));
			vo.setSeason(rs.getString(9));
			vo.setOpenclose(rs.getString(10));
			vo.setHomepage(rs.getString(11));
			vo.setReserve(rs.getString(12));
			vo.setFacility(rs.getString(13));
			vo.setPic1(rs.getString(14));
			vo.setPic2(rs.getString(15));
			vo.setPic3(rs.getString(16));
			vo.setExplain(rs.getString(17));
			vo.setPicc1(rs.getString(18));
			vo.setPicc2(rs.getString(19));
			vo.setPicc3(rs.getString(20));
			vo.setPicc4(rs.getString(21));
			vo.setPicc5(rs.getString(22));
			vo.setPicc6(rs.getString(23));
			vo.setPicc7(rs.getString(24));
			vo.setPicc8(rs.getString(25));
			vo.setPicc9(rs.getString(26));
			vo.setPicc10(rs.getString(27));
			vo.setPicc11(rs.getString(28));
			vo.setPicc12(rs.getString(29));
			vo.setPicc13(rs.getString(30));
			vo.setPicc14(rs.getString(31));
			vo.setPicc15(rs.getString(32));
			vo.setPicc16(rs.getString(33));
			vo.setPicc17(rs.getString(34));
			vo.setPicc18(rs.getString(35));
			vo.setPicc19(rs.getString(36));
			vo.setPicc20(rs.getString(37));
			
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

