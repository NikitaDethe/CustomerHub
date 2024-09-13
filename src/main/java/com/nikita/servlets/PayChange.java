package com.nikita.servlets;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.nikita.entities.Customer;

/**
 * Servlet implementation class PayChange
 */
public class PayChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int custno;
		String paymode,changepaymode;
		
		custno=Integer.parseInt(request.getParameter("custno"));
		paymode=request.getParameter("paymode");
		changepaymode=request.getParameter("changepaymode");
		
		Configuration cfg=new Configuration().configure();
		SessionFactory sf=cfg.addAnnotatedClass(Customer.class).buildSessionFactory();
		Session ses=sf.getCurrentSession();
		ses.beginTransaction();
		
		@SuppressWarnings("deprecation")
		Query<Customer> q=ses.createQuery("update Customer set paymode=:p1 where custno=:p2");
		   q.setParameter("p1",changepaymode);
		   q.setParameter("p2",custno );
		   
		   int cnt=q.executeUpdate();
		   ses.getTransaction().commit();
		   
		   if(cnt>0)
		   {
			   System.out.println("Update Account Type Successfully");
			   response.sendRedirect("ChPaySuccess.jsp");
		   }
		   else
		   {
			   System.out.println("Update Failed....");
			   response.sendRedirect("ChPayFail.jsp");

		   }
	}

}
