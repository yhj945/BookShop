package com.orders;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

@WebServlet("/Shoppingcart")
public class Shoppingcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Shoppingcart() {
        super();      
    }
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="jdbc:sqlserver://localhost:1433; DatabaseName = BookShop";
		HttpSession hs=request.getSession(true);
		String suceess = (String) hs.getAttribute("suceess");
		String username = (String) hs.getAttribute("loginname");
		if (!"isquit".equals(username)) {
			if ("issuceess".equals(suceess)) {
				try {
					RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/orders.jsp");
					dispatcher.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}				
			} else {
				RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/buybook1.jsp");
				dispatcher.forward(request, response);
			}			
		} else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/buybook1.jsp");
			dispatcher.forward(request, response);
		}		
	}
	public void destroy() {
	}
}
