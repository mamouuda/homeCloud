package de.cynapsys.home.servlet;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.googlecode.objectify.ObjectifyService;

import de.cynapsys.home.entity.User;

/**
 * Servlet implementation class authentication
 */
public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
        private User user;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Authentication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	static{
		ObjectifyService.register(User.class);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    res.setContentType("text/html");
	    PrintWriter out = res.getWriter();

	    String account = req.getParameter("account");
	    String password = req.getParameter("password");

	    if ("notUser".equals(typeUser(account, password))) {
	      out.println("<HTML><HEAD><TITLE>Access Denied</TITLE></HEAD>");
	      out.println("<BODY>Your login and password are invalid.<BR>");
	      out.println("You may want to <A HREF=\"/index.jsp\">try again</A>");
	      out.println("</BODY></HTML>");
	    }
	    else if ("user".equals(typeUser(account, password))){
	      out.println("<HTML><HEAD><TITLE>Access authorised</TITLE></HEAD>");
	      out.println("<BODY>Your login and password are valid.<BR>");
	      out.println("</BODY></HTML>");
              
              
                      
	      HttpSession session = req.getSession();
	      session.setAttribute("user", user);  

	     res.sendRedirect("Servlet");

	      //res.sendRedirect("/");
	    }
	    
	    else{
	    	out.println("<HTML><HEAD><TITLE>Access authorised</TITLE></HEAD>");
		    out.println("<BODY>Your login and password are valid as ADMIN.<BR>");
		    out.println("</BODY></HTML>"); 
		    
		    
		    res.sendRedirect("admin/");

	    }
	}
	
	
	private String typeUser (String account, String password){
		if ("admin".equals(account) && "admin".equals(password)){
			return "admin";
		}
		else
			if (allowUser(account, password)){
				return "user";
			}
			else
				return "notUser";
	}
	
	protected boolean allowUser(String account, String password) {
		
		User u = ofy().load().type(User.class).filter("login", account).filter("password", password).first().now();
		if (u!=null){
                    user = u;
			return true;
		}
		else
			return false;
	}

}
