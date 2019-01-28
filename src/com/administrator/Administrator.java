package com.administrator;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Administrators")
public class Administrator extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Administrator() {
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
	public void destroy() {
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aname=request.getParameter("adminame").trim();
		String apassword=request.getParameter("admipassword").trim();
		String url="jdbc:sqlserver://localhost:1433; DatabaseName = BookShop";
		String sql = "select * from Administrator where a_Name='"+aname+"' and a_Password='"+apassword+"'";
		try {
			Connection conn = DriverManager.getConnection(url,"a","123");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()){
					if (aname.equals("administrator")) {
						HttpSession hs=request.getSession(true);
						hs.setAttribute("aloginname", aname);
						response.setHeader("refresh", "0.8;url=http://localhost:8080/BookShop/Project/jsp/AdministratorBook.jsp"); //…Ë÷√0.8√Î÷”Ã¯◊™  		
						RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/suceess_administrator.jsp");
						dispatcher.forward(request, response);
					}else{
						request.setAttribute("aLogin", "");
						RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/AdministratorLogin.jsp");
						dispatcher.forward(request, response);
					} 								        	         
				} else {
					request.setAttribute("aLogin", "");
					RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/AdministratorLogin.jsp");
					dispatcher.forward(request, response);
				}
			stmt.close();
			conn.close();
		} catch (SQLException e) {	
			e.printStackTrace();
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/AdministratorLogin.jsp");
			dispatcher.forward(request, response);
		}			
	}	
}
