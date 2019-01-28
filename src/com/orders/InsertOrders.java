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
import javax.servlet.http.HttpSession;

@WebServlet("/InsertOrders")
public class InsertOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public InsertOrders() {
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
		String gid = request.getParameter("resPath");
		String gnum = request.getParameter(gid);
		HttpSession hs=request.getSession(true);
		String quit = (String) hs.getAttribute("loginname");
		String suceess = (String) hs.getAttribute("suceess");
		if (!"isquit".equals(quit)) {
			if ("issuceess".equals(suceess)) {
				try {
					Connection conn = DriverManager.getConnection(url,"a","123");
					CallableStatement cs = null;
					cs = conn.prepareCall("{call up_placeorders(?,?,?)}");
					cs.setString(1,gid);
					cs.setString(2,quit);					
					cs.setString(3,gnum);
					cs.execute();
					cs.close();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}			
		}
	}
	public void destroy() {
	}
}
