<%-- 
    Document   : room
    Created on : 20 avr. 2015, 16:39:58
    Author     : anisjr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Simple Login Form</title>
<meta charset="UTF-8" />
<meta name="Designer" content="PremiumPixels.com">
<meta name="Author" content="$hekh@r d-Ziner, CSSJUNTION.com">
<link rel="stylesheet" type="text/css" href="stylesheets/css/reset.css">
<link rel="stylesheet" type="text/css" href="stylesheets/css/structure.css">
</head>

<body>
<form class="box login" action="/authentication" method="post">
	<fieldset class="boxBody">
	  <label>Username</label>
	  <input type="text" id="account" name="account" placeholder="" required>
	  <label>Password</label>
	  <input type="password" id="password" name="password" tabindex="2" required>
	</fieldset>
	<footer>
	  <label><input type="checkbox" tabindex="3">Keep me logged in</label>
	  <input type="submit" class="btnLogin" value="Login" tabindex="4">
	</footer>
</form>
<footer id="main">
  <a href="http://www.cynapsys.de">Cynapsys Home Automation</a> 
</footer>
</body>
</html>
