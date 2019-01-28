<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,hight=device-hight,minimum-scale=1.0,maximum-scale=1.0,ser-scalable=none">
<title>410书屋-主页</title>
<link rel="stylesheet" type="text/css" href="../css/radio.css" />
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base
href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="../css/home.css" />
<script type="text/javascript">
var qiut = "<%=(String)session.getAttribute("loginname")%>"
var suceess = "<%=(String)session.getAttribute("suceess")%>"
window.onload = function(){
    var obj = document.getElementById('code');
    obj.onclick=function(){
    	  if(suceess == "issuceess" && qiut != "isquit"){
    	  	window.location.href="second_login.jsp";
    	  }else{
    	  	 window.location.href="second.jsp"; 
    	  }           
     }
 }
</script>
</head>
<body>
<div><a href="<%=request.getContextPath()%>/Project/jsp/AdministratorLogin.jsp">
<span style="position:absolute; right:0px; bottom:0px;">   
<input class="a" type="button" value="管理员登录"></span></a>  
</div>
<div id="code"></div>
<script type="text/javascript" src="../js/ThreeCanvas.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/jquery-2.0.3.min.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/Snow.js" charset="utf-8"></script>
<script type="text/javascript" src="../js/snowFall.js" charset="utf-8"></script>
<script>
	$.snowFall({
		//创建粒子数量，密度
		particleNo: 500,
		//粒子下拉速度
		particleSpeed:30,
		//粒子在垂直（Y轴）方向运动范围
		particleY_Range:1300,
		//粒子在垂直（X轴）方向运动范围
		particleX_Range:1000,
		//是否绑定鼠标事件
	    bindMouse: false,
	    //相机离Z轴原点距离
	    zIndex:600,
	  	//摄像机视野角度
	    angle:55,
	    wind_weight:0
	});
</script>
</body>
</html>