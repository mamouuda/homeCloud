<%-- 
    Document   : categorie
    Created on : 4 juin 2015, 10:06:16
    Author     : anisjr
--%>

<%@page import="java.util.Date"%>
<%@page import="de.cynapsys.homeautomation.webservice.Category"%>
<%@page import="de.cynapsys.homeautomation.webservice.CategoryArray"%>
<%@page import="de.cynapsys.homeautomation.webserviceimpl.DeviceWebService"%>
<%@page import="de.cynapsys.homeautomation.webservice.DeviceArray"%>
<%@page import="de.cynapsys.homeautomation.webservice.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%@ include file="head.jsp" %>  
    
    
    <body>

     
        <%@ include file="navbar.jsp" %>  


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">Categories</h1>

            <div class="row placeholders">
                <%
                    try {
                        CategoryArray resultCategory = (CategoryArray) request.getAttribute("resultCategory");
                        for (Category k : resultCategory.getItem()) {
                %>
                <div class="col-xs-6 col-sm-3 placeholder">
                    <a href="DetailCategory?id=<% out.print(k.getId());  %>">

                                               <img class="img-responsive" alt="200x200" src="/images/<% out.print(Utils.Utils.resolveImageName(k.getName()));  %>" data-holder-rendered="true">




                        <h4><% out.print(k.getName());  %></h4></a>
                </div>
                <%
                   }
               } catch (Exception ex) {%>

                <div class="col-xs-6 col-sm-3 placeholder">

                   
                    <h4>Please reload</h4>
                </div>

                <%
                    }
                %>
            </div>

            
                    
            
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>



</body>
</html>
