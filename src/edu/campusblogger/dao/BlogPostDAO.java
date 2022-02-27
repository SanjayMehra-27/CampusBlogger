package edu.campusblogger.dao;

import edu.campusblogger.entity.BlogPost;

public interface BlogPostDAO {

	boolean savePost(BlogPost blogPost);

	

	boolean updatePost(BlogPost blogPost);


	
}
