<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>410书屋-订单管理</title>
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
<script type="text/javascript">
var username = "<%=(String)session.getAttribute("aloginname")%>"
function x1(){
	if(username != "administrator"){
		alert("还没登录管理系统，去登录?");
		window.open("<%=request.getContextPath()%>/Project/jsp/AdministratorLogin.jsp","_blank"); 
		return false;	
	}		
}	
window.onload=function(){
x1();
}	
</script>
<script type="text/javascript">
var username = "<%=(String)session.getAttribute("aloginname")%>"
function x2(){
	if(username == "administrator"){
	window.open("<%=request.getContextPath()%>/Project/jsp/AdministratorLogin.jsp","_blank"); 
	return false;
	}		
}	
</script>
<script type="text/javascript">
function x3(){
//从document对象中，获取select标签
var a=document.getElementById("selectid");
//select标签获取的值其实是一个数组--a.options[]; 然后，选定项的下标是--a.selectedIndex
var b=a.options[a.selectedIndex].value;
document.searchform.s.focus();
var c=document.searchform.s.value;
document.getElementById("classid1").value=b;
document.getElementById("classid2").value=c;
}
</script>
<script type="text/javascript">
var username = "<%=(String)session.getAttribute("aloginname")%>"
function x4(){
	if(username == "administrator"){
		$(function(){
        	$("#disappare").show().delay(800).hide(300);
    	})	
	}
}		
</script>
<style type="text/css">
<!--
a{text-decoration: none;}    		//这个是设置a标签的默认状态去除下划线
a:visited{text-decoration: none;}    //这个是设置a标签的访问过后的状态去除下划线a:hover
 {text-decoration: none;}    		//这个是设置a标签的鼠标覆盖状态去除下划线
a:active{text-decoration:none;}    //这个是设置a标签的活跃状态去除下划线
-->
</style>
<style type="text/css">
.btn{
font-size:16px;
background-color:#ebf7f7;
}
.btn:hover{
background-color:#fac081;
}
</style>
<script src="../js/jquery-2.0.3.min.js"></script>
<script src="../js/changecolor.js"></script> 
</head>
<body>
<div id="disappare" style="display:none;">
<p>修改成功！</p>
</div>
	<table width="100%">
		<tr>
			<td width="75%">
			<div class="xx1"><jsp:include page="bookhouse.jsp"/></div>
			<div class="h1">管理系统</div>
			</td>
			<td width="10%">
			<div class="d">
			<span class="d">管理员：<%=session.getAttribute("aloginname")%></span>
			</div>	
 			</td>
			<td width="5%">
			<div class="d2">
 			<input class="d2" type="submit" onclick="x2()" value="退出登录" />
 			</div>
			</td>
			<td width="10%"></td>		
		</tr>
	</table>	
	<center>
	<table id="table1" width=90% border=0 cellpadding="15" cellspacing="0" style="text-align:center;">
		<tr height=50px bgcolor="f8fbfb">	
			<td class="t1" width="20%"><a href="<%=request.getContextPath()%>/Project/jsp/AdministratorBook.jsp"><div class="d4" style="color:#000">商品信息</div></a></td>
			<td class="t1" width="20%"><a href="<%=request.getContextPath()%>/Project/jsp/AdministratorOrders.jsp"><div class="h4" style="color:#f00">订单情况</div></a></td>
			<td class="t1" width="20%"><a href="<%=request.getContextPath()%>/Project/jsp/AdministratorCustomers.jsp"><div class="h4" style="color:#000">用户信息</div></a></td>
			<td class="t1" width="20%"></td>	
			<td class="t1" width="20%">			
			<form action="<%=request.getContextPath()%>/administratorOrders"" method="post" name="searchform" >
			<input type="hidden" id="classid1" name="classid1"/>
			<input type="hidden" id="classid2" name="classid2"/>
			<select name="select" id="selectid" style="height:25px;">
				<option value="o_ID">订单号</option>
				<option value="c_Name">用户名</option>
				<input type="text" name="s" size="25" style="height:19px;"/>
				<input onclick="x3()" type="submit" value="搜索" style="height:25px;"/>							
			</select>
			</form>
			</td>		
		</tr>
		</table>
		<table id="table1" width=90% border=0 cellpadding="15" cellspacing="0" style="text-align:center;">
		<tr height=60px align=center bgcolor="f8fbfb">
			<td width=12%><div class="h3">订单号</div></td>
			<td width=12%><div class="h3">商品信息</div></td>
			<td width=10%><div class="h3">数量</div></td>
			<td width=8%><div class="h3">总价</div></td>
			<td width=22%><div class="h3">收货地址</div></td>
			<td width=11%><div class="h3">收货人</div></td>
			<td width=8%><div class="h3">送货方式</div></td>
			<td width=8%><div class="h3">付款方式</div></td>
			<td width=9%><div class="h3">操作</div></td>
		</tr>	
<%
java.sql.Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName = BookShop","a","123");
String select =(String)session.getAttribute("select");
String input =(String)session.getAttribute("input");
if(select != null && input != null){
String sql="select Customers.c_Name,Orders.o_ID,Goods.g_Image,Goods.g_Name,o_Number,o_Sum,o_Date,d_Address,d_TrueName,d_Phone,d_SendMode,d_PayMode " +
				"from Customers join Orders on Customers.c_Name=Orders.c_Name join Goods on Orders.g_ID=Goods.g_ID join DeliveryAddress " +
				"on Orders.o_ID=DeliveryAddress.o_ID where Orders."+select+" = '"+input+"'";
String sql2="select Customers.c_Name,Orders.o_ID,g_Image,g_Name,o_Number,o_Sum,o_Status from Customers join Orders on Customers.c_Name=Orders.c_Name "+
				"where o_Status='未付款' and Orders."+select+" = '"+input+"'";
Statement statemenet = (Statement) conn.createStatement();
ResultSet rs1 = statemenet.executeQuery(sql);
Statement statemenet2 = (Statement) conn.createStatement();						
ResultSet rs2 = statemenet2.executeQuery(sql2);
while(rs1.next()){
%>
   		<tr bgcolor="ebf7f7" name="changecolor">
   			<td class="t2">
	    		<%=rs1.getString("o_ID")%>  
	   		</td>
	  		<td class="t2">
	  			<img src="<%=request.getContextPath()%><%=rs1.getString("g_Image")%>" width="100px" height=110px><br>
	  			<%=rs1.getString("g_Name")%>
	  		</td>
	    	<td class="t2">
	    		<%=rs1.getString("o_Number")%>  
	   		</td>
	   		<td class="t2">
	   			<%=rs1.getString("o_Sum")%>元
	   		</td>
	   		<td class="t2">
	   			<%=rs1.getString("d_Address")%> 
	   		</td>
	   		<td class="t2">
	   			<%=rs1.getString("d_TrueName")%> 
	   		</td>
	   		<td class="t2">
	   			<%=rs1.getString("d_SendMode")%> 
	   		</td>
	   		<td class="t2">
	   			<%=rs1.getString("d_PayMode")%> 
	   		</td>	   		
	   		<td class="t2">	
	   		<label>交易成功<br><%=rs1.getString("o_Date")%></label>
	   		</form>
	   		</td>
		</tr>                  
<%
} rs1.close();
%>
<%
while(rs2.next()){
%>
   		<tr bgcolor="ebf7f7" name="changecolor">
   			<td class="t2">
	    		<%=rs2.getString("o_ID")%>  
	   		</td>
	  		<td class="t2">
	  			<img src="<%=request.getContextPath()%><%=rs2.getString("g_Image")%>" width="100px" height=110px><br>
	  			<%=rs2.getString("g_Name")%>
	  		</td>
	    	<td class="t2">
	    		<%=rs2.getString("o_Number")%>  
	   		</td>
	   		<td class="t2">
	   		<form action="<%=request.getContextPath()%>/updateOrders?update=<%=rs2.getString("o_ID")%>" method="post" target="rfFrame">
	   			<input name="<%=rs2.getString("o_ID")%>" type="text" style="width:60px;height:30px" value="<%=rs2.getString("o_Sum")%>"/>元
	   		</td>
	   		<td class="t2">
	   			<label style="color:red;">未填写</label> 
	   		</td>
	   		<td class="t2">
	   			<label style="color:red;">未填写</label> 
	   		</td>
	   		<td class="t2">
	   			<label style="color:red;">未填写</label>
	   		</td>
	   		<td class="t2" style="color:red;">
	   			<%=rs2.getString("o_Status")%> 
	   		</td>	   		
	   		<td class="t2">	
	   			<input class="btn" type="submit" onclick="x4()" value="确认修改" />
	   		</form>
	   		</td>
		</tr> 
<%
} rs2.close();
}
%>
<iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>
	</table>
	</center>
</body>
</html>