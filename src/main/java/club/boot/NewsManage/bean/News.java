package club.boot.NewsManage.bean;

import java.io.Serializable;

public class News implements Serializable{

	private static final long serialVersionUID = 1L;
	
	int news_id;
	int uid;
	String title;
	String type;
	String content;
	String post_time;
	
	
	public News() {
		super();
		
	}

	public News(int news_id, int uid, String title, String type, String content, String post_time) {
		super();
		this.news_id = news_id;
		this.uid = uid;
		this.title = title;
		this.type = type;
		this.content = content;
		this.post_time = post_time;
	}

	public int getNews_id() {
		return news_id;
	}

	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	public String getPost_time() {
		return post_time;
	}

	public void setPost_time(String post_time) {
		this.post_time = post_time;
	}

}
