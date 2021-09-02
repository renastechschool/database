package org.commons;


import java.sql.*;

public class DBConnector {
    // we need a db connection
    static Connection dbConnection = null;

    // flag to check if the DB is properly init
    static boolean isDBInit = false;

    // function to init DB
    public static void InitialiseDatabase() {
        if (isDBInit)
            return;
        try {
            dbConnection = DriverManager.getConnection(
                    "jdbc:mysql://rt-db-3.ctigbjf2wamf.us-east-1.rds.amazonaws.com/hr?user=rt_1&password=rt_1"
            );
            System.out.println("Database connection initialized");
            isDBInit = true;
        } catch (SQLException sqlExcept) {
            System.out.println(sqlExcept.getMessage());
        }
    }

    public static void CloseConnection() {
        if (!isDBInit)
            return;
        try {
            if (dbConnection != null) {
                dbConnection.close();
            }
            System.out.println("Database connection closed");
            isDBInit = false;
        } catch (SQLException sqlExcept) {
            System.out.println(sqlExcept.getMessage());
        }
    }

    public static Connection getDbConnection() {
        if (dbConnection == null)
            InitialiseDatabase();

        return dbConnection;
    }
}
