/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author sioni
 */
public class ProductDBContext extends DBContext {
        public ArrayList<Product> GetPatients() {
        ArrayList<Product> product = new ArrayList<>();
        try {
            String sql = "SELECT TOP (1000) [name]\n" +
"      ,[price]\n" +
"      ,[type]\n" +
"  FROM [SE1611].[dbo].[Products]";
         
            PreparedStatement stm = connection.prepareStatement(sql);
          
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product P = new Product();
                P.setName(rs.getString("name"));
                P.setPrice(rs.getString("price"));
                P.setType(rs.getString("type"));
                product.add(P);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }
                public Product getProduct(String name) {
   
        try {
            String sql = "SELECT [name]\n" +
"      ,[price]\n" +
"      ,[type]\n" +
"  FROM [dbo].[Products]\n" +
"  where [name]=?";
         
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1,name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product P = new Product();
                P.setName(rs.getString("name"));
                P.setPrice(rs.getString("price"));
                P.setType(rs.getString("type"));
                
                return P;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
            public void updateProduct(Product s) {
        String sql = "UPDATE [dbo].[Products]\n" +
"   SET [name] = ?\n" +
"      ,[price] = ?\n" +
"      ,[type] = ?\n" +
" WHERE [name] = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, s.getName());
            stm.setString(2, s.getPrice());
            stm.setString(3, s.getType());
            stm.setString(4, s.getName());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm != null)
                try {
                    stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(connection != null)
                try {
                    connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
                        public void insertProduct(Product s) {
       String sql = "INSERT INTO [Products]\n" +
                    "           ([name]\n" +
                    "           ,[price]\n" +
                    "           ,[type])\n" +
                    "     VALUES\n" +
                    "           (?\n" +
                    "           ,?\n" +
                    "           ,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, s.getName());
            stm.setString(2, s.getPrice());
            stm.setString(3, s.getType());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm != null)
                try {
                    stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(connection != null)
                try {
                    connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
                          public void deleteProduct(Product s) {
        String sql = "DELETE FROM [dbo].[Products]\n" +
"      WHERE [name]=?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, s.getName());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            if(stm != null)
                try {
                    stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(connection != null)
                try {
                    connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
}


