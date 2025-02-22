<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<title>登录</title>
	 <meta charset="UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="description" content="求职招聘网站">
	<meta name="keywords" content="求职、招聘">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="css/sign.css">
	<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<!--[if lt IE 9]> 
	<script> 
	   (function() {
	     if (!0) return;
	     var e = "abbr,article,aside,audio,canvas,datalist,details,dialog,eventsource,figure,footer,header,hgroup,mark,menu,meter,nav,output,progress,section,time,video".split(',');
	     var i= e.length;
	     while (i--){
	         document.createElement(e[i])
	     } 
	})() 
	</script>
	<![endif]-->
	<script type="text/javascript">
		
		
	</script>
  </head>
  
  <body>
    <header class="sign-header">
	</header>
	<section class="sign-content">
		<!-- 登录框表头 -->
		<ul class="sign-nav">
			<li class="li-active" id="type">个人用户绑定</li>
			<li>企业用户绑定</li>
		</ul>
		<!-- 登录框左边 -->
		<div class="sign-left">
			<form id="loginForm" class="sign-form" action="${pageContext.request.contextPath}/binding.action" method="post">
				<input type="hidden" value="" name="type" id="iptType">
				<input type="hidden" value="${picUrl}" name="picUrl"/>
				<input type="hidden" value="${openId}" name="openId" >
				<input type="email" class="ipt" placeholder="请输入已验证邮箱" id="email" name="mail"><br/>
				<i class="warn-tips">请输入已验证的邮箱</i>
				<input type="password" class="ipt" placeholder="请输入密码" id="pwd" name="password"><br/>
				<i class="warn-tips">请输入密码</i>
				<input type="text" placeholder="请输入验证码" class="ipt verify-code-ipt" name="" id="vertify">
				<span>
					<img src="" class="verify-code" id="vertifyCode">
					<img src="images/sign/icon-roate.jpg" class="icon-roate" id="reroate">
				</span>
				<i class="warn-tips">请输入验证码</i>
				<c:if test="${errors!=null}">
					<c:forEach item="${errors }" var="errors">
						<i class="errorTip show">${errors }</i>
					</c:forEach>
				</c:if>
				<a href="javascript:void(0)" class="forget-pwd">忘记密码？</a>
				<input type="button" value="登录并绑定" class="ipt btn" id="login">
			</form>
			<form action="" method="post" id="reroateForm"></form>
		</div>
		<!-- 登录框右边 -->
		<div class="sign-right" >
			<div>
				<a href="javascript:void(0)" >
					<img alt="微博" src="${picUrl}">
				</a>
                <form method="post" action="${pageContext.request.contextPath}/firstRegister.action" class="sign-form">
                	<input type="hidden" value="${openId}" name="openId"/>
                	<input type="hidden" value="${picUrl}" name="picUrl"/>
                	<input type="submit" value="直接注册" class="gotoR"/>
                </form>
			</div>
		</div>
	</section>
	<footer>
		<p class="footer">——互联网求职机会——</p>
	</footer>
	
	<script type="text/javascript" src="js/login.js"></script>
  </body>
</html>
