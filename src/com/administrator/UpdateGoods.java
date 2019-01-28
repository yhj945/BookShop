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
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateGoods")
public class UpdateGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateGoods() {
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
		String gid = request.getParameter("update");
		String gprice = request.getParameter(gid);
		String gnumber = request.getParameter(gid+gid);
		try {
			Connection conn = DriverManager.getConnection(url,"a","123");
			CallableStatement cs = null;
			cs = conn.prepareCall("{call up_altergoods(?,?,?)}");
			cs.setString(1,gid);
			cs.setString(2,gprice);
			cs.setString(3,gnumber);
			cs.execute();
			cs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/AdministratorBook.jsp");
		dispatcher.forward(request, response);
	}
	public void destroy() {
	}
}
