package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/EncodingFilter")
public class EncodingFilter implements Filter {
	private String Encoding = "UTF-8";
    public EncodingFilter() {
        
    }
public void init(FilterConfig fConfig) throws ServletException {
	String Encoding = fConfig.getInitParameter("Encoding");
	if (Encoding != null) {
	this.Encoding = Encoding;
	}
}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		if(!Encoding.equals(request.getCharacterEncoding())){
			request.setCharacterEncoding(Encoding);
			}
		response.setCharacterEncoding(Encoding);
		chain.doFilter(request, response);
	}
	public void destroy() {
	}
}