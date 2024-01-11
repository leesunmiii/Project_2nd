package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

/*
 *    1. DispatcherServlet
 *       => WEB-INF => application에 있는 클래스명을 읽는다 
 *       => 대기 
 *       => init은 서버구동시 한번만 수행 
 *    2. 사용자 접속 : service()
 *       => 사용자가 URL전송 
 *          main/main.do 
 *       =>  전체 XML에 등록된 Model을 읽어서 
 *           => @RequestMapping을 찾아서 메소드 호출 
 */
public class MainModel {
  @RequestMapping("main/main.do") 
  public String main_main(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  GoCampingDAO gocamdao=new GoCampingDAO();
      List<GoCampingVO> list=gocamdao.GoCampingHomeData(1,8);
      request.setAttribute("list", list);
      
	  //2. DB연동 
	  GoodsDAO dao=new GoodsDAO();
	  List<GoodsVO> list1= dao.goodsMainListData(1);
	  List<GoodsVO> list2= dao.goodsMainListData(2);
	  List<GoodsVO> list3= dao.goodsMainListData(3);
	  List<GoodsVO> list4= dao.goodsMainListData(4);
	  
	  recipeDAO rdao=new recipeDAO();
	  List<recipeVO> rList= rdao.recipeMainListData();
	  CommonsModel.commonsFooterData(request);
	  request.setAttribute("list1", list1);
	  request.setAttribute("list2", list2);
	  request.setAttribute("list3", list3);
	  request.setAttribute("list4", list4);
	  
	  request.setAttribute("rList", rList);
	  
	  request.setAttribute("main_jsp", "../main/home.jsp");
	  return "../main/main.jsp";
  }

}