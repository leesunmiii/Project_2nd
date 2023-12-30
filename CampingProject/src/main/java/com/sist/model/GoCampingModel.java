package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;


public class GoCampingModel {
	@RequestMapping("gocamping/list.do")
	public String gocamping_list(HttpServletRequest request, HttpServletResponse response)
	{
//		1. 요청값 받기
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

			request.setAttribute("startpage", startpage);
			request.setAttribute("endpage", endpage);
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage",totalpage);
			request.setAttribute("list",list);
			request.setAttribute("main_jsp", "../gocamping/list.jsp");
			request.getSession().setAttribute("curpage", String.valueOf(curpage));
		return "../main/main.jsp";
	}
	
	@RequestMapping("gocamping/detail.do")
	public String gocamping_detail(HttpServletRequest request, HttpServletResponse response)
	{
		// 사용자가 no 보내줌
				String no=request.getParameter("no");
				GoCampingDAO dao=GoCampingDAO.newInstance();
				GoCampingVO vo=dao.GoCampingDetailData(Integer.parseInt(no));
				GoCampingVO infovo=dao.GoCampingInfoDetailData(1);
				GoCampingVO roomvo=dao.GoCampingRoomDetailData(Integer.parseInt(no));
				request.setAttribute("roomvo", roomvo);
				request.setAttribute("vo", vo);
				request.setAttribute("infovo", infovo);
				
				
				
				// 세션에서 현재 페이지 정보 읽기
			    String curpage = (String) request.getSession().getAttribute("curpage");

			    // 로그로 세션 값 확인
			    System.out.println("curpage attribute in session (detail): " + curpage);

			    int listcurpage = Integer.parseInt(curpage);
			    request.setAttribute("listcurpage", listcurpage);
			   
			    
				request.setAttribute("main_jsp", "../gocamping/detail.jsp");
				return "../main/main.jsp";
	}
	
	@RequestMapping("gocamping/detail_picture.do")
	public String gocamping_detail_picture(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../gocamping/detail_picture.jsp");
		return "../main/main.jsp";
	}

	
}
