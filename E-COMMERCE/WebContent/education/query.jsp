<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>query Example</title>
</head>
<body>

	<%
		try {
		//step1 load the driver class  
		Class.forName("oracle.jdbc.driver.OracleDriver");

		//step2 create  the connection object  
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");

		//step3 create the statement object  
		Statement stmt = con.createStatement();

		int a = 1, b = 1;
		for (int i = 0; i < 20; i++) {
			String query = "INSERT " + "INTO " + "EXAMPLE(ID, A, B) " + "VALUES(" + (i+1) + "," + a + "," + b + ") ";
			System.out.println(query);
			stmt.executeQuery(query);
			int c = a + b;
			a = b;
			b = c;
		}
		con.commit();
		//step5 close the connection object  
		con.close();

	} catch (Exception e) {
		System.out.println(e);
	}
	%>

</body>
</html>