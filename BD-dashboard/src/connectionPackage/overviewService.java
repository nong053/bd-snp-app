package connectionPackage;

import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import org.json.JSONArray;
import org.json.JSONException;


public class overviewService {


 
  String optionOverview="";

  
  public void setOptionOverview(String query,String id) {

	    try{
	      Context ctx = new InitialContext();
	      if(ctx == null ) 
	          throw new Exception("Boom - No Context");

	      DataSource ds = 
	            (DataSource)ctx.lookup(
	               "java:comp/env/jdbc/jndiDB");

	      if (ds != null) {
	        Connection conn = ds.getConnection();
	              
	        if(conn != null)  {
	        	
	            Statement stmt = conn.createStatement();
	            ResultSet rst = stmt.executeQuery(query);
	            optionOverview="";
	            optionOverview+="<select class=\"listSelect1\" id=\""+id+"\">";
	            while(rst.next()){
	            	optionOverview+="<option>"+rst.getString(1)+"</option>";
	            }
	            optionOverview+="</select>";
	            
	            conn.close();
	        }
	      }
	    }catch(Exception e) {
	      e.printStackTrace();
	    }
	 }
  
 
  
  
  
 
 
 public String getOptionOverview() { return optionOverview;}

}