package com.javatpoint.dao;
import com.javatpoint.beans.Emp;
import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  
public class EmpDao {  
  
    public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin","mis_user","india#123");  
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
  
    public static List<Emp> getRecords(int start,int total){  
        List<Emp> list=new ArrayList<Emp>();  
	Emp es = null;
        try{  
            Connection con=getConnection();  
            PreparedStatement ps=con.prepareStatement(  
"select * from users limit "+(start-1)+","+total);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
                 es = new Emp();  
                es.setId(rs.getInt(1));  
                es.setFullname(rs.getString(2));  
               es.setEmail(rs.getString(3));  
	        es.setPassword(rs.getString(4));

                list.add(es);  
            }  
            con.close();  
        }catch(Exception e){System.out.println(e);}  
        return list;  
    }  
}  

