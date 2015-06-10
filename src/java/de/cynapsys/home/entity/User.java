package de.cynapsys.home.entity;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import java.io.Serializable;

@Entity
@Cache
public class User implements  Serializable{
	
	@Id Long id;
	String firstName;
	String lastName;
        String mail;
	@Index String login;
	@Index String password;
	@Index BlobKey image;
	String url;
	
	
	public User() {
	}
	
	

	public User(String firstName, String lastName, String login,
			String password, BlobKey image,String email) {
		super();
		
		ImagesService imagesService = ImagesServiceFactory.getImagesService();
		this.firstName = firstName;
		this.lastName = lastName;
		this.login = login;
		this.password = password;
		this.image = image;
		this.url = imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(image));
                this.mail=email;
	}



	public User(Long id, String firstName, String lastName, String login,
			String password, BlobKey image) {
		super();
		
		
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.login = login;
		this.password = password;
		this.image = image;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public BlobKey getImage() {
		return image;
	}

	public void setImage(BlobKey image) {
            ImagesService imagesService = ImagesServiceFactory.getImagesService();
            this.image = image;
            this.url = imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(image));
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
        
        

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", login=" + login + ", password=" + password + ", image=" + image + ", url=" + url + '}';
    }

	
	
}