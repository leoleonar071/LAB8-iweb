package com.example.tres_mosqueteros.Models.Daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public abstract class DaoBase {

    public Connection getConection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }

        String username = "root";
        String password = "root";
        String database = "lostresmosqueteros";
        String url = "jdbc:mysql://localhost:3306/lostresmosqueteros";

        return DriverManager.getConnection(url, username, password);

    }
}
