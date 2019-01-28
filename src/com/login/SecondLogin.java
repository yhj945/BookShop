package com.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SecondLogin")
public class SecondLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SecondLogin() {
        super();
    }
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(true);
		hs.setAttribute("loginname", "isquit");
		RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/second.jsp");
		dispatcher.forward(request, response);
	}

}
