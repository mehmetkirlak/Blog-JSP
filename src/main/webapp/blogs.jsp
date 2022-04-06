<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:ital,wght@1,300&family=Darker+Grotesque:wght@300&family=Encode+Sans+SC:wght@100&family=Kanit:wght@200&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
<link rel="mask-icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<link rel="stylesheet" href="styles/style.css">
<title>Awesome Blog</title>
<script>
	window.console = window.console || function(t) {
	};
</script>
<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>
</head>
<body>

	<jsp:include page="indexNavbar.jsp" />


	<%@page
		import="controller.BlogController,model.BlogModel,java.util.*,java.sql.*"%>
	<div class="slider"></div>
	<div class="container my-4 blogs-cont">



		<%
		ArrayList<BlogModel> recentBlogList = new ArrayList<>(BlogController.getReverseRecentBlogList());
				for (int i = 0; i < recentBlogList.size(); i++) {
		%>

		<div class="card blogs-card">
			<div class="card shadow">
				<img src="img/java.png" class="card-img-top" alt="">
				<div class="card-img-overlay">
					<a href="#" class="btn btn-light btn-sm" style="float: left;">Java</a>
				</div>
				<div class="card-body">

					<h5 class="card-title">
						<a
							href="viewBlog.jsp?viewBlogId=<%=recentBlogList.get(i).getId()%>"><%=recentBlogList.get(i).getTitle()%></a>
					</h5>
					<small class="text-muted cat"> <i
						class="far fa-clock text-info"></i> 2 dakika
					</small>
					<p class="card-text"><%=recentBlogList.get(i).getBody()%></p>
				</div>
				<ul class="post-footer">
					<li><a href="#"><i class="far fa-eye"></i>57</a></li>
					<li><a href="#" class="text-muted"><i
							class="far fa-calendar"><%=recentBlogList.get(i).getCreatedAt()%></i></a></li>
				</ul>
			</div>
		</div>
		<%
		}
		%>



	</div>

	<footer class="py-5 bg-dark text-white">
		<div class="container text-center">
			<span>All Rights Reserved. @2025</span>
		</div>
	</footer>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>