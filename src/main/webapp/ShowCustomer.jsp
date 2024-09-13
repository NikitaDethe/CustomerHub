<%@page import="java.util.List"%>

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
<title>search on paymode</title>
<link rel="stylesheet" href="bootstrap.min.css">
</head>
<body style="margin-top: 35px; background-color: lightgray;">
    <div class="container">
        <h2 class="display-4" align="center" style="color: purple;">All Customer Report</h2>
        <hr>
        <a href="index.jsp"><img src="image/homepage.jpg" alt="Home" width="65"></a>
        <br><br>
        
        <%
        Configuration cfg=new Configuration().configure();
        SessionFactory sf=cfg.addAnnotatedClass(Customer.class).buildSessionFactory();
        Session ses=sf.getCurrentSession();
        ses.beginTransaction();
        
        Query<Customer> q=ses.createQuery("from Customer");
        List<Customer> lst=q.getResultList();
        out.println("<h4>Record Retrived:</h4> " +lst.size());
        
        %>
        
        <table class="table table-bordered" >
        <tr>
            <th style="background-color:rgb(142, 178, 233);">Customer No</th>
            <th style="background-color:rgb(142, 178, 233);">Customer Name</th> 
            <th style="background-color:rgb(142, 178, 233);">City</th>
            <th style="background-color:rgb(142, 178, 233);">Product Name</th>
            <th style="background-color:rgb(142, 178, 233);"> Product Id</th>
            <th style="background-color:rgb(142, 178, 233);">Price</th>
            <th style="background-color:rgb(142, 178, 233);">Paymode</th>
        </tr>
        <%
        Customer c;
        for(int i=0; i<lst.size();i++)
        {
        	c=lst.get(i);
        	%>
        	<tr>
        <td><%=c.getCustno() %></td>
        <td><%=c.getCustnm() %></td>
        <td><%=c.getCity() %></td>
        <td><%=c.getProdnm() %></td>
        <td><%=c.getProdid() %></td>
        <td><%=c.getPrice() %></td>
        <td><%=c.getPaymode() %></td>
        </tr>
        <%
        }
        
        %>
        </table>
        </div>
</body>
</html>