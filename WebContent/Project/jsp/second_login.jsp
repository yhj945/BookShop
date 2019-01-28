<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>410书屋-分类</title>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base
href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="../css/login.css" />
<link rel="stylesheet" type="text/css" href="../css/orders.css" />
<script type="text/javascript" language="javascript">  
function display() {   
	document.getElementById("box").style.display = "block";   
}  
function disappear() {   
	document.getElementById("box").style.display = "none";   
}  
</script> 
</head>
<body>
<a href="<%=request.getContextPath()%>/Project/jsp/home.jsp">
<div class="xx1"><jsp:include page="bookhouse.jsp"/></div></a>
<br><br><span class="x2">用户：</span>
<a href="<%=request.getContextPath()%>/Project/jsp/orders.jsp" onmouseover="display()" onmouseout="disappear()">
<span class="x4"><%=session.getAttribute("loginname")%></span></a>
<form action="<%=request.getContextPath()%>/quit" name="quit" method="post">
<div class="x5">
<input class="x5" type="submit" value="退出登录" />
</div>
</form>
<div id="box" class="box" >点击进入我的中心</div>
<script type="text/javascript">
</script>
<img src="<%=request.getContextPath()%>/images/first.jpg" width="1844" height="720" border="0" usemap="#Map" />
<map name="Map" id="Map">
<area shape="rect" coords="6,3,469,328" href="<%=request.getContextPath()%>/Project/jsp/buybook1.jsp" target="_self" alt="科学类" title="科学类" />
<area shape="rect" coords="1380,2,1840,362" href="<%=request.getContextPath()%>/Project/jsp/buybook3.jsp" target="_self" alt="历史类" title="历史类"/>
<area shape="rect" coords="3,329,466,718" href="<%=request.getContextPath()%>/Project/jsp/buybook2.jsp" target="_self" alt="言情类" title="言情类"/>
<area shape="rect" coords="1381,359,1844,719" href="<%=request.getContextPath()%>/Project/jsp/buybook4.jsp" target="_self" alt="玄幻类" title="玄幻类"/>
<area shape="rect" coords="468,-1,1381,682" href="<%=request.getContextPath()%>/Project/jsp/center.jsp" target="_self" alt="410精品" title="410精品"/>
</map>
</body>  
</html>