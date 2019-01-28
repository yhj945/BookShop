package com.orders;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RemoveOrders")
public class RemoveOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RemoveOrders() {
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
		String oid = request.getParameter("remove");
		HttpSession hs=request.getSession(true);
		String username = (String)hs.getAttribute("loginname");
		String suceess = (String) hs.getAttribute("suceess");
		if (!"isquit".equals(username)) {
			if ("issuceess".equals(suceess)) {
				try {
					Connection conn = DriverManager.getConnection(url,"a","123");
					CallableStatement cs = null;
					cs = conn.prepareCall("{call up_deleteorders(?,?)}");
					cs.setString(1,username);
					cs.setString(2,oid);
					cs.execute();
					cs.close();
					conn.close();
					RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/orders.jsp");
					dispatcher.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/orders.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/orders.jsp");
			dispatcher.forward(request, response);
		}
	}
	public void destroy() {
	}
}
