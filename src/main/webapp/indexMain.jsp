<main>


	<%@page
		import="controller.BlogController,model.BlogModel,java.util.*,java.sql.*"%>
	<div class="slider"></div>

	<div class="container">
		<div class="card-group">
			<div class="row">

				<%
				ArrayList<BlogModel> recentBlogList1 = new ArrayList<>(BlogController.getRecentBlogList());
				for (int i = 0; i < 3; i++) {
				%>
				<div class="col-sm-4 colunm">
					<div class="card">
						<img class="card-img" src="img/randcode.jpg" alt="Bologna">
						<div class="card-img-overlay">
							<a href="#" class="btn btn-light btn-sm" style="float: left;">Java</a>
						</div>
						<div class="card-body">
							<h5 class="card-title">
								<a
									href="viewBlog.jsp?viewBlogId=<%=recentBlogList1.get(i).getId()%>"><%=recentBlogList1.get(i).getTitle()%></a>
							</h5>
							<small class="text-muted cat"> <i
								class="far fa-clock text-info"></i> 2 dakika
							</small>
							<p class="card-text">
								<%=recentBlogList1.get(i).getBody()%>
							</p>
						</div>
						<ul class="post-footer">
							<li><a href="#"><i class="far fa-eye"></i>57</a></li>
							<li><a href="#" class="text-muted calender"><i
									class="far fa-calendar"><%=recentBlogList1.get(i).getCreatedAt()%></i></a></li>
						</ul>
					</div>
				</div>
				<%
				}
				%>
			</div>


			<div class="row">

				<%
				for (int i = 3; i < 6; i++) {
				%>
				<div class="col-sm-4 colunm">
					<div class="card">
						<img class="card-img" src="img/randcode.jpg" alt="Bologna">
						<div class="card-img-overlay">
							<a href="#" class="btn btn-light btn-sm" style="float: left;">Java</a>
						</div>
						<div class="card-body">
							<h4 class="card-title">
								<a
									href="viewBlog.jsp?viewBlogId=<%=recentBlogList1.get(i).getId()%>">
									<%=recentBlogList1.get(i).getTitle()%>
								</a>
							</h4>
							<small class="text-muted cat"> <i
								class="far fa-clock text-info"></i> 2 dakika
							</small>
							<p class="card-text">
								<%=recentBlogList1.get(i).getBody()%>
							</p>
						</div>
						<ul class="post-footer">
							<li><a href="#"><i class="far fa-eye"></i>57</a></li>
							<li><a href="#" class="text "><i class="far fa-calendar"><%=recentBlogList1.get(i).getCreatedAt()%></i></a></li>
						</ul>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>



	<div class="container my-4 text-center">
		<a href="blogs.jsp" type="button" class="btn btn-primary">Diğer
			Bloglar gör</a>
	</div>
</main>