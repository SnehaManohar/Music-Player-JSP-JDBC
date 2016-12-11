<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
background-image:url(redscreen.jpg);
}
</style>
<title>MyPlaylist</title>
</head>
<body>

<script>
<!--Whispers in the dark Skillet 480-->
function myFunction1() {
    //var str = document.getElementById("myTextarea1").value;
    document.getElementById('myField1').value = "lll";

	
}
</script>
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
	//PreparedStatement ps=con.prepareStatement("insert into playlist values(?,?,?)");  
	Statement st= con.createStatement();
ResultSet rs; 
	rs=st.executeQuery("select * from playlist"); 
	String f1,f2,f3,f4;      

	out.println("<TABLE  border=\"10\" bgcolor=\"#00CCCC\" CELLSPACING=\"0\" CELLPADDING=\"3\" BORDER=\"1\">");
	out.println("<TR><TH>NAME</TH><TH>ARTIST</TH><TH>DURATION</TH></TR>");
	//out.println("<td><form name=\"f2\" action=\"play_song.jsp;\" ><input id=\"play\" type=\"submit\" name=\"play\" value=\"play\" /></form></td>");
	
	//Loop through results of query.
while(rs.next())
	{
		String x=rs.getString("Name");
	  	String y=rs.getString("Artist");
	  	String z=rs.getString("Duration");
	  	
	  	out.println("<TR>");
	  	out.println("  <TD>" + x + "</TD>");
	  	out.println("  <TD>" + y + "</TD>");
	  	out.println("  <TD>" + z + "</TD>");
		
	  	//if(x.equals("Centuries"))
			//out.println("<TD><form action=\"playanddel.jsp\" method=\"get\"><input type=hidden name=value1 value=\"Centuries\"/><input type=submit name=value2 value=\"Remove\"></TD>");
	  	//if(x.equals("Awake And Alive"))
			//out.println("<TD><form action=\"playanddel.jsp\" method=\"get\"><input type=hidden name=value1 value=\"Awake And Alive\"/><input type=submit name=value1 value=\"Remove\"></TD>");
	  	//if(x.equals("Crawling"))
			//out.println("<TD><form action=\"playanddel.jsp\" method=\"get\"><input type=hidden name=value1 value=\"Crawling\"/><input type=submit name=value1 value=\"Remove\"></TD>");
	  	//if(x.equals("Numb"))
			//out.println("<TD><form action=\"playanddel.jsp\" method=\"get\"><input type=hidden name=value1 value=\"Numb\"/><input type=submit name=value1 value=\"Remove\"></TD>");
			
	}
	
out.println("</TABLE>");
out.println("<TR><form action=\"playanddel.jsp\" method=\"get\"><input type=submit name=value1 value=\"Awake and Alive\"></TR>");
out.println("<TR><form action=\"playanddel.jsp\" method=\"get\"><input type=submit name=value1 value=\"Centuries\"></TR>");
out.println("<TR><form action=\"playanddel.jsp\" method=\"get\"><input type=submit name=value1 value=\"Crawling\"></TR>");
out.println("<TR><form action=\"playanddel.jsp\" method=\"get\"><input type=submit name=value1 value=\"In the End\"></TR>");
out.println("<TR><form action=\"playanddel.jsp\" method=\"get\"><input type=submit name=value1 value=\"Numb\"></TR>");
out.println("<TR><form action=\"playanddel.jsp\" method=\"get\"><input type=submit name=value1 value=\"Whispers in the Dark\"></TR>");

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
<p><font face="Monotype Corsiva" size="5" color="#FFFF00">Click on the song you wish to delete from playlist</font></p>

</body>
</html>