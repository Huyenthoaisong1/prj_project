/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Product;

/**
 *
 * @author SAP-LAP-FPT
 */
public class UpdateController extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name=request.getParameter("name");
     ProductDBContext productDB = new ProductDBContext();
        Product product = productDB.getProduct(name);
        request.setAttribute("product", product);
        
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String raw_name = request.getParameter("name");
        String raw_price = request.getParameter("price");
        String raw_type = request.getParameter("type");
        
        //validate data
        String name = raw_name;
        String price = raw_price;
        String type = raw_type;

        Product prt = new Product();
        prt.setName(name);
        prt.setPrice(price);
        prt.setType(type);
        
        ProductDBContext db = new ProductDBContext();
        db.updateProduct(prt);
        
        //response.getWriter().println("done");
        response.sendRedirect("Search");
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
