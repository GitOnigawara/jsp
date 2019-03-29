package com.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Character;
import com.dao.Character_DAO;
import com.dao.Equip_DAO;

public class Character_create_handler implements Main_handler {
	private String view = "/WEB-INF/view/character_select.jsp";
	
	@Override
	public String action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("- Character_create_handler action");
		
		if(request.getMethod().equalsIgnoreCase("GET")) { return view; }
		
		if(request.getMethod().equalsIgnoreCase("POST")) {
			String user_id		= (String)request.getSession().getAttribute("user_id");
			String char_name	= request.getParameter("char_name");

			try {
				// 케릭터 초기 능력치
				Character_DAO cdao = new Character_DAO();
				Character ch	= new Character(user_id, char_name, 1, 10, 10, 100, 10, 0, 1, 1, 0);
				cdao.setChar(ch);
				
				// 케릭터 초기 장비
				Equip_DAO edao	= new Equip_DAO();
				edao.initEquip(char_name);
				
				String msg = "케릭터가 생성되었습니다.";
				request.setAttribute("msg", msg);
				RequestDispatcher dsp = request.getRequestDispatcher("character_select.do");
				dsp.forward(request, response);
				return null;
			} catch(RuntimeException e) {
				return view;
			}
		}
		return view;
	}
}
