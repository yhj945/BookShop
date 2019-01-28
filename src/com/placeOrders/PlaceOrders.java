package com.placeOrders;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PlaceOrders")
public class PlaceOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    public PlaceOrders() {
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
		HttpSession hs=request.getSession(true);
		String suceess = (String) hs.getAttribute("suceess");
		String username = (String) hs.getAttribute("loginname");
		String address=request.getParameter("odaddress").trim();
		String truename=request.getParameter("odname").trim();
		String phone=request.getParameter("odphone").trim();		
		String code=request.getParameter("code").trim();
		String send=request.getParameter("send").trim();
		String pay=request.getParameter("pay").trim();		
		String url="jdbc:sqlserver://localhost:1433; DatabaseName = BookShop";
		String sql="select o_ID from Orders where o_Status='未付款' and c_Name = '"+username+"'";		
		if (!"isquit".equals(username)) {
			if ("issuceess".equals(suceess)) {
				if (phone.length() >= 7 && phone.length() <= 12) {
					int x = 0;
					for (int i = 0; i < phone.length(); i++) {
						if (Character.isDigit(phone.charAt(i))) {
							x++;
						}			
					}
					if (x == phone.length()) {
						try {
							Connection conn = DriverManager.getConnection(url,"a","123");
							Statement stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery(sql);  
					        while(rs.next())  {  //是否有下一行数据  
					        	String oid = rs.getString("o_ID");
								CallableStatement cs = null;
								cs = conn.prepareCall("{call up_insertDeaddress(?,?,?,?,?,?,?)}");
								cs.setString(1,oid);
								cs.setString(2,address);					
								cs.setString(3,truename);
								cs.setString(4,phone);
								cs.setString(5,code);
								cs.setString(6,send);
								cs.setString(7,pay);			
								cs.execute();
								cs.close();
								RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/end.jsp");
								dispatcher.forward(request, response);
					        }
					        stmt.close();
							conn.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						hs.setAttribute("checkPhone", "checkPhone");
						RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/placeOrders.jsp");
						dispatcher.forward(request, response);
					}
				} else {
					hs.setAttribute("Phonenum", "Phonenum");
					RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/placeOrders.jsp");
					dispatcher.forward(request, response);
				}				
			}else{
				RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/placeOrders.jsp");
				dispatcher.forward(request, response);
			}
		}else{
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/placeOrders.jsp");
			dispatcher.forward(request, response);
		}		
	}	
	public void destroy() {
	}
}
