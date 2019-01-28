package com.orders;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/SearchGoods")
public class SearchGoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SearchGoods() {
        super();
    }
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	public void destroy() {		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String book=request.getParameter("book").trim();
		if ("1".equals(book)) {
			setAttribute("select1", "input1", request);
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/buybook1.jsp");
			dispatcher.forward(request, response);
		}else if ("2".equals(book)) {
			setAttribute("select2", "input2", request);
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/buybook2.jsp");
			dispatcher.forward(request, response);
		}else if ("3".equals(book)) {
			setAttribute("select3", "input3", request);
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/buybook3.jsp");
			dispatcher.forward(request, response);
		}else if ("4".equals(book)) {	
			setAttribute("select4", "input4", request);
			RequestDispatcher dispatcher=request.getRequestDispatcher("/Project/jsp/buybook4.jsp");
			dispatcher.forward(request, response);
		}
	}
	public void setAttribute(String select, String input, HttpServletRequest request){
		String selectstr=request.getParameter(select).trim();
		String inputstr=request.getParameter(input).trim();
		HttpSession hs1=request.getSession(true);
		if ("g_Price".equals(selectstr) && inputstr.length() > 0) {
			int x = 0;
			for (int i = 0; i < inputstr.length(); i++) {
				if (Character.isDigit(inputstr.charAt(i))) {
					x++;
				}			
			}
			if (x == inputstr.length()) {
				hs1.setAttribute(select, selectstr);
				hs1.setAttribute(input, inputstr);
			} else {
				hs1.setAttribute(select, selectstr);
				hs1.setAttribute(input, "");
			}
		} else {
			hs1.setAttribute(select, selectstr);
			hs1.setAttribute(input, inputstr);
		}
		
	}
}
