package com.sist.model;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class HomeModel {
	@RequestMapping("main/home.do")
	public String main_home(HttpServletRequest request, HttpServletResponse response)
	{
		RecipeDAO recdao=new RecipeDAO();
		
		List<RecipeVO> reclist1=recdao.recipeHomeData(1, 6);
		request.setAttribute("reclist1", reclist1);
		
		List<RecipeVO> reclist2=recdao.recipeHomeData(7, 10);
		request.setAttribute("reclist2", reclist2);
		
		GoCampingDAO dao=new GoCampingDAO();
		List<GoCampingVO> list=dao.GoCampingHomeData(1,8);
		

		
		request.setAttribute("list", list);
		
		request.setAttribute("main_jsp","../main/home.jsp");
		return "../main/main.jsp";
	}
}
