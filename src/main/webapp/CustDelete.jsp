<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.nikita.entities.Customer"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body style="margin-top: 45px; background-color: rgb(137, 182, 220);">
    <div class="container">
        <h1  style="color:purple;">Deleting Customers...</h1>
        <hr>
      <a href="index.jsp"><img src="image/homepage.jpg" alt="Home" width="55"></a>
      <br>
      <%
      String custnm=request.getParameter("custnm");
      
      Configuration cfg=new Configuration().configure();
      SessionFactory sf=cfg.addAnnotatedClass(Customer.class).buildSessionFactory();
      Session ses=sf.getCurrentSession();
      ses.beginTransaction();
      
      Query<Customer> q=ses.createQuery("delete from Customer where custnm=:p1");
      q.setParameter("p1",custnm);
      
      int cnt=q.executeUpdate();
      ses.getTransaction().commit();
      
      if(cnt>0)
      {
    	  out.println("<h4>Delete Customer Successfully...</h4>");
      }
      else
      {
    	  out.println("<h4>Delete Customer Failed...</h4>");
      }
      
      %>
      
      </div>
</body>
</html>