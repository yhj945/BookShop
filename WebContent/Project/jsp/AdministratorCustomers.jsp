<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>410书屋-客户信息</title>
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
			<td class="t1" width="20%"><a href="<%=request.getContextPath()%>/Project/jsp/AdministratorOrders.jsp"><div class="h4" style="color:#000">订单情况</div></a></td>
			<td class="t1" width="20%"><a href="<%=request.getContextPath()%>/Project/jsp/AdministratorCustomers.jsp"><div class="h4" style="color:#f00">用户信息</div></a></td>
			<td class="t1" width="20%"></td>	
			<td class="t1" width="20%">			
			
			</td>		
		</tr>
		</table>
		<table id="table1" width=90% border=0 cellpadding="15" cellspacing="0" style="text-align:center;">
		<tr height=60px align=center bgcolor="f8fbfb">
			<td width=15%><div class="h3">用户名</div></td>
			<td width=15%><div class="h3">用户密码</div></td>
			<td width=15%><div class="h3">联系电话</div></td>
			<td width=25%><div class="h3">注册时间</div></td>
			<td width=15%><div class="h3">已买商品</div></td>
			<td width=15%><div class="h3">商品总额</div></td>
		</tr>	
<%
java.sql.Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName = BookShop","a","123");
String sql="select Customers.c_Name,c_Password,c_Phone,c_Regidate,numsum=SUM(o_Number),osum=SUM(o_Sum) "+
			"from Customers left outer join Orders on Customers.c_Name=Orders.c_Name group by Customers.c_Name,c_Password,c_Phone,c_Regidate";
Statement statemenet = (Statement) conn.createStatement();
ResultSet rs1 = statemenet.executeQuery(sql);
while(rs1.next()){
String num = rs1.getString("numsum");
String sum = rs1.getString("osum");
String numsum = null;
String osum = null;
if(num != null){
numsum = rs1.getString("numsum");
}else{
numsum = "0";
}
if(sum != null){
osum = rs1.getString("osum");
}else{
osum = "0";
}
%>
   		<tr bgcolor="ebf7f7" name="changecolor">
   			<td class="t2">
	    		<%=rs1.getString("c_Name")%>  
	   		</td>
	   		<td class="t2">
	  			<%=rs1.getString("c_Password")%>
	  		</td>
	  		<td class="t2">
	  			<%=rs1.getString("c_Phone")%>
	  		</td>
	    	<td class="t2">
	    		<%=rs1.getString("c_Regidate")%>  
	   		</td>
	   		<td class="t2">
	   			<%=numsum%>&nbsp;件
	   		</td>
	   		<td class="t2">
	   			<%=osum%>&nbsp;元 
	   		</td>
		</tr>                  
<%
} rs1.close();
%>
	</table>
	</center>
</body>
</html>