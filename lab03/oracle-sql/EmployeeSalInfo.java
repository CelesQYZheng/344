import java.io.*;
import java.util.*;
import java.sql.*;

public class EmployeeSalInfo implements Comparable<EmployeeSalInfo>{
        private String fname, lname;
        private int salary;
        

		public EmployeeSalInfo(String fname, String lname, int salary){
            this.fname = fname;
            this.lname = lname;
            this.salary = salary;
        }
        public int compareTo(EmployeeSalInfo other){
            if(this.salary < other.salary){
                return -1;
            }else{
                return 1;
            }
        }
        public String toString(){
            return fname+ " "+ lname+ " "+ salary;
        }
        
    }
