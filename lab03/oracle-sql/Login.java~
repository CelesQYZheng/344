/*
  File: TestLogin.java
  August 2002
*/

import java.io.*;
import java.util.*;
import java.sql.*;


/**
 * This program reads a user's pass.dat and connects to Oracle.
 *
 * @author Paul Werstein
 */

public class Login {


    public static void main (String[] args) {
	new Login().go();
    }

    // This is the function that does all the work
    private void go() {

	// Read pass.dat
	UserPass login = new UserPass();
	String user = login.getUserName();
	String pass = login.getPassWord();
	String host = "silver";

	Connection con = null;
        
        try {

	   // Register the driver and connect to Oracle
	    DriverManager.registerDriver 
		(new oracle.jdbc.driver.OracleDriver());
	    String url = "jdbc:oracle:thin:@" + host + ":1527:cosc344";
            System.out.println("url: " + url);
	    con = DriverManager.getConnection(url, user, pass);
	    System.out.println("Connected to Oracle");

            Statement stmt = con.createStatement();
            // Create and execute the SQL statement
            
            ResultSet result = stmt.executeQuery("SELECT * FROM department WHERE mgrssn = '333445555'");
            // part 2
            System.out.println("PART 2");
            while(result.next()){
            System.out.println(result.getString("dname")+" "+result.getInt("dnumber")+" "+result.getString("mgrssn")+" "+result.getString("mgrstartdate"));
            }
            //Part 3
            int rowsUpdate = stmt.executeUpdate("UPDATE employee SET salary = salary*1.1");
            System.out.println(rowsUpdate+ "row" +(rowsUpdate == 1 ? "" : "s" )+ "updated.");

            if(1 == rowsUpdate){
                con.commit();
            }
    
	} catch (SQLException e) {
	    System.out.println(e.getMessage());
	    System.exit(1);

	} finally {
	    if (con != null) {
		try {
		    con.close();
		} catch (SQLException e) {
		    quit(e.getMessage());
		}
	    }
	}

            
    }  // end go()

    // Used to output an error message and exit
    private void quit(String message) {
	System.err.println(message);
	System.exit(1);
    }

} // end class TestLogin


