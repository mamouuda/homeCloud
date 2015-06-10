<%-- 
    Document   : index
    Created on : 18 avr. 2015, 20:20:14
    Author     : anisjr
--%>

<%@page import="java.util.Date"%>
<%@page import="de.cynapsys.homeautomation.webservice.Room"%>
<%@page import="de.cynapsys.homeautomation.webservice.RoomArray"%>
<%@page import="de.cynapsys.homeautomation.webserviceimpl.DeviceWebService"%>
<%@page import="de.cynapsys.homeautomation.webservice.DeviceArray"%>
<%@page import="de.cynapsys.homeautomation.webservice.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jsp" %>  


    <body>


        <%@ include file="navbar.jsp" %>  


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">Modifier profile</h1>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2><i class="fa fa-indent red"></i><strong>Profile</strong></h2>
                </div>
                <div class="panel-body">
                    
                    <% request.setAttribute("user",user);%>
                    
                    <form action="saveProfileModification" method="post">
                        <div class="form-group">
                            <label for="nf-email">Image</label>
                            <img id="imguserDetail" src="<% out.print(user.getUrl());%>" alt="" height="150" width="150" style="margin-bottom: 10px; border: #8d8d8d thick double"/>
                            <input type="file" name="uploadedFileupdate" />
                        </div>
                        <div class="form-group">
                            <label for="nf-email">Nom</label>
                            <input type="text" id="nomupdate" name="nomupdate" class="form-control" value="<% out.print(user.getFirstName());%>">
                        </div>
                        <div class="form-group">
                            <label for="nf-email">Prénom</label>
                            <input type="text" id="prenomupdate" name="prenomupdate" class="form-control" value="<% out.print(user.getLastName());%>">
                        </div>
                        <div class="form-group">
                            <label for="nf-email">Email</label>
                            <input type="text" id="emailupdate" name="emailupdate" class="form-control" value="<% out.print(user.getMail());%>">
                        </div>
                        <div class="form-group">
                            <label for="nf-email">Login</label>
                            <input type="text" id="loginupdate" name="loginupdate" class="form-control" value="<% out.print(user.getLogin());%>">
                        </div>
                        
                        <div class="form-group">
                            <label for="nf-password">Mot de passe</label>
                            <input type="password" id="passwordupdate" name="passwordupdate" class="form-control" value="<% out.print(user.getPassword());%>">
                        </div>
                        <div class="form-group">
                            <label for="nf-password">Retaper mot de passe</label>
                            <input type="password" id="rpasswordupdate" name="rpasswordupdate" class="form-control" value="<% out.print(user.getPassword());%>">
                        </div>

                    
                
                <div class="panel-footer">
                    <button type="submit" class="btn btn-sm btn-success"><i class="fa fa-dot-circle-o"></i> Enregistrer</button>
                    <button type="reset" class="btn btn-sm btn-danger"><i class="fa fa-ban"></i> Annuler</button>
                </div>
                        </form>
                        </div>
            </div>
        </div>
    </div>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>



</body>
</html>
