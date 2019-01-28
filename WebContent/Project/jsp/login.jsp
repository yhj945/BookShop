<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户登录&注册</title>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base
href="<%=basePath%>">
<script type="text/javascript">
var result_Register = '<%=request.getAttribute("Register")%>';
if(result_Register == ""){
alert("注册成功，去登录！");
}

var result_checkName = '<%=request.getAttribute("checkName")%>';
if(result_checkName == ""){
alert("用户名已存在，请重新注册！");
}

var result_checkPhone = '<%=session.getAttribute("checkPhone")%>'
if(result_checkPhone == "checkPhone"){
alert("电话号码的格式只能为数字！");
}

var result_Login = '<%=request.getAttribute("Login")%>';
if(result_Login == ""){
alert("您输入的用户名不存在，或密码不般配！");
}
</script>
<% 
	if (session.getAttribute("checkPhone") != null) {
		session.removeAttribute("checkPhone");
	 }
%>
<script type="text/javascript" src="../js/js_login.js" charset="utf-8"></script>
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
    <td width="60%"><a href="<%=request.getContextPath()%>/Project/jsp/second.jsp">
    <div class="xx2"><jsp:include page="bookhouse.jsp"/></div></a>
    </td>
    <td width="20%"></td>
  </tr>
  <tr bgcolor="e6c592">
    <td>&nbsp;</td>
    <td><img src="<%=request.getContextPath()%>/images/loginbg.png" width="100%" height="600" longdesc="../images/loginbg.png" /></td>
    <td>
		<div class="container">
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="<%=request.getContextPath()%>/login" name="login" method="post" autocomplete="on">
                              <h1>登录</h1>        
                                <p> 
                                    <label for="username">你的用户名 </label>
                                    <input id="username" name="username" required="required" type="text" placeholder="请输入你的用户名"/>
                                </p>
                                <p> 
                                    <label for="password"> 你的密码 </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="请输入你的密码" /> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">保持在线</label>
								</p>
                                <p class="login button"> 
                                    <input id="checklogin" type="submit" onclick="checkloginform()" value="登录" /> 
								</p>
                                <p class="change_link">
									没有账户 ?
									<a href="#toregister" class="to_register">注册</a>								</p>
                            </form>
                      </div>

                        <div id="register" class="animate form">
                            <form  action="<%=request.getContextPath()%>/register" name="signup" method="post" autocomplete="on" > 
                                <h1> 注册 </h1>
                                <p> 
                                    <label for="usernamesignup">你的用户名</label>
                                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="请输入你的用户名" />
                                </p>
                                <p> 
                                    <label for="emailsignup"> 你的电话</label>
                                    <input id="emailsignup" name="phonesignup" required="required" type="tel" placeholder="请输入你的电话"/> 
                                </p>
                                <p> 
                                    <label for="passwordsignup">你的密码 </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="请输入你的密码"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm">请确认你的密码 </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="请输入你的密码"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" onclick="checkregisterform()" value="注册"/> 
								</p>
                                <p class="change_link">  
									已经有账户 ?
									<a href="#tologin" class="to_register"> 去登录 </a>								
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
