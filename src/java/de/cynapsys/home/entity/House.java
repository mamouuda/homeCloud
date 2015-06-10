package de.cynapsys.home.entity;

import static com.googlecode.objectify.ObjectifyService.ofy;


import java.util.Date;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.Cache;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import java.io.Serializable;

@Entity
@Cache
public class House implements Serializable{

	@Id Long id;
	String name;
	String streetAdress;
	String city;
	String country;
	String zip;
	String webservice;
	@Index BlobKey key;
	String url;
	@Index Date date;
	@Index Long user;
	
	
	
	public House() {
	}



	public House(BlobKey key, String name, String streetAdress, String city, String country,
			String zip, String webservice ) {
		super();
		ImagesService imagesService = ImagesServiceFactory.getImagesService();
		
		this.name = name;
		this.streetAdress = streetAdress;
		this.city = city;
		this.country = country;
		this.zip = zip;
		this.webservice = webservice;
		
		this.key = key;
		this.date = new Date();
		this.url=imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(key));
	}



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getStreetAdress() {
		return streetAdress;
	}



	public void setStreetAdress(String streetAdress) {
		this.streetAdress = streetAdress;
	}



	public String getCity() {
		return city;
	}



	public void setCity(String city) {
		this.city = city;
	}



	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public String getZip() {
		return zip;
	}



	public void setZip(String zip) {
		this.zip = zip;
	}



	public String getWebservice() {
		return webservice;
	}



	public void setWebservice(String webservice) {
		this.webservice = webservice;
	}



	public BlobKey getKey() {
		return key;
	}



	public void setKey(BlobKey key) {
		this.key = key;
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}



	public Long getUser() {
		return user;
	}



	public void setUser(Long user) {
		this.user = user;
	}
	
	static{
		ObjectifyService.register(User.class);
	}
	
	public User getuserHouse(){
		User u = ofy().load().type(User.class).id(user).now();
		return u;
	}
	
	
	

}
