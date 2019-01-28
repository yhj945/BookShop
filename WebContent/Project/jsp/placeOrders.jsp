<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>410书屋-地址信息</title>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base
href="<%=basePath%>">
<style type="text/css">
<!--
.STYLE5 {
	text-shadow: 6px 6px 6px #FF0000;
	font-size: 60px;
	color: #FF0000;
}
-->
.f2{
	margin-top:5px;
}
.label{
display:none;
}
<!--
a{text-decoration: none;}    		//这个是设置a标签的默认状态去除下划线
a:visited{text-decoration: none;}    //这个是设置a标签的访问过后的状态去除下划线a:hover
 {text-decoration: none;}    		//这个是设置a标签的鼠标覆盖状态去除下划线
a:active{text-decoration:none;}    //这个是设置a标签的活跃状态去除下划线
-->
</style>
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
<script type="text/javascript">
var result_checkPhone = '<%=session.getAttribute("checkPhone")%>'
var result_Phonenum = '<%=session.getAttribute("Phonenum")%>'
if(result_checkPhone == "checkPhone"){
alert("电话号码的格式只能为数字！");
}
if(result_Phonenum == "Phonenum"){
alert("请输入7~12位的电话号码！");
}
</script>
<% 
	if (session.getAttribute("checkPhone") != null) {
		session.removeAttribute("checkPhone");
	 }
	 if (session.getAttribute("Phonenum") != null) {
		session.removeAttribute("Phonenum");
	 }
%>
<link rel="stylesheet" type="text/css" href="../css/radio.css" />
<link rel="stylesheet" type="text/css" href="../css/book.css" />
<script type="text/javascript" src="../js/js_placeOrders.js" charset="utf-8"></script> 
</head>
<body background="<%=request.getContextPath()%>/images/placeOrdersbg.jpg">

<table width="100%" height="216" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<td width="35"></td>
    <td width="45"><a href="<%=request.getContextPath()%>/Project/jsp/orders.jsp">
    <div class="x1"><jsp:include page="bookhouse.jsp"/></div></a>
    </td>
    <td width="20"></td>
  </tr>
</table>
<div class="f">
<form action="<%=request.getContextPath()%>/placeOrders" name="placeOrders" method="post" autocomplete="on">      
    <p> 
    	<label for="odaddress"><B>详细收货地址：</B></label>
	</p>
	<p>
		<table>
		<tr>
			<td><textarea id="odaddress" name="odaddress" required="required" type="text" style="overflow-x:hidden;overflow-y:hidden;width:545px;height:60px;" placeholder="请输入详细收货地址"></textarea></td>
			<td><font color="red">*</font><font style="font-size:14px;color:#666666">建议您如实填写详细收货地址。例如街道名称，门牌号码，楼层和房间号等信息</font></td>
		</tr>	
		</table>
	</p>

	<p> 
    	<label for="odname"><B>收货人姓名：</B></label>
	</p>
	<p> 
		<table>
		<tr>
			<td>
				<input id="odname" name="odname" required="required" type="text" style="width:545px;height:30px" placeholder="请输入收货人的姓名"/>
			</td>
			<td>
				<font color="red">*</font><font style="font-size:14px;color:#666666">长度不超过25个字符</font>
			</td>
		</tr>	
		</table>
	</p>
	<p> 
    	<label for="odphone"><B>电话号码：</B></label>
	</p>
	<p> 
		<input id="odphone" name="odphone" required="required" type="text" style="width:545px;height:30px" placeholder="请输入收货人的联系电话"/>
		<font color="red">*</font><font style="font-size:14px;color:#666666">确保该电话方便联系，以接收物流信息</font>
	</p>
	<p> 
    	<label for="code"><B>邮政编码：</B></label>
	</p>
	<p> 
		<input id="code" name="code" required="required" type="text" style="width:545px;height:30px" placeholder="请输入邮政编码"/>
		<font color="red">*</font><font style="font-size:14px;color:#666666">如果您不清楚邮政编码，请填写000000</font>
	</p>
	<p> 
    	<label><B>送货方式：</B></label>
	</p>
	<p>
		<input class="rdo" id="send1" type="radio" name="send" value="邮寄快递"  checked="checked"/> 
	  	<label for="send1">邮寄快递</label>&nbsp;&nbsp;
		<input class="rdo" id="send2" type="radio" name="send" value="送货上门" />
	  	<label for="send2">送货上门</label>
	</p><br>
	<p> 
		<label><B>付款方式：</B></label>
	</p>
	<p>
		<input class="rdo" id="pay1" type="radio" name="pay" value="货到付款"  checked="checked"/> 
	  	<label for="pay1">货到付款</label>&nbsp;&nbsp;
		<input class="rdo" id="pay2" type="radio" name="pay" value="微信付款" />
	  	<label for="pay2">微信付款</label>&nbsp;&nbsp;
		<input class="rdo" id="pay3" type="radio" name="pay" value="支付宝付款" /> 
	  	<label for="pay3">支付宝付款</label>&nbsp;&nbsp;
		<input class="rdo" id="pay4" type="radio" name="pay" value="银联付款" />
	  	<label for="pay4">银联付款</label>
	</p>
	<p>
	<form action="<%=request.getContextPath()%>/placeOrders" method="post">
		<table width="80%" border="0" cellspacing="0" cellpadding="0">
     		<tr>
        		<td width="70%" height="67">       			
        		</td>
        		<td width="18%">
        			<B>订单总额：</B>
        			<label style="color:red;"><%=request.getParameter("dsum")%>&nbsp;元</label>
        			<input name="dsum" value="<%=request.getParameter("dsum")%>" class="label" />
				</td>
        		<td width="12%"><label for="confirm"></label>
          		<input class="mybtn" id="confirm" type="submit" name="confirm" onclick="checkOrders()" value="确认付款" /></td>
      		</tr>
    	</table>
    </form>
	</p>
</form>
</div>
</body>
</html>