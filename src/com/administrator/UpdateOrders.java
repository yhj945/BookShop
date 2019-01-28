package com.administrator;

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

@WebServlet("/UpdateOrders")
public class UpdateOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateOrders() {
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
		String url="jdbc:sqlserver://localhost:1433; DatabaseName = BookShop";	
		String oid = request.getParameter("update");
		String osum = request.getParameter(oid);
		try {
			Connection conn = DriverManager.getConnection(url,"a","123");
			CallableStatement cs = null;
			cs = conn.prepareCall("{call up_alterOrders(?,?)}");
			cs.setString(1,oid);
			cs.setString(2,osum);
			cs.execute();
			cs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/AdministratorOrders.jsp");
		dispatcher.forward(request, response);
	}

}
