package de.cynapsys.home.servlet;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;


import com.google.appengine.api.blobstore.*;
import com.googlecode.objectify.ObjectifyService;

import de.cynapsys.home.entity.House;

@SuppressWarnings("serial")
public class DeleteServlet extends HttpServlet {
    static {
        ObjectifyService.register(House.class);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
    	
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        
        if (req.getParameter("key") != null) {
            BlobKey deleteUploadData = new BlobKey(req.getParameter("key"));
            House deleteUploadInfos = ofy().load().type(House.class).filter("key", deleteUploadData).first().now();
            if (deleteUploadInfos != null) {
            	
            	ofy().delete().entity(deleteUploadInfos).now();
                blobstoreService.delete(deleteUploadData);
                
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
