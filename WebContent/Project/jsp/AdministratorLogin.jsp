<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理员登录&注册</title>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base
href="<%=basePath%>">
<script type="text/javascript">
var result_Login = '<%=request.getAttribute("aLogin")%>';
if(result_Login == ""){
alert("您输入的用户名不存在，或密码不般配！");
}
</script>
<script type="text/javascript">
function check()
{
document.administrator.adminame.focus();
if(document.administrator.adminame.value=="")
{
alert("请输入用户名！");
document.administrator.adminame.focus();
return false;
}
if(document.administrator.admipassword.value == "")
{
alert("请输入密码！");
document.administrator.admipassword.focus();
return false;
}
return true;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="stylesheet" type="text/css" href="../css/orders.css" />
<style type="text/css">
<!--
.STYLE5 {
	font-size: 60px;
	color: #FF0000;
}
-->
.backNews{
	if(news.value==null){
		display:none;
	}
	else{
		display:Inline;
	}
 } 
</style>
</head>
<body>
<table width="100%" height="216" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="20%" height="101">&nbsp;</td>
    <td width="60%"><a href="<%=request.getContextPath()%>/Project/jsp/home.jsp">
    <div class="xx2"><jsp:include page="bookhouse.jsp"/></div></a>
    </td>
    <td width="20%"><span class="d3">管理员登录</span></td>
  </tr>
  <tr bgcolor="e6c592">
    <td>&nbsp;</td>
    <td><img src="<%=request.getContextPath()%>/images/loginbg.png" width="100%" height="600" longdesc="../images/loginbg.png" /></td>
    <td>
		<div class="container">
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form action="<%=request.getContextPath()%>/administrator" name="administrator" method="post" autocomplete="on">
                              <h1>登录</h1>        
                                <p> 
                                    <label for="username">你的用户名 </label>
                                    <input id="username" name="adminame" required="required" type="text" placeholder="请输入你的用户名"/>
                                </p>
                                <p> 
                                    <label for="password"> 你的密码 </label>
                                    <input id="password" name="admipassword" required="required" type="password" placeholder="请输入你的密码" /> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">保持在线</label>
								</p>
                                <p class="login button"> 
                                    <input id="checklogin" type="submit" onclick="check()" value="登录" /> 
								</p>                           
                            </form>
                      </div>
                    </div>
                </div>  
            </section>
   		 </div>
	</td>
  </tr>
</table>
        
</body>
</html>
