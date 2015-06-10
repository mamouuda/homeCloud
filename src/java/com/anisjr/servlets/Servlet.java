package com.anisjr.servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.googlecode.objectify.ObjectifyService;
import static com.googlecode.objectify.ObjectifyService.ofy;
import de.cynapsys.home.entity.House;
import de.cynapsys.home.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Servlet extends HttpServlet {

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
        
        
        
       try{
        de.cynapsys.homeautomation.webserviceimpl.DeviceWebServiceImplService serviceDevice = new de.cynapsys.homeautomation.webserviceimpl.DeviceWebServiceImplService(new URL("http://"+house.getWebservice()+"/HomeAutomationHibernate/DeviceWebServiceImplService?wsdl"), new QName("http://webserviceImpl.homeautomation.cynapsys.de/", "DeviceWebServiceImplService"));
	de.cynapsys.homeautomation.webserviceimpl.DeviceWebService portDevice = serviceDevice.getDeviceWebServiceImplPort();
	// TODO process result here
	de.cynapsys.homeautomation.webservice.DeviceArray resultDevice = portDevice.getAllDevices();
        request.setAttribute("result", resultDevice);
        request.setAttribute("port", portDevice);
        
        de.cynapsys.homeautomation.webserviceimpl.RoomWebServiceImplService serviceRoom = new de.cynapsys.homeautomation.webserviceimpl.RoomWebServiceImplService(new URL("http://"+house.getWebservice()+"/HomeAutomationHibernate/RoomWebServiceImplService?wsdl"), new QName("http://webserviceImpl.homeautomation.cynapsys.de/", "RoomWebServiceImplService"));
	de.cynapsys.homeautomation.webserviceimpl.RoomWebService portRoom = serviceRoom.getRoomWebServiceImplPort();
	// TODO process result here
	de.cynapsys.homeautomation.webservice.RoomArray resultRoom = portRoom.getAllRooms();
        request.setAttribute("resultRoom", resultRoom);
       
        
       }catch(Exception ex){}
       
        
      this.getServletContext().getRequestDispatcher("/WEB-INF/user/dashboard.jsp").forward(request, response);
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


}
