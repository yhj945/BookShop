package com.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	public Register() {
		super();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		String name=request.getParameter("usernamesignup").trim();
		String phone=request.getParameter("phonesignup").trim();
		String password=request.getParameter("passwordsignup").trim();		
		String password2=request.getParameter("passwordsignup_confirm").trim();
		String url="jdbc:sqlserver://localhost:1433; DatabaseName = BookShop";	
		String strSql="INSERT INTO Customers(c_Name,c_Password,c_Phone) VALUES('"+name+"','"+password+"','"+phone+"')";	
		String selectSql="select c_Name from Customers where c_Name='"+name+"'";
		int x = 0;
		for (int i = 0; i < phone.length(); i++) {
			if (Character.isDigit(phone.charAt(i))) {
				x++;
			}			
		}
		if (x == phone.length()) {
			if (password2.equals(password)) {
				try {
					Connection conn = DriverManager.getConnection(url,"a","123");
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(selectSql);
					if(!rs.next())  {    
						stmt.executeUpdate(strSql);
						request.setAttribute("Register", "");
						stmt.close();
						conn.close();	
					}else {		
						request.setAttribute("checkName", "");
						//0.8秒后跳转到指定URL 
						response.setHeader("refresh", "0.8;url=http://localhost:8080/BookShop/Project/jsp/login.jsp#toregister"); 	          
					}
					RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/login.jsp");
					dispatcher.forward(request, response);							
				} catch (Exception e) {
					e.printStackTrace();
				}					
			}
		} else {
			HttpSession hs=request.getSession(true);
			hs.setAttribute("checkPhone", "checkPhone");
			//告诉浏览器要去访问哪个URL 
			response.setHeader("location", "http://localhost:8080/BookShop/Project/jsp/login.jsp#toregister"); 	          
	        //请求重定向  
	        response.sendRedirect("http://localhost:8080/BookShop/Project/jsp/login.jsp#toregister");
	        return;
		}
		response.setHeader("location", "http://localhost:8080/BookShop/Project/jsp/login.jsp#toregister"); 	            
        response.sendRedirect("http://localhost:8080/BookShop/Project/jsp/login.jsp#toregister");
		}
	public void destroy() {
	}
}
