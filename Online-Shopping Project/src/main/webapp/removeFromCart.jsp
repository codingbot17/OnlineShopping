<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"' and address is NULL ");
	response.sendRedirect("myCart.jsp?msg=removed");
}

catch(Exception e)
{
	System.out.print(e);
}
%>  
    