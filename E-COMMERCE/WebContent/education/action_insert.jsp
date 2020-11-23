<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
	int category_id = Integer.parseInt(request.getParameter("category_id"));
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	String description = request.getParameter("description");
	String origin = request.getParameter("origin");

	String query = "INSERT " + "INTO " + "PRODUCT(ID, CATEGORY_ID, NAME, PRICE, STOCK, DESCRIPTION, ORIGIN) "
			+ "VALUES(SEQ_PRODUCT.NEXTVAL, %d, '%s', %d, %d, '%s','%s') ";
	try {
		//step1 load the driver class  
		Class.forName("oracle.jdbc.driver.OracleDriver");

		//step2 create  the connection object  
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");

		//step3 create the statement object  
		Statement stmt = con.createStatement();
		
		stmt.executeQuery(String.format(query, category_id, name, price, stock, description, origin));
		con.commit();
		//step5 close the connection object  
		con.close();

	} catch (Exception e) {
		System.out.println(e);
	}
	%>
	<%=String.format(query, category_id, name, price, stock, description, origin)%>
</body>
</html>