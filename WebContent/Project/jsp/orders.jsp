<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>410书屋-我的购物车</title>
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
<style type="text/css">
.btn{
font-size:20px;
background-color:#ebf7f7;
}
.btn:hover{
background-color:#fcce9c;
}
</style> 
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
			<td colspan=2 class="t1" name="tdcolor" bgcolor="00b4ff"><div class="h4">
			<a href="<%=request.getContextPath()%>/Project/jsp/orders.jsp" style="color:#FFF">我的购物车</a>
			</div></td>
			<td colspan=3 class="t1" name="tdcolor"><div class="h4">
			<a href="<%=request.getContextPath()%>/Project/jsp/orders2.jsp">我的订单</a>
			</div></td>
		</tr>
		<tr height=60px align=center bgcolor="ccf2f6">
			<td width=35%><div class="h3">商品信息</div></td>
			<td width=15%><div class="h3">单价</div></td>
			<td width=16%><div class="h3">数量</div></td>
			<td width=16%><div class="h3">金额</div></td>
			<td width=18%><div class="h3">操作</div></td>
		</tr>
<%
java.sql.Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433; DatabaseName = BookShop","a","123");
HttpSession hs=request.getSession(true);
String username = (String)hs.getAttribute("loginname");
String sql="SELECT * from Orders where c_Name='"+username+"' and o_Status='未付款'";
String sumSql = "select d_Sum=SUM(o_Sum) from Orders where c_Name='"+username+"' and o_Status='未付款'";
Statement statemenet = (Statement) conn.createStatement();
Statement statemenet2 = (Statement) conn.createStatement();
ResultSet rs = statemenet2.executeQuery(sumSql);					
ResultSet rs1 = statemenet.executeQuery(sql);
int i = 0;
while(rs1.next()){
%>
   		<tr bgcolor="ebf7f7" name=changecolor>
	  		<td class="t2">
	  			<img src="<%=request.getContextPath()%><%=rs1.getString("g_Image")%>" height=150px><%=rs1.getString("g_Name")%>
	  		</td>
	    	<td class="t2">
	    		<%=rs1.getString("g_Price")%>  
	   		</td>
	   		<td class="t2">
	   			<%=rs1.getString("o_Number")%> 
	   		</td>
	   		<td class="t2">
	   			<%=rs1.getString("o_Sum")%> 
	   		</td>
	   		<td class="t2">
	   		<form action="<%=request.getContextPath()%>/removeOrders?remove=<%=rs1.getString("o_ID")%>" method="post">
	   		<input class="btn" type="submit" value="删除" style="font-size:20px;">
	   		</form>
	   		</td>
		</tr>                  
<%
} rs1.close(); 
%>
	</table>
<%
if(rs.next() && rs.getString("d_Sum")!=null){
String dSum2=rs.getString("d_Sum");
hs.setAttribute("dsum",rs.getString("d_Sum"));
%>
	<p>
	<form action="<%=request.getContextPath()%>/Project/jsp/placeOrders.jsp" method="post">
		<table width="80%" border="0" cellspacing="0" cellpadding="0">
     		<tr>
        		<td width="70%" height="67">
        		</td>
        		<td width="18%">
        			<B>订单总额：</B>
        			<label style="color:red;"><%=dSum2%>&nbsp;元</label>
        			<input name="dsum" value="<%=dSum2%>" class="label" />
				</td>
        		<td width="12%">
          		<input class="mybtn" type="submit" name="jiesuan" value="结算" /></td>
      		</tr>
    	</table>
    </form>
	</p>
<%
} else {
String dSum2="0";
%>	
	<p>
		<table width="80%" border="0" cellspacing="0" cellpadding="0">
     		<tr>
        		<td width="70%" height="67">
        		</td>
        		<td width="18%">
        			<B>订单总额：</B>
        			<label style="color:red;"><%=dSum2%>&nbsp;元</label>
				</td>
        		<td width="12%">        		
          		<input class="mybtn" type="submit" name="jiesuan" onclick="checkSum()" value="结算" />
          		</td>
      		</tr>
    	</table>
	</p>
<%
} rs.close(); 
%>
	</center>
</body>
</html>