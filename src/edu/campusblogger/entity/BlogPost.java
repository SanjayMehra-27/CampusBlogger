package edu.campusblogger.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Part;

public class BlogPost extends Student {

	private int blogpostId;
	private String title;
	private String post;
	private String sid;
	private String postDate;
	private String postTime;
	private Part postImage;
	
	private String blogPostImage;
	
	public String getBlogPostImage() {
		return blogPostImage;
	}
	public void setBlogPostImage(String blogPostImage) {
		this.blogPostImage = blogPostImage;
	}
	public Part getPostImage() {
		return postImage;
	}
	public void setPostImage(Part postImage) {
		this.postImage = postImage;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		
		  
		//Conversion Post Time...
		String[] str = postDate.split(" ");
		String timestr ="";
		String date1 = "";
		for (int i = 0; i < str.length; i++) {
			timestr = str[1];
			date1 = str[0]; 
			System.out.println(timestr+" "+i);
		}
		
		   
		 try {
		        DateFormat inFormat = new SimpleDateFormat( "HH:mm:ss");
		        DateFormat outFormat = new SimpleDateFormat( "hh:mm a");
		        Date date = (Date) inFormat.parse(timestr);
		        timestr = outFormat.format(date);
		    }catch (Exception e){
		    	
		    }
		//Date...		 
		this.postDate = date1;
		//time
		this.postTime = timestr;
	}
	public int getBlogpostId() {
		return blogpostId;
	}
	public void setBlogpostId(int blogpostId) {
		this.blogpostId = blogpostId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	@Override
	public String toString() {
		return "BlogPost [blogpostId=" + blogpostId + ", " + (title != null ? "title=" + title + ", " : "")
				+ (post != null ? "post=" + post + ", " : "") + (sid != null ? "sid=" + sid + ", " : "")
				+ (postDate != null ? "postDate=" + postDate + ", " : "")
				+ (postImage != null ? "postImage=" + postImage + ", " : "")
				+ (blogPostImage != null ? "blogPostImage=" + blogPostImage : "") + "]";
	}
	/**
	 * @return the postTime
	 */
	public String getPostTime() {
		return postTime;
	}
	
	
	
	
	
}
