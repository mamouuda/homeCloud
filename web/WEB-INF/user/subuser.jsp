<%-- 
    Document   : index
    Created on : 18 avr. 2015, 20:20:14
    Author     : anisjr
--%>

<%@page import="de.cynapsys.home.entity.SubUser"%>
<%@page import="java.util.List"%>
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
            <h1 class="page-header">Sous utilisateurs</h1>

            <div class="row">
                <div class="panel panel-default col-md-6">
                    <div class="panel-heading">
                        <h2><i class="fa fa-indent red"></i><strong>Profile</strong></h2>
                    </div>
                    <div class="panel-body">

                        <form action="" method="post">
                            <div class="form-group">
                                <label for="nf-email">Image</label>
                                <img id="imguserDetail" src="" alt="" />
                                <input type="file" name="uploadedFileupdate" />
                            </div>
                            <div class="form-group">
                                <label for="nf-email">Nom</label>
                                <input type="email" id="nomupdate" name="nomupdate" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="nf-email">Prénom</label>
                                <input type="email" id="prenomupdate" name="prenomupdate" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="nf-email">Email</label>
                                <input type="email" id="emailupdate" name="emailupdate" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="nf-email">Login</label>
                                <input type="email" id="loginupdate" name="loginupdate" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="nf-password">Mot de passe</label>
                                <input type="password" id="passwordupdate" name="passwordupdate" class="form-control" >
                            </div>
                            <div class="form-group">
                                <label for="nf-password">retaper mot de passe</label>
                                <input type="password" id="rpasswordupdate" name="rpasswordupdate" class="form-control">
                            </div>
                        </form>
                    </div>
                    <div class="panel-footer">
                        <button type="submit" class="btn btn-sm btn-success"><i class="fa fa-dot-circle-o"></i> Ajouter</button>
                        <button type="reset" class="btn btn-sm btn-danger"><i class="fa fa-ban"></i> Annuler</button>
                    </div>
                </div>

                <div class="panel panel-default col-md-6">
                    <div class="panel-heading">
                        <h2><i class="fa fa-table red"></i><span class="break"></span><strong></strong></h2>
                        
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Login</th>
                                    <th></th>                                          
                                </tr>
                            </thead>   
                            <tbody>
                                <%  user=(User) (request.getSession(true).getAttribute("user"));  
                                    List<SubUser> listsubuser =  (List<SubUser>) request.getAttribute("userList");
                                    out.print(listsubuser);%>									                                  
                            </tbody>
                        </table>  
                        
                    </div>
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
