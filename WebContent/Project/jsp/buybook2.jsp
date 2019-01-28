<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>410书屋-言情类</title>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base
href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="../css/book.css" />
<script src="../js/jquery-2.0.3.min.js"></script>
<script src="../js/changecolor.js"></script>
<script type="text/javascript">
var qiut = "<%=(String)session.getAttribute("loginname")%>"
var suceess = "<%=(String)session.getAttribute("suceess")%>"
function x1(){
	if(suceess != "issuceess"){
		var i=window.confirm("还没登录，去登录?");
		if(i!=0){
			window.open("<%=request.getContextPath()%>/Project/jsp/login.jsp","_blank"); 
			return false;
		}		
	}else if(qiut == "isquit"){
		var i=window.confirm("还没登录，去登录?");
		if(i!=0){
			window.open("<%=request.getContextPath()%>/Project/jsp/login.jsp","_blank"); 
			return false;
		}		
	}else{
		$(function(){
        	$("#disappare").show().delay(800).hide(300);
    	})
	}
	return true;	
}
function x2(){
	if(suceess != "issuceess"){
		var i=window.confirm("还没登录，去登录?");
		if(i!=0){
			window.open("<%=request.getContextPath()%>/Project/jsp/login.jsp","_blank"); 
			return false;
		}		
	}else if(qiut == "isquit"){
		var i=window.confirm("还没登录，去登录?");
		if(i!=0){
			window.open("<%=request.getContextPath()%>/Project/jsp/login.jsp","_blank"); 
			return false;
		}		
	}
	return true;	
}
</script>
</head>
<body>
<div id="disappare" style="display:none;">
<p>加入购物车成功！</p>
</div><a href="<%=request.getContextPath()%>/Project/jsp/buybook1.jsp">
<div class="x1"><jsp:include page="bookhouse.jsp"/></div></a>
<center>
	<table width=80% border=0  cellpadding="15" cellspacing="0" style="text-align:center;">
		<tr height=50px bgcolor="00ccff">
			<td name=tdcolor class="t1" width="14%"><div class="h">
			<a href="<%=request.getContextPath()%>/Project/jsp/buybook1.jsp">科学类&nbsp;</a>
			</div></td>
			<td name=tdcolor class="t1" width="14%" bgcolor="#00b4ff"><div class="h">
			<a href="<%=request.getContextPath()%>/Project/jsp/buybook2.jsp" style="color:#FFF;">言情类&nbsp;</a>
			</div></td>
			<td name=tdcolor class="t1" width="14%"><div class="h">
			<a href="<%=request.getContextPath()%>/Project/jsp/buybook3.jsp">历史类&nbsp;</a>
			</div></td>
			<td name=tdcolor class="t1" width="14%"><div class="h">
			<a href="<%=request.getContextPath()%>/Project/jsp/buybook4.jsp">玄幻类&nbsp;</a>
			</div></td>
			<td class="t1" width="30%">		
			<form action="<%=request.getContextPath()%>/searchGoods?book=2" method="post" name="searchbook2" >
			<select name="select2" id="selectid2" style="height:25px">
				<option value="g_Price">价格</option>
				<option value="g_Name">书名</option>
				<input type="text" name="input2" size="25" style="height:19px;font-size:14px"/>
				<input type="submit" value="搜索" style="height:25px"/>							
			</select>
			</form>
			</td>
			<td class="t1" width="14%">
			<form action="<%=request.getContextPath()%>/shoppingcart" method="post">
			<input class="btn" type="submit" onclick="x2()" style="font-size:21px;" value="进入查看购物车"/>
			</form>
			</td>
		</tr>
		</table>
		<table width=80% border=0 cellpadding="15" cellspacing="0" style="text-align:center;">
		<tr height=60px align=center bgcolor="ccf2f6">
			<td width=20%>样图</td>
			<td width=30%>商品简介</td>
			<td width=20%>促销信息</td>
			<td width=15%>数量</td>
			<td width=15%>操作</td>
		</tr>
<%
java.sql.Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName = BookShop","a","123");
String select2 =(String)session.getAttribute("select2");
String input2 =(String)session.getAttribute("input2");
String sql = null;
if(select2 != null && input2.length() > 0){
	if("g_Name".equals(select2)){
		sql="select * from Goods where t_ID = '02' and g_Name like '"+'%'+input2+'%'+"'";
	}else{
		sql="select top 5 * FROM Goods where t_ID='02' order by(ABS(g_Price-"+input2+"))";
	}
}else {
	sql="select * from Goods where t_ID = '02'";
}
Statement statemenet = (Statement) conn.createStatement();			
ResultSet rs1 = statemenet.executeQuery(sql);
while(rs1.next()){
%>
   		<tr height=250px bgcolor="ebf7f7" name="changecolor">
   			<td class="t2">
	    		<img src="<%=request.getContextPath()%><%=rs1.getString("g_Image")%>" ><br>
	  			<span class="price">￥<%=rs1.getString("g_Price")%> </span> 
	   		</td>
	  		<td class="t2">
	  			<div class="h2"><%=rs1.getString("g_Introduction")%>"
	  			</div>
	  		</td>
	    	<td class="t2">
	    		<div class="h3"><%=rs1.getString("g_Promotion")%> </div> 
	   		</td>
	   		<td class="t2">
	   		<form action="<%=request.getContextPath()%>/insertOrders?resPath=<%=rs1.getString("g_ID")%>" method="post" target="rfFrame">
	   			<input name="<%=rs1.getString("g_ID")%>" type="text" style="width:40px;height:30px" value="1"/>
	   		</td>
	   		<td class="t2">
	   			<input class="btn" type="submit" value="加入购物车" onclick="x1()" style="font-size:20px;"/>
	   		</td>
	   		</form>
	   		</td>
		</tr>                  
<%
} rs1.close();
%>
	</table>
</center>
<iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>
</body>
</html>