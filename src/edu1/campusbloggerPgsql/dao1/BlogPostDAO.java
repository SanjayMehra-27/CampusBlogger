package edu1.campusbloggerPgsql.dao1;

import edu1.campusbloggerPgsql.entity1.BlogPost;

public interface BlogPostDAO {

	boolean savePost(BlogPost blogPost);

	

	boolean updatePost(BlogPost blogPost);


	//Save Post Image In DB (postimages)
	boolean savePostImage(BlogPost blogPost);


	
}
