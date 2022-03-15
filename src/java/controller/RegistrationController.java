/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author sioni
 */
public class RegistrationController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
   
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        
        if(!password.equals(repassword))
        {
        request.setAttribute("message3", "Register Unsuccessfully");
         request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
        else 
        {
            AccountDBContext db = new AccountDBContext();
            Account account = db.checkAccountExist(username);
            if (account == null)
                //user chua co
                //login dc
            {
                db.signupAccount(username, password); 
                request.setAttribute("message2", "Register Successfully");
                response.sendRedirect("index.jsp");
          
            }
            else
                //da co user
                //khong the dang ky
            {
            request.setAttribute("message3", "Register Unsuccessfully");
            request.getRequestDispatcher("registration.jsp").forward(request, response);
                
            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      //  processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
