<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>410书屋-我的订单</title>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base
href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="../css/radio.css" />
<link rel="stylesheet" type="text/css" href="../css/orders.css" />
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
	}	
	if(qiut == "isquit"){
		var i=window.confirm("还没登录，去登录?");
		if(i!=0){
			window.open("<%=request.getContextPath()%>/Project/jsp/login.jsp","_blank"); 
			return false;
		}		
	}
	return true;	
}
window.onload=function(){
x1();
}
</script>
<script language=javascript>
function checkSum(){
	if(dSum2="0"){
		var i=window.confirm("还没东西哦，去逛逛?");
		if(i!=0){
			window.open("<%=request.getContextPath()%>/Project/jsp/buybook1.jsp","_blank"); 
			return false;
		}		
	}	
	return true;
}
</script>
</head>
<body>
<table width="100%" border=0 cellpadding="0" cellspacing="0">
<td width=70%><a href="<%=request.getContextPath()%>/Project/jsp/buybook1.jsp">
	<div class="h"><jsp:include page="bookhouse.jsp"/></div></a>
</td>
<td width="15%">
	<span class="xx3">用户：&nbsp;<%=session.getAttribute("loginname")%></span>
</td>
<td width="15%">
	<form action="<%=request.getContextPath()%>/quit" name="quit" method="post">
	<div class="xx4">
	<input class="xx4" type="submit" value="退出登录" />
	</div>
	</form>
</td>
</table>
	<center>
	<table id="table1" width=80% border=0 cellpadding="15" cellspacing="0" style="text-align:center;">
		<tr height=50px bgcolor="#00ccff">
			<td colspan=3 class="t1" name="tdcolor"><div class="h4">
			<a href="<%=request.getContextPath()%>/Project/jsp/orders.jsp">我的购物车</a>
			</div></td>
			<td colspan=4 class="t1" name="tdcolor" bgcolor="00b4ff"><div class="h4">
			<a href="<%=request.getContextPath()%>/Project/jsp/orders2.jsp" style="color:#FFF">我的订单</a>
			</div></td>
		</tr>
		<tr height=60px align=center bgcolor="dff5f7">
			<td width=25%><div class="h3">商品信息</div></td>
			<td width=13%><div class="h3">单价</div></td>
			<td width=12%><div class="h3">数量</div></td>
			<td width=15%><div class="h3">金额</div></td>
			<td width=20%><div class="h3">订单时间</div></td>
			<td width=15%><div class="h3">订单状态</div></td>
		</tr>
<%
java.sql.Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName = BookShop","a","123");
HttpSession hs=request.getSession(true);
String username = (String)hs.getAttribute("loginname");
String sql="SELECT * from Orders where c_Name='"+username+"' and o_Status='已付款'";
Statement statemenet = (Statement) conn.createStatement();				
ResultSet rs1 = statemenet.executeQuery(sql);
while(rs1.next()){
%>
   		<tr bgcolor="ebf7f7" name=changecolor>
	  		<td> 
	  			<img src="<%=request.getContextPath()%><%=rs1.getString("g_Image")%>" height=150px><%=rs1.getString("g_Name")%>
	  		</td>
	    	<td>
	    		<%=rs1.getString("g_Price")%>  
	   		</td>
	   		<td>
	   			<%=rs1.getString("o_Number")%> 
	   		</td>
	   		<td>
	   			<%=rs1.getString("o_Sum")%> 
	   		</td>
	   		<td>
	   			<%=rs1.getString("o_Date")%>
	   		</td>
	   		<td>
	   		<label>交易成功</label>
	   		</td>   		
		</tr> 
<%
String oid = rs1.getString("o_ID");
String sql2="select * from DeliveryAddress where o_ID = '"+oid+"'";
Statement statemenet2 = (Statement) conn.createStatement();				
ResultSet rs2 = statemenet2.executeQuery(sql2);
while(rs2.next()){
 %>
		<tr bgcolor="ebf7f7">
			<td class="t2"></td>
			<td class="t2" colspan="5">
			<span style="font-size:0.85vw;">
			收货地址：<%=rs2.getString("d_Address")%>&nbsp;&nbsp;
			收货人：<%=rs2.getString("d_TrueName")%>&nbsp;&nbsp;
			联系电话：<%=rs2.getString("d_Phone")%>&nbsp;&nbsp;
			邮政编码：<%=rs2.getString("d_Postcode")%>&nbsp;&nbsp;
			送货方式：<%=rs2.getString("d_SendMode")%>&nbsp;&nbsp;
			付款方式：<%=rs2.getString("d_PayMode")%></span>
			</td>
		</tr>                 
<%
} rs2.close();
} rs1.close(); 
%>
	</table>
	</center>
</body>
</html>