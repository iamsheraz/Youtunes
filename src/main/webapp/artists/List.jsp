<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="youtunes.model.Artist"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		
		
		<link href="/youtunes/CSS/styles.css" rel="stylesheet" type="text/css"/>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;1,400&family=Source+Sans+3:wght@400;700&family=VT323&display=swap" rel="stylesheet">
		<%@page import="youtunes.service.impl.JdbcArtistDao, youtunes.model.Artist, java.util.List" %>
		<% String base = (String)application.getAttribute("base"); %>
		<jsp:useBean id="artistDao" scope="application" class="youtunes.service.impl.JdbcArtistDao" />
		
		<title>YouTunes | Artists</title>
	</head>
<body>
	<jsp:include page="../jsp/TopNav.jsp" flush="true" />

	<div class="py-5 container width-35">
	
		<h2 class="text-center">Artist List</h2>
		<br />
		
		<p class="text-center">
			<a href="store?action=newArtist" class="btn btn-outline-secondary text-center w-50">New Artist</a>
		</p>
		
		
		<table class="table">
			<thead>
				<tr>
					<th>ArtistId</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Functions</th>
				</tr>
			</thead>
			
			<%
				List<Artist> artists = artistDao.list(); 
				Iterator<Artist> iterator = artists.iterator();
				while (iterator.hasNext())
				{
					Artist artist = (Artist)iterator.next();
					System.out.println(artist.getArtistId());
					System.out.println(artist.getFirstName());
					System.out.println(artist.getLastName());
					
					// build HTML content from artist list
					%>
						<tr>
							<td><%=artist.getArtistId()%></td>
							<td><%=artist.getFirstName()%></td>
							<td><%=artist.getLastName()%></td>
							<td>
								<a href="store?action=artistDetails&artistId=<%=artist.getArtistId()%>" class="link">Edit</a> |
								<a href="store?action=deleteArtist&artistId=<%=artist.getArtistId() %>" class="link">Delete</a>
							</td>
						</tr>
				<% } %>
		</table>
	</div>

	<jsp:include page="../jsp/Footer.jsp" flush="true" />
	<jsp:include page="../jsp/ScriptFooter.jsp" flush="true" />
</body>
</html>