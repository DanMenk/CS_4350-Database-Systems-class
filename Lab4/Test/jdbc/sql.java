package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class sql
{

   public static void main(String[] args) throws Exception
   {

      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "Festival12#");

      Statement st = con.createStatement();
      ResultSet rs = st.executeQuery("SELECT * FROM Persons WHERE city = \"Los Angeles\"");
      String LastName = rs.getString("LastName");
      String FirstName = rs.getString("FirstName");
      String City = rs.getString("City");

      System.out.println(FirstName + " " + LastName + " " + City);
      st.close();
      con.close();
   }
}