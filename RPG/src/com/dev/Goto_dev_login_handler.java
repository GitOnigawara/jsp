package com.dev;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Goto_dev_login_handler implements Dev_handler {
	private String view = "/WEB-INF/dev/dev_login.jsp";
	
	public String action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return view;
	}
}
