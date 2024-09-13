<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.List"%>

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
<title>search on paymode</title>
<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body style="margin-top: 35px; background-color: lightgray;">
    <div class="container"> 
        <h2 class="display-4" align="center" style="color: purple;">All Customer Report</h2>
        <hr>
        <a href="index.jsp"><img src="image/homepage.jpg" alt="Home" width="65"></a>
        <br><br>
        <br>
        <%
        
        
	Configuration cfg=new Configuration().configure();
        SessionFactory sf=cfg.addAnnotatedClass(Customer.class).buildSessionFactory();
        Session ses=sf.getCurrentSession();
        ses.beginTransaction();
        
        String paymode=request.getParameter("paymode");
        Query<Customer> q=ses.createQuery("from Customer where paymode=:p1");
        q.setParameter("p1",paymode);
        List<Customer> lst=q.getResultList();
        
        if(lst.size()>0)
        {
        	%>
        	<table class="table table-bordered" >
                <tr >
                    <th style="background-color:rgb(142, 178, 233);">Customer Number</th>
                    <th style="background-color:rgb(142, 178, 233);">Customer Name</th>
                    <th style="background-color:rgb(142, 178, 233);">City</th>
                    <th style="background-color:rgb(142, 178, 233);">Product Name</th>
                     <th style="background-color:rgb(142, 178, 233);">Product ID</th>
                     <th style="background-color:rgb(142, 178, 233);">Price</th>
                     
                </tr>
           
           
           <%
           Customer c;
           c=lst.get(0);
           
           %>
        	<tr>
        	<td><%=c.getCustno()%></td>
        	<td><%=c.getCustnm()%></td>
 		  	<td><%=c.getCity() %> </td>
 		  	<td><%=c.getProdnm() %></td>
 		  	<td><%=c.getProdid() %></td>
 		  	<td><%=c.getPrice() %></td>
 		  	</tr>
        <%
        } 
        else
        {
        	out.println("<h4>Something Went wrong...Please try again...</h4> ");
        }
        ses.close();
         %>
        </table>
    
    </div>
</body>
</html>