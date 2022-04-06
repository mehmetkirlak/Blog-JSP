package model;

import java.util.Date;

public class BlogModel {
	private int id;
	private String title;
	private String imageSource;
	private String body;
	private Date createdAt;
	private int published;

	public BlogModel() {
	}

	public BlogModel(int id, String title, String imageSource, String body, Date createdAt, int published) {
		this.id = id;
		this.title = title;
		this.imageSource = imageSource;
		this.body = body;
		this.createdAt = createdAt;
		this.published = published;
	}

	public String getImageSource() {
		return imageSource;
	}

	public void setImageSource(String imageSource) {
		this.imageSource = imageSource;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public int getPublished() {
		return published;
	}

	public void setPublished(int published) {
		this.published = published;
	}

}
