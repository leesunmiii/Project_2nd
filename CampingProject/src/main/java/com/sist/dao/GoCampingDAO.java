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
			String sql="UPDATE GoCamping SET "
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
	
	public GoCampingVO GoCampingRoomDetailData(int no)
	{
		GoCampingVO vo=new GoCampingVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT gcrno,A_roomname,A_price, A_personnel, A_maxpersonnel, A_checkin, A_checkout, A_room1,A_room2,A_room3,A_room4,A_room5,A_room6,A_room7,A_room8,A_room9,A_room10,"
					+"B_roomname,B_price, B_personnel, B_maxpersonnel, B_checkin, B_checkout, B_room1,B_room2,B_room3,B_room4,B_room5,B_room6,B_room7,B_room8,B_room9,B_room10,"
					+"C_roomname,C_price, C_personnel, C_maxpersonnel, C_checkin, C_checkout, C_room1,C_room2,C_room3,C_room4,C_room5,C_room6,C_room7,C_room8,C_room9,C_room10,"
					+"D_roomname,D_price, D_personnel, D_maxpersonnel, D_checkin, D_checkout, D_room1,D_room2,D_room3,D_room4,D_room5,D_room6,D_room7,D_room8,D_room9,D_room10,"
					+"E_roomname,E_price, E_personnel, E_maxpersonnel, E_checkin, E_checkout, E_room1,E_room2,E_room3,E_room4,E_room5,E_room6,E_room7,E_room8,E_room9,E_room10 "
					+"FROM gocampingroom "
					+"WHERE gcrno="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setGcrno(rs.getInt(1));
			vo.setA_roomname(rs.getString(2));
			vo.setA_price(rs.getString(3));
			vo.setA_personnel(rs.getString(4));
			vo.setA_maxpersonnel(rs.getString(5));
			vo.setA_checkin(rs.getString(6));
			vo.setA_checkout(rs.getString(7));
			vo.setA_room1(rs.getString(8));
			vo.setA_room2(rs.getString(9));
			vo.setA_room3(rs.getString(10));
			vo.setA_room4(rs.getString(11));
			vo.setA_room5(rs.getString(12));
			vo.setA_room6(rs.getString(13));
			vo.setA_room7(rs.getString(14));
			vo.setA_room8(rs.getString(15));
			vo.setA_room9(rs.getString(16));
			vo.setA_room10(rs.getString(17));
			
			vo.setB_roomname(rs.getString(18));
			vo.setB_price(rs.getString(19));
			vo.setB_personnel(rs.getString(20));
			vo.setB_maxpersonnel(rs.getString(21));
			vo.setB_checkin(rs.getString(22));
			vo.setB_checkout(rs.getString(23));
			vo.setB_room1(rs.getString(24));
			vo.setB_room2(rs.getString(25));
			vo.setB_room3(rs.getString(26));
			vo.setB_room4(rs.getString(27));
			vo.setB_room5(rs.getString(28));
			vo.setB_room6(rs.getString(29));
			vo.setB_room7(rs.getString(30));
			vo.setB_room8(rs.getString(31));
			vo.setB_room9(rs.getString(32));
			vo.setB_room10(rs.getString(33));
			
			vo.setC_roomname(rs.getString(34));
			vo.setC_price(rs.getString(35));
			vo.setC_personnel(rs.getString(36));
			vo.setC_maxpersonnel(rs.getString(37));
			vo.setC_checkin(rs.getString(38));
			vo.setC_checkout(rs.getString(39));
			vo.setC_room1(rs.getString(40));
			vo.setC_room2(rs.getString(41));
			vo.setC_room3(rs.getString(42));
			vo.setC_room4(rs.getString(43));
			vo.setC_room5(rs.getString(44));
			vo.setC_room6(rs.getString(45));
			vo.setC_room7(rs.getString(46));
			vo.setC_room8(rs.getString(47));
			vo.setC_room9(rs.getString(48));
			vo.setC_room10(rs.getString(49));
			
			vo.setD_roomname(rs.getString(50));
			vo.setD_price(rs.getString(51));
			vo.setD_personnel(rs.getString(52));
			vo.setD_maxpersonnel(rs.getString(53));
			vo.setD_checkin(rs.getString(54));
			vo.setD_checkout(rs.getString(55));
			vo.setD_room1(rs.getString(56));
			vo.setD_room2(rs.getString(57));
			vo.setD_room3(rs.getString(58));
			vo.setD_room4(rs.getString(59));
			vo.setD_room5(rs.getString(60));
			vo.setD_room6(rs.getString(61));
			vo.setD_room7(rs.getString(62));
			vo.setD_room8(rs.getString(63));
			vo.setD_room9(rs.getString(64));
			vo.setD_room10(rs.getString(65));
			
			vo.setE_roomname(rs.getString(66));
			vo.setE_price(rs.getString(67));
			vo.setE_personnel(rs.getString(68));
			vo.setE_maxpersonnel(rs.getString(69));
			vo.setE_checkin(rs.getString(70));
			vo.setE_checkout(rs.getString(71));
			vo.setE_room1(rs.getString(72));
			vo.setE_room2(rs.getString(73));
			vo.setE_room3(rs.getString(74));
			vo.setE_room4(rs.getString(75));
			vo.setE_room5(rs.getString(76));
			vo.setE_room6(rs.getString(77));
			vo.setE_room7(rs.getString(78));
			vo.setE_room8(rs.getString(79));
			vo.setE_room9(rs.getString(80));
			vo.setE_room10(rs.getString(81));
			
			
			
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
}

