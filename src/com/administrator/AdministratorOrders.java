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

@WebServlet("/AdministratorOrders")
public class AdministratorOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdministratorOrders() {
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
		String select=request.getParameter("classid1").trim();
		String input=request.getParameter("classid2").trim();
		HttpSession hs=request.getSession(true);
		hs.setAttribute("select", select);
		hs.setAttribute("input", input);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/AdministratorOrders.jsp");
		dispatcher.forward(request, response);
	}

}
