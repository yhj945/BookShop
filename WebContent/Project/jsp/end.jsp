<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付成功</title>
<%
    String path = request.getRequestURI();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base
href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="../css/end.css" />
</head>
<body>
	<div class="jq22">	
	</div>
	<script src="../js/jquery-1.4.4.min.js""></script>
	<script type="text/javascript" src="../js/jquery.fireworks.js"></script>
	<script type="text/javascript">
		$('.jq22').fireworks({ 
		  sound: false, // sound effect
		  opacity: 0.9, 
		  width: '100%', 
		  height: '100%' 
		});
	</script>
<div id="code">
 <pre style="padding: 10px 15%;">
	<span class="key1">  支付成功！</span>
	<span class="key2"></span><a href="<%=request.getContextPath()%>/Project/jsp/home.jsp">
	<span class="key3">           回到主页</span></a>
	<span class="key2"></span><a href="<%=request.getContextPath()%>/Project/jsp/orders2.jsp">
	<span class="key3">           我的订单</span></a>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2"></span>
	<span class="key2">     如有疑问，请联系客服！</span>
	<span class="key2"></span>
    <span class="key2">  客服1：余斌斌46</span>  <span class="key2">  客服4：甘泽锐16</span>
    <span class="key2">  客服2：杨明波43</span>  <span class="key2">  客服5：马俊杰32</span>
    <span class="key2">  客服3：杨华锦42</span>  <span class="key2">  客服6：曹建华55</span>
	
	
	
 </pre>
 </div>
</body>
</html>