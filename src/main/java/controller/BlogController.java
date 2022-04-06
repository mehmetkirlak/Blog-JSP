package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import model.BlogModel;

import java.util.ArrayList;
import java.util.Collections;

public class BlogController {

	public Connection con = null;
	public String host = "localhost";
	public static String serverName = "DESKTOP-EFD0KAH";
	public static int port = 1433;
	public static String dbName = "Blog";
	public static String properties = "encrypt=true;trustServerCertificate=true";
	//public String url = "jdbc:sqlserver://DESKTOP-EFD0KAH:1433;DatabaseName= Hospital ;encrypt=true;trustServerCertificate=true";
	public static String url = "jdbc:sqlserver://"+serverName+":"+port+";Database="+dbName+";"+properties;
	public static String user="sa";
	public static String password="123";
	
	/*static final String url = "jdbc:mssql://localhost:3306/blog"; // the url is unique for each db
	static final String username = "sa";
	static final String password = "123";*/

	public static ArrayList<BlogModel> getBlogList() throws SQLException {
		Connection con = DriverManager.getConnection(url, user, password);
		ArrayList<BlogModel> list = new ArrayList<>();
		BlogModel post;
		try {
			String query = "SELECT * FROM post";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				post = new BlogModel(rs.getInt("id"), rs.getString("title"), rs.getString("imageSource"),
						rs.getString("body"), rs.getDate("createdAt"), rs.getInt("published"));
				list.add(post);
			}

			rs.close();
			st.close();
			con.close();
			return list;
		} catch (SQLException e) {
			System.out.println("Database connection Failed...");
			e.printStackTrace();
			return null;
		}
	}

	public static ArrayList<BlogModel> getRecentBlogList() throws SQLException {//comparing blogs with their dates then retuning recent to first blog
		ArrayList<BlogModel> blogList = new ArrayList<>(getBlogList());
		BlogModel temp;
		try {
			for (int i = 0; i < blogList.size(); i++) {
				for (int j = i + 1; j < blogList.size(); j++) {
					if (blogList.get(i).getCreatedAt().compareTo(blogList.get(j).getCreatedAt()) == 1) {
						temp = blogList.get(i);
						blogList.set(i, blogList.get(j));
						blogList.set(j, temp);

					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return blogList;
	}

	public static ArrayList<BlogModel> getReverseRecentBlogList() throws SQLException {//if you want to show your blogs recent to first on your website you have to 
																																				//use this method cause when you getting recent ones with the loop and  
		ArrayList<BlogModel> blogList = new ArrayList<>(getRecentBlogList());           // taking them to website it will add the recents first and the view gonna be
																																			    //first to last post.
		Collections.reverse(blogList);
		return blogList;
	}

	public static BlogModel getById(int id) {
		ArrayList<BlogModel> blogList;
		try {
			blogList = new ArrayList<>(getReverseRecentBlogList());
			for (BlogModel blog : blogList) {
				if (blog.getId() == id) {
					return blog;
				} else {
					continue;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
		

	}

}
