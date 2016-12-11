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
<%@ page import="java.sql.*" %>
<%
String a=request.getParameter("value1");
out.println(a);

%>
<%
String url = "jdbc:mysql://localhost:3306/"; 
String dbName = "mydb"; 
String driver = "com.mysql.jdbc.Driver"; 
String user = "root";  
String password = ""; 
try {
	Class.forName(driver).newInstance(); 
	Connection con = DriverManager.getConnection(url+dbName, user, password); 
	PreparedStatement ps=con.prepareStatement("delete from playlist where name=?");
	//DELETE FROM `playlist` WHERE Name='Crawling' 
	Statement st= con.createStatement();    
	ps.setString(1,a);
	int i=ps.executeUpdate();
	out.println(" removed");
	ResultSet rs; 
	//st.executeQuery("DELETE FROM `playlist` WHERE Name='Crawling'"); 
	rs=st.executeQuery("select * from playlist"); 
	String f1,f2,f3,f4;      

	out.println("<TABLE border=\"10\" bgcolor=\"#00CCCC\" CELLSPACING=\"0\" CELLPADDING=\"3\" BORDER=\"1\">");
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
	  	//out.println("<TD><form name=\"f2\" action=\"http://tegos.kz/new/mp3_full/Fall_Out_Boy_-_Centuries.mp3 \"  ><input type=\"hidden\" id= \"myField1\" value=\"\" name=\"value1\"/><input  type=\"submit\" name=\"value1\" id =\"myField1\" value=\"Download\" /></form></TD>");
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
 <form action="play_songs.jsp" method="get">
<input type=submit name=PlayMySongs value=PlayMySongs>
</form>
<form action="display_songs.jsp" method="get">
<input type=submit name=SHowMyPlaylist value=ShowMyPlaylist>
</form>
</body>
</html>