package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.*;

public class ReplyModel {
	private String[] tab= {"", "1", "2", "3", "4"};
	@RequestMapping("reply/insert.do")
	public String reply_insert(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String type=request.getParameter("type");
		String cno=request.getParameter("cno");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		
		ReplyVO vo=new ReplyVO();
		vo.setType(Integer.parseInt(type));
		vo.setCno(Integer.parseInt(cno));
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		
		// DB 연동
		ReplyDAO dao=ReplyDAO.newInstance();
		dao.store_replyInsert(vo);
		
		return "redirect:../store/detail.do?cno=" +tab[Integer.parseInt(type)]+ "&gno=" + cno;
	}
	
	@RequestMapping("reply/delete_ok.do")
	public String reply_delete_ok(HttpServletRequest request, HttpServletResponse response)
	{
		String type=request.getParameter("type");
		String no=request.getParameter("no");
		String cno=request.getParameter("cno");
		
		ReplyDAO dao=ReplyDAO.newInstance();
		dao.store_replyDelete(Integer.parseInt(no));
		
		return "redirect:../store/detail.do?cno=" + tab[Integer.parseInt(type)] + "&gno=" + cno;
	}
}
