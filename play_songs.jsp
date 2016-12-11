<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
background-image:url(playlist.jpg);
}
</style>
<title>MyPlaylist</title>
</head>
<body>

<%@ page import="java.sql.*" %>

<%
String url = "jdbc:mysql://localhost:3306/"; 
String dbName = "mydb"; 
String driver = "com.mysql.jdbc.Driver"; 
String user = "root";  
String password = ""; 
try {
	Class.forName(driver).newInstance(); 
	Connection con = DriverManager.getConnection(url+dbName, user, password); 
	PreparedStatement ps=con.prepareStatement("insert into playlist values(?,?,?)");  
	Statement st= con.createStatement();
ResultSet rs; 
	rs=st.executeQuery("select * from playlist"); 
	String f1,f2,f3,f4;      

	out.println("<TABLE align = \"center\" border=\"10\" bgcolor=\"#00CCCC\" CELLSPACING=\"0\" CELLPADDING=\"3\" BORDER=\"1\">");
	out.println("<TR><TH>NAME</TH><TH>ARTIST</TH><TH>DURATION</TH><TH>PLAY</TH></TR>");

	while(rs.next())
	{
	String x=rs.getString("Name");
  	String y=rs.getString("Artist");
  	String z=rs.getString("Duration");
  	out.println("<TR>");
  	out.println("  <TD>" + x + "</TD>");
  	out.println("  <TD>" + y + "</TD>");
  	out.println("  <TD>" + z + "</TD>");
  	if(x.equals("Awake And Alive"))
		{  		
	out.println("<TD><form name=\"f2\" action=\"Awake And Alive.mp3\"  ><input type=\"hidden\" id= \"myField1\" value=\"\" name=\"value1\"/><input  type=\"submit\" name=\"value1\" id =\"myField1\" value=\"PLAY\" /></form></TD>");
	
	}
  	else if(x.equals("Centuries"))
  		{  		
  	out.println("<TD><form name=\"f2\" action=\"centuries.mp3\"  ><input type=\"hidden\" id= \"myField1\" value=\"\" name=\"value1\"/><input  type=\"submit\" name=\"value1\" id =\"myField1\" value=\"PLAY\" /></form></TD>");
	}
  	else if(x.equals("Crawling"))
  	{
  		out.println("<TD><form name=\"f2\" action=\"Crawling.mp3\"  ><input type=\"hidden\" id= \"myField1\" value=\"\" name=\"value1\"/><input  type=\"submit\" name=\"value1\" id =\"myField1\" value=\"PLAY\" /></form></TD>");
  	}
  
  	else if(x.equals("In the End"))
  	{
  		out.println("<TD><form name=\"f2\" action=\"In the End.mp3\"  ><input type=\"hidden\" id= \"myField1\" value=\"\" name=\"value1\"/><input  type=\"submit\" name=\"value1\" id =\"myField1\" value=\"PLAY\" /></form></TD>");
  	}
	else if(x.equals("Numb"))
  	{
  		out.println("<TD><form name=\"f2\" action=\"Numb.mp3\"  ><input type=\"hidden\" id= \"myField1\" value=\"\" name=\"value1\"/><input  type=\"submit\" name=\"value1\" id =\"myField1\" value=\"PLAY\" /></form></TD>");
  	}
	else if(x.equals("Whispers in the Dark"))
  	{
  		out.println("<TD><form name=\"f2\" action=\"Whispers in the Dark.mp3\"  ><input type=\"hidden\" id= \"myField1\" value=\"\" name=\"value1\"/><input  type=\"submit\" name=\"value1\" id =\"myField1\" value=\"PLAY\" /></form></TD>");
  	}
  	
	}
	
	
out.println("</TABLE>");
}
  catch(SQLException e) {
  out.println("SQLException: " + e.getMessage() + "<BR>");
  while((e = e.getNextException()) != null)
     out.println(e.getMessage() + "<BR>");
  }
catch(ClassNotFoundException e) {
  out.println("ClassNotFoundException: " + e.getMessage() + "<BR>");
  }
 %>
<form action="Playlist.html" method="get">
<input type=submit name=Main value=Main>
</form>

</body>
</html>