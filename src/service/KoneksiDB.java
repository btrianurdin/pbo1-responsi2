/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class KoneksiDB {
    public Connection getConnection(){
        try {
            return DriverManager.getConnection("jdbc:mysql://localhost/db_tokobuku", "root", "");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
