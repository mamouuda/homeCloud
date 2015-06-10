<%-- 
    Document   : navbar.jsp
    Created on : 22 avr. 2015, 10:32:02
    Author     : anisjr
--%>

<%@page import="de.cynapsys.home.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
   
<script type="text/javascript">
    function redirecttomodifyprofile(){
        window.location.href = "/Profile";
    }
</script>


   
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">BeITy</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
                 <li><a href="/Device" >Devices</a></li>
              <li><a href="/Categorie" >Categories</a></li>
             <li><a href="/RoomList" >Chambres</a></li>
             
              <% User user=(User) (request.getSession(true).getAttribute("user"));  %>
              
           <li class="dropdown visible-md visible-lg">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img class="user-avatar" src="<% out.print(user.getUrl()); %>" alt="user-mail"> <% if (user.getMail()==null) out.print("");
                                                                                                                                                             else   out.print(user.getMail()); %></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Account</strong>
						</li>						
                                                <li><a onclick="redirecttomodifyprofile()"><i class="fa fa-user"></i> Profile</a></li>
						<li><a href="/subuser"><i class="fa fa-user-plus"></i> sous utilisateur</a></li>
						<li class="divider"></li>						
						<li><a href="index.html"><i class="fa fa-sign-out"></i> Logout</a></li>	
	        		</ul>
	      		</li>
          </ul>
     
          
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="/Servlet">Dashboard</a></li>
            <li class="active"><a href="/RoomList">Chambres <span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="/Categorie">Categories</a></li>
            <li class="active"><a href="/Device">Devices</a></li>
            <li class="active"><a href="/subuser">Sous utilisateurs</a></li>
            <li class="active"><a href="/Device">Spécifier dashboard</a></li>
            <li><a href="#"></a></li>
          </ul>
            </div>