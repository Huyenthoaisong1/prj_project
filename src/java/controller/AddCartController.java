/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author SAP-LAP-FPT
 */
public class AddCartController extends HttpServlet {

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
            String name=request.getParameter("name");
        ProductDBContext db = new ProductDBContext();
        Product product = db.getProduct(name);

        Order order = (Order) request.getSession().getAttribute("shoppingcart");

        if (order == null) {
            order = new Order();
        }

        boolean isExist = false;
        for (OrderDetail detail : order.getDetails()) {
            if (detail.getProduct().getName() == null ? product.getName() == null : detail.getProduct().getName().equals(product.getName())) {
                isExist = true;
                detail.setQuantity((int) (detail.getQuantity() + 1));
                break;
            }
        }
        if (!isExist) {
            OrderDetail detail = new OrderDetail();
            detail.setOrder(order);
            detail.setProduct(product);
            detail.setQuantity(1);
            detail.setUnitPrice(product.getPrice());
            order.getDetails().add(detail);
        }

        request.getSession().setAttribute("shoppingcart", order);
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
