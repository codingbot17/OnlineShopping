<%@page import="java.sql.PreparedStatement"%>
<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>
<%@ include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg))
	{%>
		<h3 class="alert">Product added Successfully </h3>
	<%} %>
	<%
	if("wrong".equals(msg))
	{
	%>
		<h3 class="alert">Something went wrong...! Try again</h3>
	<%} %>


<table>
        <thead>
          <tr>
         
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
       
          <tr>
           <%
          try
		  {
			Connection con=ConnectionProvider.getCon();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from product");
			while(rs.next())
			{
          %>          
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4) %></i></td>
            <td><%=rs.getString(5) %></td>
            <td><a href="editProduct.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <% 
	
	        }
		}
		catch(Exception e)
		{
	
		}

%>
        </tbody>
      </table>
      <br>
      <br>
      <br>


</body>
</html>