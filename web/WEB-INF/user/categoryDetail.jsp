<%-- 
    Document   : categoryDetail
    Created on : 4 juin 2015, 11:11:43
    Author     : anisjr
--%>


<%@page import="java.util.Date"%>
<%@page import="de.cynapsys.homeautomation.webserviceimpl.CategoryWebService"%>
<%@page import="de.cynapsys.homeautomation.webservice.Device"%>
<%@page import="de.cynapsys.homeautomation.webservice.DeviceArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jsp" %>
    <body>
        <%@ include file="navbar.jsp" %>  

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header"><%  out.print(request.getAttribute("nameCategory")); %>  ${ !empty id ? id : '' }</h1>

            <div class="row placeholders">

                <div class="col-xs-6 col-sm-3 placeholder">


                    
                    
                </div>

            </div>

            <h2 class="sub-header">All devices</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>

                            <th>Name</th>
                            <th>Status</th>
                            <th>description</th>
                            <th>Last seen</th>
                        </tr>
                    </thead>
                    <tbody>


                        <%
                            try {
                                DeviceArray result;
                                result = (DeviceArray) request.getAttribute("result");

                                for (Device j : result.getItem()) {
                        %>

                        <tr>

                            <td> <% out.print(j.getName());  %> </td>


                            <td><div class="onoffswitch">
                                   <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch<% out.print(j.getId()); %>" <% if (j.getCurrentValue() == 100) {
                                            out.print("checked");
                                        } %>>

                                    <label class="onoffswitch-label" for="myonoffswitch<% out.print(j.getId()); %>">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>     
                                    <script>

                                 $('#myonoffswitch<% out.print(j.getId()); %>').click( function (){
                                    
                                    $.ajax({
                                        url : 'ExecuteServlet?deviceID=' + <% out.print(j.getId()); %> ,
                                        success : function(data) {
                                                
                                        }
                                    });
                                 });
                                    </script> 

                                </div>

                            </td>

                            <td> <% out.print(j.getDescription()); %> </td>
                            <td> <% Date date = new Date();
                                out.print(date.toString()); %>                     
                            </td>
                        </tr>
                        <%
                            }
                        } catch (Exception ex) {%>
                        <tr>

                            <td> connection not established </td>
                            <td> please reload </td>
                            <td>
                            </td>
                            <td>please reload</td>
                        </tr>
                        <%
                            }
                        %>


                    </tbody>
                </table>
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
