package com.nikita.servlets;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.*;

import com.nikita.entities.Customer;

/**
 * Servlet implementation class AddCustomer
 */
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int prodid,price;
		String custnm,city,prodnm,paymode;
		
		// receive data from html form
		custnm=request.getParameter("custnm");
		city=request.getParameter("city");
		prodnm=request.getParameter("prodnm");
		prodid=Integer.parseInt(request.getParameter("prodid"));
		price=Integer.parseInt(request.getParameter("price"));

		paymode=request.getParameter("paymode");
		
		// assign data to entity bean
		Customer obj=new Customer();
		obj.setCustnm(custnm);
		obj.setCity(city);
		obj.setProdnm(prodnm);
		obj.setProdid(prodid);
		obj.setPrice(price);
		obj.setPaymode(paymode);
		
		// load configuration and establish session with DB
		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.addAnnotatedClass(Customer.class).buildSessionFactory();
		Session ses=sf.getCurrentSession();
		
		ses.beginTransaction();
		
		// save the object data in database table
		 ses.persist(obj);
		 ses.getTransaction().commit();
		 
		
		// System.out.println("New Customer added ");
		 response.sendRedirect("CustomerSuccess.jsp");
		
	}
}
		
	


