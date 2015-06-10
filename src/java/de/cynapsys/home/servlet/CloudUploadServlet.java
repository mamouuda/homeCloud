package de.cynapsys.home.servlet;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.blobstore.*;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

import de.cynapsys.home.entity.House;
import de.cynapsys.home.entity.User;

@SuppressWarnings("serial")
public class CloudUploadServlet extends HttpServlet {
    static {
        ObjectifyService.register(House.class);
        ObjectifyService.register(User.class);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        List<House> uploads = ofy().load().type(House.class).order("-date").limit(12).list();
        req.setAttribute("uploads", uploads);


        this.getServletContext().getRequestDispatcher("/WEB-INF/admin/admin.jsp").forward(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

        Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
        List<BlobKey> blobKeys = blobs.get("uploadedFile");

        List<BlobKey> userImageBlob = blobs.get("uploadedFileuser");
        
        
        House uploadHouse = new House(blobKeys.get(0), req.getParameter("name"), req.getParameter("street"), req.getParameter("city"), req.getParameter("country"), req.getParameter("zip"), req.getParameter("webservice"));
        User uploadUser = new User(req.getParameter("firstnameuser"), req.getParameter("lastnameuser"), req.getParameter("loginuser"), req.getParameter("passworduser"), userImageBlob.get(0), req.getParameter("emailuser"));
        
        
        
        Key<User> keyuser = ofy().save().entity(uploadUser).now();
        uploadHouse.setUser(keyuser.getId());
        ofy().save().entity(uploadHouse).now();
        resp.sendRedirect("/admin/");


    }
}
