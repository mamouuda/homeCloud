/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.anisjr.servlets;

import com.googlecode.objectify.ObjectifyService;
import static com.googlecode.objectify.ObjectifyService.ofy;
import de.cynapsys.home.entity.House;
import de.cynapsys.home.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Long.valueOf;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.namespace.QName;

/**
 *
 * @author anisjr
 */
public class DetailCategory extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static {
        ObjectifyService.register(House.class);
        ObjectifyService.register(User.class);
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(true);
        User user = (User)session.getAttribute("user");
        request.setAttribute("user", user);
        House house =  ofy().load().type(House.class).filter("user",user.getId() ).first().now();
        
         Long categoryID = valueOf(request.getParameter("id"));
                 try{
        de.cynapsys.homeautomation.webserviceimpl.DeviceWebServiceImplService service = new de.cynapsys.homeautomation.webserviceimpl.DeviceWebServiceImplService(new URL("http://"+house.getWebservice()+"/HomeAutomationHibernate/DeviceWebServiceImplService?wsdl"), new QName("http://webserviceImpl.homeautomation.cynapsys.de/", "DeviceWebServiceImplService"));
	de.cynapsys.homeautomation.webserviceimpl.DeviceWebService port = service.getDeviceWebServiceImplPort();
	// TODO process result here
	de.cynapsys.homeautomation.webservice.DeviceArray result = port.getDevicesByCategory(categoryID);
        request.setAttribute("result", result);
        
        de.cynapsys.homeautomation.webserviceimpl.CategoryWebServiceImplService serviceCategory = new de.cynapsys.homeautomation.webserviceimpl.CategoryWebServiceImplService(new URL("http://"+house.getWebservice()+"/HomeAutomationHibernate/CategoryWebServiceImplService?wsdl"),new QName("http://webserviceImpl.homeautomation.cynapsys.de/", "CategoryWebServiceImplService"));
	de.cynapsys.homeautomation.webserviceimpl.CategoryWebService portCategory = serviceCategory.getCategoryWebServiceImplPort();
	// TODO process result here
	de.cynapsys.homeautomation.webservice.Category resultCategory = portCategory.getCategoryByID(categoryID);
        
        String nameCategory = resultCategory.getName();
        request.setAttribute("nameCategory", nameCategory);
        
       }catch(Exception ex){}

      this.getServletContext().getRequestDispatcher("/WEB-INF/user/categoryDetail.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
