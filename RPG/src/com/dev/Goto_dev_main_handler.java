package com.dev;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Goto_dev_main_handler implements Dev_handler {
	private String view = "/WEB-INF/dev/dev_main.jsp";
	
	public String action(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return view;
	}
}