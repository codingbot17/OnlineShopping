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
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fa fa-arrow-circle-left'> Back</i></a></h2>
<%
          try
		  {
        	String id=request.getParameter("id");
			Connection con=ConnectionProvider.getCon();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from product where id='"+id+"'");
			while(rs.next())
			{
          %>  
<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.print(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
<input class="input-style" type="text" name="name" value="<%=rs.getString(2)%>" required="required">
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="category" value="<%=rs.getString(3)%>" required="required">
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="text" name="price" value="<%=rs.getString(4)%>" required="required">
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="yes">Yes</option>
<option value="no">No</option>
</select>
 <hr>
</div>
 <button class="button">Save<i class='far fa-arrow-alt-circle-right'></i></button>

</form>
<%
			}
		  }
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
<br><br><br>
</body>
</html>