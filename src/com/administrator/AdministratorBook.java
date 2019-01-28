package com.administrator;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@WebServlet("/AdministratorBook")
public class AdministratorBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdministratorBook() {
        super();
    }
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	public void destroy() {
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String select1=request.getParameter("classid3").trim();
		String input1=request.getParameter("classid4").trim();
		HttpSession hs1=request.getSession(true);
		hs1.setAttribute("select0", select1);
		hs1.setAttribute("input0", input1);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/AdministratorBook.jsp");
		dispatcher.forward(request, response);
	}

}
