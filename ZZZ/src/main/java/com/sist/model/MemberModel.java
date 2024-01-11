package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

public class MemberModel {
  @RequestMapping("member/join.do")
  public String member_join(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../member/join.jsp");
		/* CommonsModel.commonsFooterData(request); */
	  return "../main/main.jsp";
  }
  
  @RequestMapping("member/idcheck.do")
  public String member_idcheck(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  return "../member/idcheck.jsp";
  }
  
  @RequestMapping("member/idcheck_ok.do")
  public void member_idcheck_ok(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String id=request.getParameter("id");
	  MemberDAO dao=MemberDAO.newInstance();
	  int count=dao.memberIdCheck(id);
	  System.out.println("ID check:"+count);
	  try
	  {
		  // Ajax로 값을 전송 
		  PrintWriter out=response.getWriter();
		  out.write(String.valueOf(count));
	  }catch(Exception ex){}
  }
  
  @RequestMapping("member/emailcheck.do")
  public String member_emailcheck(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  return "../member/emailcheck.jsp";
  }
  
  @RequestMapping("member/emailcheck_ok.do")
  public void member_emailcheck_ok(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String email=request.getParameter("email");
	  MemberDAO dao=MemberDAO.newInstance();
	  int count=dao.memberEmailCheck(email);
	  System.out.println("email check:"+count);
	  try
	  {
		  // Ajax로 값을 전송 
		  PrintWriter out=response.getWriter();
		  out.write(String.valueOf(count));
	  }catch(Exception ex){}
  }
  @RequestMapping("member/phonecheck.do")
  public String member_phonecheck(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  return "../member/phonecheck.jsp";
  }
  
  @RequestMapping("member/phonecheck_ok.do")
  public void member_phonecheck_ok(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String phone=request.getParameter("phone");
	  MemberDAO dao=MemberDAO.newInstance();
	  int count=dao.memberPhoneCheck(phone);
	  System.out.println("phone check:"+count);
	  try
	  {
		  // Ajax로 값을 전송 
		  PrintWriter out=response.getWriter();
		  out.write(String.valueOf(count));
	  }catch(Exception ex){}
  }
  
  @RequestMapping("member/postfind.do")
  public String member_postfind(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  return "../member/postfind.jsp";
  }
  
  @RequestMapping("member/postfind_ok.do")
  public void member_postfind_ok(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String dong=request.getParameter("dong");
	  System.out.println("dong:"+dong);
	  MemberDAO dao=MemberDAO.newInstance();
	  int count=dao.postfindCount(dong);
	  // JSON변경 
	  // VO => {} ==> JSONObject
	  // List => [{},{}...] ==> JSONArray
	  JSONArray arr=new JSONArray();//[]
	  //[{count:0},]
	  if(count==0)
	  {
		  JSONObject obj=new JSONObject();
		  obj.put("count", count);
		  arr.add(obj);
	  }
	  else
	  {
		  int i=0;
		  List<ZipcodeVO> list=dao.postfind(dong);
		  for(ZipcodeVO vo:list)
		  {
			  JSONObject obj=new JSONObject();
			  // {zipcode:111,address:'...',count:2},{}
			  obj.put("zipcode", vo.getZipcode());
			  obj.put("address", vo.getAddress());
			  if(i==0)
			  {
				  obj.put("count", count);
			  }
			  arr.add(obj);
			  i++;
		  }
	  }
	  System.out.println(arr.toJSONString());
	  try
	  {
		  response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  out.write(arr.toJSONString());
	  }catch(Exception ex) {}
	  
	  
  }
  @RequestMapping("member/join_ok.do")
  public String member_join_ok(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  String name=request.getParameter("name");
	  String sex=request.getParameter("sex");
	  String birthday=request.getParameter("birthday");
	  String email=request.getParameter("email");
	  String phone1=request.getParameter("phone1");
	  String phone2=request.getParameter("phone2");
	  String post1=request.getParameter("post1");
	  String post2=request.getParameter("post2");
	  String addr1=request.getParameter("addr1");
	  String addr2=request.getParameter("addr2");
	  
	  MemberVO vo=new MemberVO();
	  vo.setId(id);
	  vo.setPwd(pwd);
	  vo.setName(name);
	  vo.setSex(sex);
	  vo.setBirthday(birthday);
	  vo.setEmail(email);
	  vo.setPhone(phone1+"-"+phone2);
	  vo.setPost(post1+"-"+post2);
	  vo.setAddr1(addr1);
	  vo.setAddr2(addr2);
	  
	  MemberDAO dao=MemberDAO.newInstance();
	  // 회원 가입되는 메소드 호출 
	  dao.memberInsert(vo);
	  return "redirect:../main/main.do";
  }
  @RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request,
			HttpServletResponse response)
	{
	  	request.setAttribute("main_jsp", "../member/login.jsp");
		 return "../main/main.jsp";
	}
  
  @RequestMapping("member/login_ok.do")
	public void member_login_ok(HttpServletRequest request,
			HttpServletResponse response)
	{
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		MemberVO vo=MemberDAO.isLogin(id, pwd);
		if(vo.getMsg().equals("OK"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("admin", vo.getAdmin());
			session.setAttribute("post", vo.getPost());
			session.setAttribute("address", vo.getAddr1()+" "+vo.getAddr2());
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("phone", vo.getPhone());
		}
		
		try
		{
			// Ajax로 전송
			PrintWriter out=response.getWriter();
			out.write(vo.getMsg());
		}catch(Exception ex)
		{
			
		}
	}
	@RequestMapping("member/logout.do")
	public String memeber_logout(HttpServletRequest request,
			HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.invalidate(); // 세션 해제
		return "redirect:../main/main.do";
	}
	
	@RequestMapping("member/idfind.do")
	public String memberIdFind(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../member/idfind.jsp");
		/* CommonModel.commonRequestData(request); */
		return "../main/main.jsp";
	}
	@RequestMapping("member/idfind_ok.do")
	public void memberIdFindOk(HttpServletRequest request,HttpServletResponse response)
	{
		String email=request.getParameter("email");
		// DAO
		MemberDAO dao=MemberDAO.newInstance();
		String res=dao.memberId_EmailFind(email);
		try
		{
			// Ajax에 값을 전송 => NO , s***
			PrintWriter out=response.getWriter();// 사용자 브라우저
			out.println(res);
		}catch(Exception ex) {}
	}
	@RequestMapping("member/passwordfind.do")
	public String memberPasswordFind(HttpServletRequest request,
			HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../member/passwordfind.jsp");
		/* CommonModel.commonRequestData(request); */
		return "../main/main.jsp";
	}
	@RequestMapping("member/passwordfindOk.do")
	public void memberPasswordFindOk(HttpServletRequest request,
			HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		// {"name":'',"email":sss}
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		
		MemberDAO dao=MemberDAO.newInstance();
		// 결과값 받기 
		String res=dao.memberPasswordFind(name, email);
		// Ajax로 전송 
		try
		{
			//스프링 => @RestController 
			PrintWriter out=response.getWriter();
			out.println(res);
		}catch(Exception ex) {}
	}
}