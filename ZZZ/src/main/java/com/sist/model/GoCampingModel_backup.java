package com.sist.model;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;


public class GoCampingModel_backup {
	@RequestMapping("gocamping/list.do")
	public String gocamping_list(HttpServletRequest request, HttpServletResponse response)
	{
//		1. 요청값 받기
		try {
			String page=request.getParameter("page");
			if(page==null)
				page="1";
			int curpage=Integer.parseInt(page);
			System.out.println("curpage="+curpage);
			System.out.println("aaa");
			
			//	2. DB 연동
			GoCampingDAO dao=new GoCampingDAO();
			System.out.println("gocamping-dao: "+dao);
			List<GoCampingVO> list=dao.GoCampingListData(curpage);
			int totalpage=dao.GoCampingTotalPage();
			
			 final int BLOCK=10;
			 int startpage=((curpage-1)/BLOCK*BLOCK)+1;
			 int endpage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			 System.out.println("startpage="+startpage);
			                
			 if(endpage>totalpage)
			    endpage=totalpage;
			 
			//쿠키
				try 
				{
					List<GoCampingVO> kList=new ArrayList<GoCampingVO>();
					Cookie[] cookies=request.getCookies();
					if(cookies!=null)
					{
						for(int i=cookies.length-1;i>=0;i--) // 최신꺼부터 출력
						{
							if(cookies[i].getName().startsWith("gocamping_"))// food_로 시작했다면
							{
								String cookieno=cookies[i].getValue();
								GoCampingVO cookievo=dao.GoCampingCookieData(Integer.parseInt(cookieno));
								kList.add(cookievo);
							}		
						}
					}
					request.setAttribute("kList", kList);
				}catch(Exception ex)
				{
					ex.printStackTrace();
				}
				
			request.setAttribute("ad_jsp", "../gocamping/Carousel.jsp");
			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage",totalpage);
			request.setAttribute("list",list);
			request.setAttribute("main_jsp", "../gocamping/list.jsp");
			request.getSession().setAttribute("curpage", String.valueOf(curpage));
		}catch(Exception ex) 
		{
			ex.printStackTrace();
		}
		return "../main/main.jsp";
	}
	
	@RequestMapping("gocamping/before_detail.do")
	public String gocamping_before_detail(HttpServletRequest request, HttpServletResponse response) {
	    try 
	    {
	        String mno = request.getParameter("no");
	        Cookie cookie = new Cookie("gocamping_" + mno, mno);
	        cookie.setPath("/");
	        cookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(cookie);

	        System.out.println("비포_디테일 모델은 문제 없다");
	     
	        // 서버 로그에 쿠키 정보 출력
	        Cookie[] cookies = request.getCookies();
	        if (cookies != null) 
	        {
	            for (Cookie c : cookies) 
	            {
	                System.out.println("Cookie: " + c.getName() + "=" + c.getValue());
	            }
	        }
	        
	        return "redirect:../gocamping/detail.do?no=" + mno;
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예외 처리 로직 추가
	        return "errorPage"; // 예외 발생 시 리다이렉트할 페이지
	    }
	}
	
	@RequestMapping("gocamping/detail.do")
	public String gocamping_detail(HttpServletRequest request, HttpServletResponse response)
	{	
		try 
		{
			
			System.out.println("===detail.do 시작==========");
		// 예약 가능한 날 
		// 사용자가 no 보내줌
		String no=request.getParameter("no");// ?뒤에 값을 받음 do?fno=${}
		//							  ====== 키랑 같ㅌ아야함
		  System.out.println("첫번째 줄은 문제없음");
		  System.out.println("detail.do의 no= "+no);
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		  String today=sdf.format(new Date());
		  System.out.println("today="+today);
		  StringTokenizer st=new StringTokenizer(today,"-");
		  String sy=st.nextToken();
		  String sm=st.nextToken();
		  String sd=st.nextToken();
		  int year=Integer.parseInt(sy);
		  int month=Integer.parseInt(sm);
		  int day=Integer.parseInt(sd);
		  
		  // 요일 
		  String[] strWeek={"일","월","화","수","목","금","토"};
		  Calendar cal=Calendar.getInstance();
		  cal.set(Calendar.YEAR, year);
		  cal.set(Calendar.MONTH, month-1);
		  cal.set(Calendar.DATE, 1);
		  
		  // 요일 구하기 
		  int week=cal.get(Calendar.DAY_OF_WEEK);
		  int lastday=cal.getActualMaximum(Calendar.DATE);
		  week=week-1;
		  
		  request.setAttribute("year", year);
		  request.setAttribute("month", month);
		  request.setAttribute("day", day);
		  request.setAttribute("week", week);
		  request.setAttribute("lastday", lastday);
		  request.setAttribute("strWeek", strWeek);
		  
		  // 예약 가능한 날 => DB연동 
		  String rdays=ReserveDAO.reserveDays(Integer.parseInt(no));
		  int[] rday=new int[32];
		  System.out.println("rdays:"+rdays);
		  st=new StringTokenizer(rdays,",");
		  // 3,5,6,8,12,15,20,24,27,28,29
		  while(st.hasMoreTokens())
		  {
			  int a=Integer.parseInt(st.nextToken());
			  if(a>=day)
			  {
				  rday[a]=1;
			  }
		  }
		  System.out.println("Arrays.toString(rday)="+Arrays.toString(rday));
		  request.setAttribute("rday", rday);
		  request.setAttribute("reserve_jsp", "../gocamping/main_reserve.jsp");
		  // =================================================================

				
				GoCampingDAO dao=GoCampingDAO.newInstance();
				GoCampingVO vo=dao.GoCampingDetailData(Integer.parseInt(no));
				GoCampingVO infovo=dao.GoCampingInfoDetailData(1);
				GoCampingVO roomvo1=dao.GoCampingRoomDetailData(Integer.parseInt(no),1);
				GoCampingVO roomvo2=dao.GoCampingRoomDetailData(Integer.parseInt(no),2);
				GoCampingVO roomvo3=dao.GoCampingRoomDetailData(Integer.parseInt(no),3);
				GoCampingVO roomvo4=dao.GoCampingRoomDetailData(Integer.parseInt(no),4);
				GoCampingVO roomvo5=dao.GoCampingRoomDetailData(Integer.parseInt(no),5);
				request.setAttribute("roomvo1", roomvo1);
				request.setAttribute("roomvo2", roomvo2);
				request.setAttribute("roomvo3", roomvo3);
				request.setAttribute("roomvo4", roomvo4);
				request.setAttribute("roomvo5", roomvo5);
				request.setAttribute("vo", vo);
				request.setAttribute("infovo", infovo);
				   
				//쿠키
				try 
				{
					List<GoCampingVO> kList=new ArrayList<GoCampingVO>();
					Cookie[] cookies=request.getCookies();
					if(cookies!=null)
					{
						for(int i=cookies.length-1;i>=0;i--) // 최신꺼부터 출력
						{
							if(cookies[i].getName().startsWith("gocamping_"))// food_로 시작했다면
							{
								String cookieno=cookies[i].getValue();
								GoCampingVO cookievo=dao.GoCampingCookieData(Integer.parseInt(cookieno));
								kList.add(cookievo);
							}		
						}
					}
					request.setAttribute("kList", kList);
				}catch(Exception ex)
				{
					ex.printStackTrace();
				}
				/* request.setAttribute("size", cookieList.size()); */
				
				//지도
				String addr=vo.getLoc();
				System.out.println(addr.trim());
				request.setAttribute("addr", addr.trim());
				
				// 음식점 데이터
				FoodDAO fooddao=FoodDAO.newInstance();
				String juso=vo.getLoc();
				String juso1=juso.substring(juso.indexOf(" ")+1);
				String juso2=juso1.substring(0, juso1.indexOf(" "));
				System.out.println("juso1="+juso1);
				System.out.println("juso2="+juso2);
				List<FoodVO> foodlist=fooddao.foodListData(juso2);
				System.out.println("foodlist="+foodlist);
				request.setAttribute("foodlist", foodlist);
				
				//음식점 팝업 데이터
				FoodVO firstFood = foodlist.get(1);
				int firstFno = firstFood.getFno();
				System.out.println("firstFno="+firstFno);
				FoodVO foodpopup1=fooddao.foodDetailData(firstFno);
				request.setAttribute("foodpopup1", foodpopup1);
				
				FoodVO secondFood = foodlist.get(2);
				int secondFno = secondFood.getFno();
				System.out.println("secondFno="+secondFno);
				FoodVO foodpopup2=fooddao.foodDetailData(secondFno); 
				request.setAttribute("foodpopup2", foodpopup2);
				
				FoodVO thirdFood = foodlist.get(3);
				int thirdFno = thirdFood.getFno();
				FoodVO foodpopup3=fooddao.foodDetailData(thirdFno); 
				request.setAttribute("foodpopup3", foodpopup3);
				
				FoodVO fourthFood = foodlist.get(4);
				int fourthFno = fourthFood.getFno();
				FoodVO foodpopup4=fooddao.foodDetailData(fourthFno); 
				request.setAttribute("foodpopup4", foodpopup4);
				
				System.out.println("디테일 모델은 문제 없다");
				// 세션에서 현재 페이지 정보 읽기
			    String curpage = (String) request.getSession().getAttribute("curpage");

			    // 로그로 세션 값 확인
			    System.out.println("curpage attribute in session (detail): " + curpage);

			    int listcurpage = Integer.parseInt(curpage);
			    request.setAttribute("listcurpage", listcurpage);
			   
			    
				request.setAttribute("main_jsp", "../gocamping/detail.jsp");
				}catch(Exception ex)
				{
					ex.printStackTrace();
				}
				return "../main/main.jsp";
	}
	
	@RequestMapping("gocamping/detail_picture.do")
	public String gocamping_detail_picture(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../gocamping/detail_picture.jsp");
		return "../main/main.jsp";
	}

	
	
	@RequestMapping("gocamping/food_detail.do")
	public void foodFindDetailData(HttpServletRequest request,HttpServletResponse response)
	{
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		// JSON 전송
		String fno=request.getParameter("fno");
		FoodDAO dao=FoodDAO.newInstance();
		FoodVO vo=dao.foodfindDetailData(Integer.parseInt(fno));
		JSONObject obj=new JSONObject();
		obj.put("poster", vo.getPoster()); //{"poster":값}
		obj.put("name", vo.getName());
		obj.put("score", vo.getScore());
		obj.put("phone", vo.getPhone());
		obj.put("address", vo.getAddress());
		obj.put("content", vo.getContent());
		obj.put("type", vo.getType());
		obj.put("theme", vo.getTheme());
		obj.put("price", vo.getPrice());
		obj.put("seat", vo.getSeat());
		obj.put("time", vo.getTime());
		
		// 전송 => ajax
		try
		{
			PrintWriter out=response.getWriter();
			out.write(obj.toJSONString());
		}catch(Exception ex) {}
	}
	
	@RequestMapping("gocamping/reserve.do")
	public String gocamping_reserve(HttpServletRequest request, HttpServletResponse response)
	{
		try 
		{
			System.out.println("===reserve.do 시작==========");
		// 예약 가능한 날 
		  System.out.println("첫번째 줄은 문제없음");
		  String roomno=request.getParameter("roomno");
		  System.out.println("roomno="+roomno);
		  String gocampingno=request.getParameter("gocampingno");
		  System.out.println("gocampingno="+gocampingno);
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");
		  String today=sdf.format(new Date());
		  System.out.println("today="+today);
		  StringTokenizer st=new StringTokenizer(today,"-");
		  String sy=st.nextToken();
		  String sm=st.nextToken();
		  String sd=st.nextToken();
		  int year=Integer.parseInt(sy);
		  int month=Integer.parseInt(sm);
		  int day=Integer.parseInt(sd);
		  
		  // 요일 
		  String[] strWeek={"일","월","화","수","목","금","토"};
		  Calendar cal=Calendar.getInstance();
		  cal.set(Calendar.YEAR, year);
		  cal.set(Calendar.MONTH, month-1);
		  cal.set(Calendar.DATE, 1);
		  
		  // 요일 구하기 
		  int week=cal.get(Calendar.DAY_OF_WEEK);
		  int lastday=cal.getActualMaximum(Calendar.DATE);
		  week=week-1;
		  
		  request.setAttribute("year", year);
		  request.setAttribute("month", month);
		  request.setAttribute("day", day);
		  request.setAttribute("week", week);
		  request.setAttribute("lastday", lastday);
		  request.setAttribute("strWeek", strWeek);
		  
		  // 예약 가능한 날 => DB연동 
		  String rdays=ReserveDAO.reserveDays(Integer.parseInt(gocampingno));
		  int[] rday=new int[32];
		  System.out.println("rdays:"+rdays);
		  st=new StringTokenizer(rdays,",");
		  // 3,5,6,8,12,15,20,24,27,28,29
		  while(st.hasMoreTokens())
		  {
			  int a=Integer.parseInt(st.nextToken());
			  if(a>=day)
			  {
				  rday[a]=1;
			  }
		  }
		  System.out.println("Arrays.toString(rday)="+Arrays.toString(rday));
		  request.setAttribute("rday", rday);
		  
		  //============================================================
		

		GoCampingDAO dao=GoCampingDAO.newInstance();
		GoCampingVO roomvo=dao.GoCampingRoomDetailData(Integer.parseInt(gocampingno), Integer.parseInt(roomno));
		GoCampingVO campingvo=dao.GoCampingCookieData(Integer.parseInt(gocampingno));
		
		GoCampingVO campingvo2=dao.GoCampingCookieData(4);
		String reserve_juso=campingvo2.getLoc();
		System.out.println("reserve_juso: "+reserve_juso);
		
		request.setAttribute("roomvo", roomvo);
		request.setAttribute("campingvo", campingvo);

		request.setAttribute("main_jsp", "../gocamping/reserve.jsp");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("gocamping/reserve_before.do")
	public void reserve_before(HttpServletRequest request, HttpServletResponse response)
	{	
		// "mno":mno,"loc":loc,"person":person,"price":price,
		// "reserve_date1":reserve_date1,"reserve_date2":reserve_date2,"title":title
		
		
		String result="";
		 
		  try
		  {
			  String mno=request.getParameter("mno");
			  String loc=request.getParameter("loc");
			  String person=request.getParameter("person");
			  String price=request.getParameter("price");
			  String reserve_date1=request.getParameter("reserve_date1");
			  String reserve_date2=request.getParameter("reserve_date2");
			  String title=request.getParameter("title");
			  
			  HttpSession session=request.getSession();
			  String id=(String)session.getAttribute("id");
			  
			  /*
			   vo.setId(rs.getString(1));
				vo.setCampingno(rs.getInt(2));
				vo.setCheckin(rs.getString(3));
				vo.setCheckout(rs.getString(4));
				vo.setTimein(rs.getString(5));
				vo.setTimeout(rs.getString(6));
				vo.setInwon(rs.getString(7));
				vo.setPrice(rs.getString(8));
				vo.setIscheck(rs.getInt(9));
			   * 
			   * 
			   */
			  ReserveVO vo=new ReserveVO();
			  vo.setId("lee");
			  //vo.setId(id);
			  vo.setCampingno(Integer.parseInt(mno));
			  vo.setCheckin(reserve_date1); // 입실날
			  vo.setCheckout(reserve_date2); // 퇴실날
			  vo.setTimein("입실 15:00");
			  vo.setTimeout("퇴실 11:00");
			  vo.setInwon(person);
			  vo.setPrice(price);
			  
			  Reserve1DAO.reserveInsert(vo);
			  result="yes";
			  System.out.println("result(reserve_before)"+result);
		  }catch(Exception ex)
		  {
			  result="no";
			  System.out.println("result(reserve_before)"+result);
			  ex.printStackTrace();
		  }
		  
		  try
		  {
			  PrintWriter out=response.getWriter();
			  out.write(result);
		  }catch(Exception ex) {}

		request.setAttribute("main_jsp", "../gocamping/reserve_finish.jsp");
		
	}
	
	@RequestMapping("gocamping/reserve_finish.do")
	public String reserve_finish(HttpServletRequest request, HttpServletResponse response)
	{	
		  
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  Reserve1DAO dao=Reserve1DAO.newInstance();
//		  List<ReserveVO> list=dao.mypagecampingreserveok(id);
		  List<ReserveVO> list=dao.mypagecampingreserveok("lee");
		  request.setAttribute("list", list);
		  
		
		
		request.setAttribute("main_jsp", "../gocamping/reserve_finish.jsp");
		return "../main/main.jsp";
	}
	
}
