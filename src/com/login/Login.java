package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javafx.beans.binding.When;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
    public Login() {
        super();
    }
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}                 
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username").trim();
		String password=request.getParameter("password").trim();
		String url="jdbc:sqlserver://localhost:1433; DatabaseName = BookShop";
		String sql = "select * from Customers where c_Name='"+username+"' and c_Password='"+password+"'";
		try {
			Connection conn = DriverManager.getConnection(url,"a","123");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()){
					HttpSession hs=request.getSession(true);
					hs.setAttribute("loginname", username);
					hs.setAttribute("suceess", "issuceess");
					response.setHeader("refresh", "0.8;url=http://localhost:8080/BookShop/Project/jsp/second_login.jsp"); //…Ë÷√0.8√Î÷”Ã¯◊™  		
					RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/suceess.jsp");
					dispatcher.forward(request, response);									        	         
				} else {
					request.setAttribute("Login", "");
					RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/login.jsp");
					dispatcher.forward(request, response);
				}
			stmt.close();
			conn.close();
		} catch (SQLException e) {	
			e.printStackTrace();
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/login.jsp");
			dispatcher.forward(request, response);
		}			
	}	
	public void destroy() {
	}
}
