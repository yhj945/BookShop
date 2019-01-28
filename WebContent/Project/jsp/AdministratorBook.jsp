<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>410书屋-商品管理</title>
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
var a1=document.getElementById("selectid2");
//select标签获取的值其实是一个数组--a.options[]; 然后，选定项的下标是--a.selectedIndex
var b1=a1.options[a1.selectedIndex].value;
document.searchform1.s1.focus();
var c1=document.searchform1.s1.value;
document.getElementById("classid3").value=b1;
document.getElementById("classid4").value=c1;
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
		<td class="t1" width="20%"><a href="<%=request.getContextPath()%>/Project/jsp/AdministratorBook.jsp"><div class="d4" style="color:#f00">商品信息</div></a></td>
		<td class="t1" width="20%"><a href="<%=request.getContextPath()%>/Project/jsp/AdministratorOrders.jsp"><div class="h4" style="color:#000">订单情况</div></a></td>
		<td class="t1" width="20%"><a href="<%=request.getContextPath()%>/Project/jsp/AdministratorCustomers.jsp"><div class="h4" style="color:#000">用户信息</div></a></td>
		<td class="t1" width="20%"></td>
		<td class="t1" width="20%">		
			<form action="<%=request.getContextPath()%>/administratorBook"" method="post" name="searchform1" >
			<input type="hidden" id="classid3" name="classid3"/>
			<input type="hidden" id="classid4" name="classid4"/>
			<select name="select0" id="selectid2" style="height:25px;">
				<option value="g_ID">商品号</option>
				<option value="g_Name">书名</option>
				<input type="text" name="s1" size="25px" style="height:19px;"/>
				<input onclick="x3()" type="submit" value="搜索" style="height:25px;"/>							
			</select>
			</form>
			</td>
		</tr>
	</table>
	<table id="table1" width=90% border=0 cellpadding="15" cellspacing="0" style="text-align:center;">
		<tr height=60px align=center bgcolor="f8fbfb">
			<td width=25%><div class="h3">商品信息</div></td>
			<td width=20%><div class="h3">商品号</div></td>
			<td width=10%><div class="h3">类别号</div></td>
			<td width=15%><div class="h3">单价</div></td>
			<td width=12%><div class="h3">库存</div></td>
			<td width=18%><div class="h3">操作</div></td>
		</tr>
<%
java.sql.Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName = BookShop","a","123");
String select0 =(String)session.getAttribute("select0");
String input0 =(String)session.getAttribute("input0");
String sql = null;
if(select0 != null && input0.length() > 0){
if("g_Name".equals(select0)){
	sql="select * from Goods where g_Name like '%"+input0+"%'";
}else if("g_ID".equals(select0)){
	sql="select * from Goods where g_ID = '"+input0+"'";
}
Statement statemenet = (Statement) conn.createStatement();			
ResultSet rs1 = statemenet.executeQuery(sql);
while(rs1.next()){
%>
   		<tr  bgcolor="ebf7f7" name="changecolor">
	  		<td class="t2">
	  			<img src="<%=request.getContextPath()%><%=rs1.getString("g_Image")%>" height=150px><%=rs1.getString("g_Name")%>
	  		</td>
	    	<td class="t2">
	    		<%=rs1.getString("g_id")%>  
	   		</td>
	   		<td class="t2">
	   			<%=rs1.getString("t_id")%> 
	   		</td>
	   		<td class="t2">
	   		<form action="<%=request.getContextPath()%>/updategoods?update=<%=rs1.getString("g_ID")%>" method="post" target="rfFrame">
	   			<input name="<%=rs1.getString("g_ID")%>" type="text" style="width:60px;height:30px" value="<%=rs1.getString("g_Price")%> "/>
	   		</td>
	   		<td class="t2">
	   			<input name="<%=rs1.getString("g_ID")%><%=rs1.getString("g_ID")%>" type="text" style="width:60px;height:30px" value="<%=rs1.getString("g_Number")%> "/>
	   		</td>
	   		<td class="t2">	
	   		<input class="btn" type="submit" onclick="x4()" value="确认修改" style="font-size:18px;">
	   		</form>
	   		</td>
		</tr>                  
<%
} rs1.close(); 
}
%>
	</table>
	</center>
	<iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>
</body>
</html>