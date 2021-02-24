import java.sql.*;
public class first{
	public static void main(String[] arg)
	{
		System.out.println("hello world");
		try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myadmin","mis_user","india#123");
//here sonoo is database name, root is username and password.
Statement stmt=con.createStatement();
System.out.println("conneccted");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

	}
}

