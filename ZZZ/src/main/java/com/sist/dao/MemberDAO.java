package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.sql.*;
import com.sist.vo.*;
import com.sist.dbcp.*;
public class MemberDAO {
   private Connection conn;
   private PreparedStatement ps;
   private CreateDBCPConnection dbconn=
		     new CreateDBCPConnection();
   private static MemberDAO dao;
   
   private static SqlSessionFactory ssf=CommonsDataBase.getSsf();
   
   public static MemberDAO newInstance()
   {
	   if(dao==null)
		   dao=new MemberDAO();
	   return dao;
   }
   // ID중복체크 
   public int memberIdCheck(String id)
   {
	   int count=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) FROM camp_member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return count;
   }
   /*try
   {
	   conn=dbconn.getConnection();
   }catch(Exception ex)
   {
	   ex.printStackTrace();
   }
   finally
   {
	   dbconn.disConnection(conn, ps);
   }*/
   
   // 2. 이메일 중복체크 
   public int memberEmailCheck(String email)
   {
	   int count=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) "
				     +"FROM camp_member "
				     +"WHERE email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, email);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return count;
   }
   //전화 중복체크
   public int memberPhoneCheck(String phone)
   {
	   int count=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) "
				     +"FROM camp_member "
				     +"WHERE phone?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, phone);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return count;
   }
   public List<ZipcodeVO> postfind(String dong)
   {
	   List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT zipcode,sido,gugun,"
				     +"dong,NVL(bunji,' ') "
				     +"FROM zipcode "
				     +"WHERE dong LIKE '%'||?||'%'";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, dong);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   ZipcodeVO vo=new ZipcodeVO();
			   vo.setZipcode(rs.getString(1));
			   vo.setSido(rs.getString(2));
			   vo.setGugun(rs.getString(3));
			   vo.setDong(rs.getString(4));
			   vo.setBunji(rs.getString(5));
			   
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
   public int postfindCount(String dong)
   {
	   int count=0;
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) "
				     +"FROM zipcode "
				     +"WHERE dong LIKE '%'||?||'%'";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, dong);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return count;
   }
   public void memberInsert(MemberVO vo)
   {
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="INSERT INTO camp_member VALUES("
				     +"?,?,?,?,?,?,?,?,?,?,'n',SYSDATE)";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ps.setString(2, vo.getPwd());
		   ps.setString(3, vo.getName());
		   ps.setString(4, vo.getSex());
		   ps.setString(5, vo.getBirthday());
		   ps.setString(6, vo.getEmail());
		   ps.setString(7, vo.getPhone());
		   ps.setString(8, vo.getPost());
		   ps.setString(9, vo.getAddr1());
		   ps.setString(10, vo.getAddr2());
		   ps.executeUpdate();
		   // save(vo)
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
   }
   public static MemberVO isLogin(String id,String pwd)
	{
		MemberVO vo = new MemberVO();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();//getConnection()
			int count=session.selectOne("memberIdCount",id);
	     //resultType과 일치							#{id}
			if(count==0)
			{
				vo.setMsg("NOID");
			}
			else
			{
				MemberVO dvo=session.selectOne("memberPwd",id);
				if(pwd.equals(dvo.getPwd()))
				{
					System.out.println("pwd:"+pwd);
					vo.setMsg("OK");
					vo.setId(dvo.getId());
					vo.setName(dvo.getName());
					vo.setAdmin(dvo.getAdmin());
					vo.setPhone(dvo.getPhone());
					vo.setAddr1(dvo.getAddr1());
					vo.setAddr2(dvo.getAddr2());
					vo.setPost(dvo.getPost());
					vo.setEmail(dvo.getEmail());
				}
				else
				{
					vo.setMsg("NOPWD");
				}
			}
			
		}
		catch(Exception ex)
		{
			// 에러 처리
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close(); // ps.close, conn.close
			// DBCP => 재사용 (반환)
		}
		return vo;
	}
   
   
   
// 회원 수정 
   public MemberVO memberUpdateData(String id)
   {
	   MemberVO vo=new MemberVO();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT id,name,sex,birthday,email,phone,post,"
				     +"addr1,addr2 "
				     +"FROM camp_member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   vo.setId(rs.getString(1));
		   vo.setName(rs.getString(2));
		   vo.setSex(rs.getString(3));
		   vo.setBirthday(rs.getString(4));
		   vo.setEmail(rs.getString(5));
		   vo.setPhone(rs.getString(6));
		   vo.setPost(rs.getString(7));
		   vo.setAddr1(rs.getString(8));
		   vo.setAddr2(rs.getString(9));
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
// 실제 회원 수정
   public MemberVO memberUpdate(MemberVO vo)
   {
	   MemberVO mvo=new MemberVO();
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT pwd "
				     +"FROM camp_member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String db_pwd=rs.getString(1);
		   rs.close();
		   
		   if(db_pwd.equals(vo.getPwd()))
		   {
			   mvo.setMsg("yes");
			   mvo.setName(vo.getName());
			   // 수정 
			   sql="UPDATE camp_member SET "
				  +"name=?,sex=?,birthday=?,email=?,phone=?,"
				  +"post=?,addr1=?,addr2=? "
				  +"WHERE id=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, vo.getName());
			   ps.setString(2, vo.getSex());
			   ps.setString(3, vo.getBirthday());
			   ps.setString(4, vo.getEmail());
			   ps.setString(5, vo.getPhone());
			   ps.setString(6, vo.getPost());
			   ps.setString(7, vo.getAddr1());
			   ps.setString(8, vo.getAddr2());
			   ps.setString(9, vo.getId());
			   ps.executeUpdate();
		   }
		   else
		   {
			   mvo.setMsg("no");
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return mvo;
   }
   
   
   // 회원 탈퇴 
   public String memberDeleteOk(String id,String pwd)
   {
	   String result="no";
	   try
	   {
		   conn=dbconn.getConnection();
		   conn.setAutoCommit(false);
		   String sql="SELECT pwd FROM camp_member "
				     +"WHERE id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   String db_pwd=rs.getString(1);
		   rs.close();
		   System.out.println("dao:"+db_pwd+"|"+pwd);
		   if(db_pwd.equals(pwd))
		   {
			      
				   
				   sql="DELETE FROM camp_member "
					  +"WHERE id=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, id);
				   ps.executeUpdate();
				   
				   result="yes";
				   conn.commit();
			   
		   }
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
		   try
		   {
			   conn.rollback();
		   }catch(Exception e) {}
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
		   try
		   {
			   conn.setAutoCommit(true);
		   }catch(Exception ex) {}
	   }
	   return result;
   }
   
// 아이디 찾기 
   public String memberId_EmailFind(String email)
   {
	   String result="";
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) FROM camp_member "
				     +"WHERE email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, email);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   
		   if(count==0) //email이 없는 상태
		   {
			   result="NO";
		   }
		   else // email이 존재
		   {
			   sql="SELECT RPAD(SUBSTR(id,1,1),LENGTH(id),'*') "
				  +"FROM camp_member "
				  +"WHERE email=?";
			   // s***
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, email);
			   rs=ps.executeQuery();
			   rs.next();
			   result=rs.getString(1);
			   rs.close();
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   
	   return result;
   }
   // 비밀번호 찾기 
   public String memberPasswordFind(String name,String email)
   {
	   String result="";
	   try
	   {
		   conn=dbconn.getConnection();
		   String sql="SELECT COUNT(*) "
				     +"FROM camp_member "
				     +"WHERE name=? AND email=?";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, name);
		   ps.setString(2, email);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   int count=rs.getInt(1);
		   rs.close();
		   
		   if(count==0)
		   {
			   result="NO";
		   }
		   else
		   {
			   sql="SELECT RPAD(SUBSTR(pwd,1,1),LENGTH(pwd),'*') "
				  +"FROM camp_member "
				  +"WHERE name=? AND email=?";
			   ps=conn.prepareStatement(sql);
			   ps.setString(1, name);
			   ps.setString(2, email);
			   rs=ps.executeQuery();
			   rs.next();
			   result=rs.getString(1);
			   rs.close();
		   }
	   }catch(Exception ex)
	   {
		  ex.printStackTrace();
	   }
	   finally
	   {
		   dbconn.disConnection(conn, ps);
	   }
	   return result;
   }
   
}