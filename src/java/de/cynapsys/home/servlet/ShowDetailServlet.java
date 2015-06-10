package de.cynapsys.home.servlet;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import de.cynapsys.home.entity.House;

@SuppressWarnings("serial")
public class ShowDetailServlet extends HttpServlet {
    static {
        ObjectifyService.register(House.class);
        
    }

    
    DatastoreService datastore =
    		DatastoreServiceFactory.getDatastoreService();
    
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
    	
    	System.out.println(req.getAttribute("ok"));

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	
       // BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        
        if (req.getParameter("id") != null) {
        	Long id = new Long (req.getParameter("id"));
            House UploadInfos = ofy().load().type(House.class).filter("id", id).first().now();
            
            String City = new String (req.getParameter("City"));
            String Country = new String (req.getParameter("Country"));
            String Name = new String (req.getParameter("Name"));
            String StreetAdress = new String (req.getParameter("StreetAdress"));
            String Webservice = new String (req.getParameter("Webservice"));
            String Zip  = new String (req.getParameter("Zip"));
    		
            UploadInfos.setCity(City);
            UploadInfos.setCountry(Country);
            UploadInfos.setName(Name);
            UploadInfos.setStreetAdress(StreetAdress);
            UploadInfos.setWebservice(Webservice);
            UploadInfos.setZip(Zip);
            
            
            if (UploadInfos != null) {
            	//datastore.put(UploadInfos);
            	
            }
            
            
        }

        try {
			this.getServletContext().getRequestDispatcher("/WEB-INF/admin/admin.jsp").forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


    }
}
