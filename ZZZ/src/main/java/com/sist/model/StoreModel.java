package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

public class StoreModel {
	
	/*
	 * @RequestMapping("store/new.do") public String store_new(HttpServletRequest
	 * request, HttpServletResponse response) { String
	 * type=request.getParameter("type"); type="1"; String
	 * page=request.getParameter("page"); if(page==null) page="1";
	 * 
	 * // 페이지 지정 int curpage=Integer.parseInt(page); // 페이지에 해당되는 목록 GoodsDAO
	 * dao=new GoodsDAO(); List<GoodsVO> list=dao.goodsListData(curpage,
	 * Integer.parseInt(type)); int
	 * totalpage=dao.goodsTotalPage(Integer.parseInt(type));
	 * 
	 * final int BLOCK=10; int startPage=((curpage-1)/BLOCK*BLOCK)+1; int
	 * endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	 * 
	 * if(endPage>totalpage) endPage=totalpage;
	 * 
	 * // JSP에서 출력할 데이터를 전송 request.setAttribute("list", list);
	 * request.setAttribute("curpage", curpage); request.setAttribute("totalpage",
	 * totalpage); request.setAttribute("startPage", startPage);
	 * request.setAttribute("endPage", endPage);
	 * 
	 * request.setAttribute("store_jsp", "../store/new.jsp");
	 * request.setAttribute("main_jsp", "../store/store_main.jsp");
	 * 
	 * return "../main/main.jsp"; }
	 * 
	 * @RequestMapping("store/backpacking.do") public String
	 * store_backpacking(HttpServletRequest request, HttpServletResponse response) {
	 * String type=request.getParameter("type"); type="2"; String
	 * page=request.getParameter("page"); if(page==null) page="1";
	 * 
	 * // 페이지 지정 int curpage=Integer.parseInt(page); // 페이지에 해당되는 목록 GoodsDAO
	 * dao=new GoodsDAO(); List<GoodsVO> list=dao.goodsListData(curpage,
	 * Integer.parseInt(type)); int
	 * totalpage=dao.goodsTotalPage(Integer.parseInt(type));
	 * 
	 * final int BLOCK=10; int startPage=((curpage-1)/BLOCK*BLOCK)+1; int
	 * endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	 * 
	 * if(endPage>totalpage) endPage=totalpage;
	 * 
	 * // JSP에서 출력할 데이터를 전송 request.setAttribute("list", list);
	 * request.setAttribute("curpage", curpage); request.setAttribute("totalpage",
	 * totalpage); request.setAttribute("startPage", startPage);
	 * request.setAttribute("endPage", endPage);
	 * 
	 * request.setAttribute("store_jsp", "../store/backpacking.jsp");
	 * request.setAttribute("main_jsp", "../store/store_main.jsp");
	 * 
	 * return "../main/main.jsp"; }
	 * 
	 * @RequestMapping("store/long.do") public String store_long(HttpServletRequest
	 * request, HttpServletResponse response) { String
	 * type=request.getParameter("type"); type="3"; String
	 * page=request.getParameter("page"); if(page==null) page="1";
	 * 
	 * // 페이지 지정 int curpage=Integer.parseInt(page); // 페이지에 해당되는 목록 GoodsDAO
	 * dao=new GoodsDAO(); List<GoodsVO> list=dao.goodsListData(curpage,
	 * Integer.parseInt(type)); int
	 * totalpage=dao.goodsTotalPage(Integer.parseInt(type));
	 * 
	 * final int BLOCK=10; int startPage=((curpage-1)/BLOCK*BLOCK)+1; int
	 * endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	 * 
	 * if(endPage>totalpage) endPage=totalpage;
	 * 
	 * // JSP에서 출력할 데이터를 전송 request.setAttribute("list", list);
	 * request.setAttribute("curpage", curpage); request.setAttribute("totalpage",
	 * totalpage); request.setAttribute("startPage", startPage);
	 * request.setAttribute("endPage", endPage);
	 * 
	 * request.setAttribute("store_jsp", "../store/long.jsp");
	 * request.setAttribute("main_jsp", "../store/store_main.jsp");
	 * 
	 * return "../main/main.jsp"; }
	 * 
	 * @RequestMapping("store/travel.do") public String
	 * store_travel(HttpServletRequest request, HttpServletResponse response) {
	 * String type=request.getParameter("type"); type="4"; String
	 * page=request.getParameter("page"); if(page==null) page="1";
	 * 
	 * // 페이지 지정 int curpage=Integer.parseInt(page); // 페이지에 해당되는 목록 GoodsDAO
	 * dao=new GoodsDAO(); List<GoodsVO> list=dao.goodsListData(curpage,
	 * Integer.parseInt(type)); int
	 * totalpage=dao.goodsTotalPage(Integer.parseInt(type));
	 * 
	 * final int BLOCK=10; int startPage=((curpage-1)/BLOCK*BLOCK)+1; int
	 * endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	 * 
	 * if(endPage>totalpage) endPage=totalpage;
	 * 
	 * // JSP에서 출력할 데이터를 전송 request.setAttribute("list", list);
	 * request.setAttribute("curpage", curpage); request.setAttribute("totalpage",
	 * totalpage); request.setAttribute("startPage", startPage);
	 * request.setAttribute("endPage", endPage);
	 * 
	 * request.setAttribute("store_jsp", "../store/travel.jsp");
	 * request.setAttribute("main_jsp", "../store/store_main.jsp");
	 * 
	 * return "../main/main.jsp"; }
	 * 
	 * @RequestMapping("store/detail.do") public String
	 * store_detail(HttpServletRequest request, HttpServletResponse response) { //
	 * 사용자 => gno String gno=request.getParameter("gno"); String
	 * cno=request.getParameter("cno");
	 * 
	 * 
	 * // DB 연동 GoodsDAO dao=GoodsDAO.newInstance(); GoodsVO
	 * vo=dao.goodsDetailData(Integer.parseInt(cno),Integer.parseInt(gno));
	 * 
	 * request.setAttribute("vo", vo); request.setAttribute("store_jsp",
	 * "../store/detail.jsp"); request.setAttribute("main_jsp",
	 * "../store/store_main.jsp"); return "../main/main.jsp"; }
	 */
	 
   
   
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @RequestMapping("store/detail_before.do")
	public String food_before(HttpServletRequest request, HttpServletResponse response)
	{
		String gno=request.getParameter("gno");
		String cno=request.getParameter("cno");
		Cookie cookie=new Cookie("goods_" + cno + "_" + gno, gno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return "redirect:../store/detail.do?cno=" + cno + "&gno=" + gno;
		//return "redirect:../food/food_detail.do?fno=" + fno;
	}
   
   @RequestMapping("store/detail.do")
   public String store_detailex(HttpServletRequest request, HttpServletResponse response)
   {
	   String gno=request.getParameter("gno");
       String cno=request.getParameter("cno");
       
       String curpage=(String) request.getSession().getAttribute("backpage");
       int listcurpage=Integer.parseInt(curpage);
       request.setAttribute("listcurpage", listcurpage); 
	   
	   GoodsDAO dao=GoodsDAO.newInstance();
       GoodsVO vo=dao.goodsDetailData(Integer.parseInt(cno),Integer.parseInt(gno));
       
       String[] detailposter=vo.getDetail_poster().split("\\|");
       List<String> list=Arrays.asList(detailposter);
       
       request.setAttribute("vo", vo);
       request.setAttribute("list", list);
       
       // 댓글 전송
       ReplyDAO dao1=ReplyDAO.newInstance();
       List<ReplyVO> rList=dao1.store_replyListData(Integer.parseInt(cno), Integer.parseInt(gno));
       request.setAttribute("rList", rList);    
       request.setAttribute("rcount", rList.size()); // 0이면 댓글 없음을 표시하고 그렇지 아니면 표시 해야 함
       
		/*
		 * BoardDAO dao1=BoardDAO.newInstance(); List<ReplyVO>
		 * rList=dao1.board_replyListData(Integer.parseInt(no));
		 * request.setAttribute("rList", rList); request.setAttribute("rcount",
		 * rList.size()); // 0이면 댓글 없음을 표시하고 그렇지 아니면 표시 해야 함
		 */       
       request.setAttribute("store_jsp","../store/detail.jsp");
       request.setAttribute("main_jsp","../store/store_main.jsp");
       //request.setAttribute("main_jsp","../store/detail.jsp");
       return "../main/main.jsp";
   }
   @RequestMapping("store/new.do")
   public String store_new(HttpServletRequest request, HttpServletResponse response)
   {
	   String type=request.getParameter("type");
       	   type="1";
       String page=request.getParameter("page");
       if(page==null)
    	   page="1";
    
	    // 페이지 지정
	    int curpage=Integer.parseInt(page);
	    // 페이지에 해당되는 목록
	    GoodsDAO dao=new GoodsDAO();
	    List<GoodsVO> list=dao.goodsListData(curpage, Integer.parseInt(type));
	    int totalpage=dao.goodsTotalPage(Integer.parseInt(type));
	                
	    final int BLOCK=6;
	    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	                
	    if(endPage>totalpage)
	       endPage=totalpage;
	                
	    // JSP에서 출력할 데이터를 전송
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.getSession().setAttribute("backpage", String.valueOf(curpage));
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
	    
	    // => 쿠키 데이터를 전송
	      Cookie[] cookies=request.getCookies();
	      List<GoodsVO> cList=new ArrayList<GoodsVO>();
	      if(cookies!=null)
	      {
	    	  for(int i=cookies.length-1;i>=0;i--)
	    	  {
	    		  if(cookies[i].getName().startsWith("goods_"+type))
	    		  {
	    			  //cookies[i].setPath("/");
	    			  String no=cookies[i].getValue();
	    			  GoodsVO vo=dao.goodsCookieData(Integer.parseInt(type), Integer.parseInt(no));
	    			  cList.add(vo);
	    		  }
	    	  }
	      }
	      request.setAttribute("cList", cList);     
	      request.setAttribute("count", cList.size());
	    
	    
	   
	    request.setAttribute("store_jsp","../store/new.jsp");
        request.setAttribute("main_jsp","../store/store_main.jsp");
       
       return "../main/main.jsp";
   }
   @RequestMapping("store/backpacking.do")
   public String store_backpacking(HttpServletRequest request, HttpServletResponse response)
   {
	   String type=request.getParameter("type");
       type="2";
	    String page=request.getParameter("page");
	    if(page==null)
	       page="1";
	    
	    // 페이지 지정
	    int curpage=Integer.parseInt(page);
	    // 페이지에 해당되는 목록
	    GoodsDAO dao=new GoodsDAO();
	    List<GoodsVO> list=dao.goodsListData(curpage, Integer.parseInt(type));
	    int totalpage=dao.goodsTotalPage(Integer.parseInt(type));
	                
	    final int BLOCK=6;
	    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	                
	    if(endPage>totalpage)
	       endPage=totalpage;
	                
	    // JSP에서 출력할 데이터를 전송
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);

	   
	   request.setAttribute("store_jsp","../store/backpacking.jsp");
       request.setAttribute("main_jsp","../store/store_main.jsp");
       
       return "../main/main.jsp";
   }
   @RequestMapping("store/long.do")
   public String store_long(HttpServletRequest request, HttpServletResponse response)
   {
	   String type=request.getParameter("type");
       type="3";
	    String page=request.getParameter("page");
	    if(page==null)
	       page="1";
	    
	    // 페이지 지정
	    int curpage=Integer.parseInt(page);
	    // 페이지에 해당되는 목록
	    GoodsDAO dao=new GoodsDAO();
	    List<GoodsVO> list=dao.goodsListData(curpage, Integer.parseInt(type));
	    int totalpage=dao.goodsTotalPage(Integer.parseInt(type));
	                
	    final int BLOCK=6;
	    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	                
	    if(endPage>totalpage)
	       endPage=totalpage;
	                
	    // JSP에서 출력할 데이터를 전송
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);

	   
	   request.setAttribute("store_jsp","../store/long.jsp");
       request.setAttribute("main_jsp","../store/store_main.jsp");
       
       return "../main/main.jsp";
   }
   @RequestMapping("store/travel.do")
   public String store_travel(HttpServletRequest request, HttpServletResponse response)
   {
	   String type=request.getParameter("type");
       	   type="4";
       String page=request.getParameter("page");
       if(page==null)
    	   page="1";
    
       // 페이지 지정
       int curpage=Integer.parseInt(page);
       // 페이지에 해당되는 목록
       GoodsDAO dao=new GoodsDAO();
       List<GoodsVO> list=dao.goodsListData(curpage, Integer.parseInt(type));
       int totalpage=dao.goodsTotalPage(Integer.parseInt(type));
                
       final int BLOCK=6;
       int startPage=((curpage-1)/BLOCK*BLOCK)+1;
       int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
                
       if(endPage>totalpage)
    	   endPage=totalpage;
                
       // JSP에서 출력할 데이터를 전송
       request.setAttribute("list", list);
       request.setAttribute("curpage", curpage);
       request.setAttribute("totalpage", totalpage);
       request.setAttribute("startPage", startPage);
       request.setAttribute("endPage", endPage);

	   
	   request.setAttribute("store_jsp","../store/travel.jsp");
       request.setAttribute("main_jsp","../store/store_main.jsp");
       
       return "../main/main.jsp";
   }
   /////////////////////////////////////////////////////////////////////////////////
   
	@RequestMapping("store/cart_insert.do")
	public void cart_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String result="";
		
		try
		{
			String no=request.getParameter("no");
			String price=request.getParameter("price");
			String count=request.getParameter("count");
			String type=request.getParameter("type");
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			CartVO vo=new CartVO();
			vo.setAmount(Integer.parseInt(count));
			vo.setGoods_no(Integer.parseInt(no));
			vo.setId(id);
			vo.setPrice(Integer.parseInt(price));
			vo.setType(Integer.parseInt(type));
			
			GoodsDAO.cartInsert(vo);
			result="yes";
			System.out.println(result);
		}catch(Exception ex)
		{
			result="no";
		}
		
		try
		{
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	
	@RequestMapping("store/cart_buy.do")
	public static void cart_buy(HttpServletRequest request, HttpServletResponse response)
	{
		String result="";
		
		try
		{
			String no=request.getParameter("no");
			String price=request.getParameter("price");
			String count=request.getParameter("count");
			String type=request.getParameter("type");
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			CartVO vo=new CartVO();
			vo.setAmount(Integer.parseInt(count));
			vo.setGoods_no(Integer.parseInt(no));
			vo.setId(id);
			vo.setPrice(Integer.parseInt(price));
			vo.setType(Integer.parseInt(type));
			
			GoodsDAO.cartBuyInsert(vo);
			
			result="yes";
		}catch(Exception ex)
		{
			result="no";
		}
		
		try
		{
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	
	@RequestMapping("store/cart_cancel.do")
	public String cart_cancel(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		
		// DB연동
		GoodsDAO.cartDelete(Integer.parseInt(no));
		
		return "redirect:../mypage/mypage_cart.do";
	}
	
	@RequestMapping("store/store_cart_buy.do")
	public String store_cart_buy(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		
		// DB 연동
		GoodsDAO.goodsCartBuy(Integer.parseInt(no));
		
		return "redirect:../mypage/mypage_cart.do";
	}
   
}