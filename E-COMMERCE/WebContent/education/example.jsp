<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EXAMPLE</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>구매자명</td>
			<td>구매가격</td>
		</tr>
		<%
			try {
			//step1 load the driver class  
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//step2 create  the connection object  
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");

			//step3 create the statement object  
			Statement stmt = con.createStatement();

			//step4 execute query  
			String select_query1 = "SELECT MEMBER.NAME, PAYMENT_HISTORY.ORDER_PRICE FROM MEMBER, PAYMENT_HISTORY WHERE MEMBER.ID=PAYMENT_HISTORY.MEMBER_ID";

			ResultSet rs = stmt.executeQuery(select_query1);
			while (rs.next()) {
				String name = rs.getString("NAME");
				int order_price = rs.getInt("ORDER_PRICE");
		%><tr>
			<%
				
			%><td><%=name%></td>
			<%
				
			%><td><%=order_price%></td>
			<%
				
			%>
		
		<tr>
			<%
				}

			//step5 close the connection object  
			con.close();

			} catch (Exception e) {
				System.out.println(e);
			}
			%>
		
	</table>
	<%
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");
		
		Statement insert_stmt = con.createStatement();
		Statement select_stmt = con.createStatement();
		Statement update_stmt = con.createStatement();
		
		String select_query = 
		"SELECT "+
		"PAYMENT_HISTORY.ID AS ID, "+
		"MEMBER.NAME AS ORDERER, "+
		"PRODUCT.NAME AS PRODUCT_NAME , "+
		"PAYMENT_HISTORY.ORDER_COUNT, "+
		"PAYMENT_HISTORY.ORDER_PRICE "+
		"FROM "+
		"PAYMENT_HISTORY, PRODUCT, MEMBER "+
		"WHERE "+
		"MEMBER.ID=PAYMENT_HISTORY.MEMBER_ID "+
		"AND "+
		"PRODUCT.ID=PAYMENT_HISTORY.PRODUCT_ID";
		ResultSet rs = select_stmt.executeQuery(select_query);
		
		while (rs.next()) {
			
			int ID = rs.getInt("ID");
			
			String orderer = rs.getString("ORDERER");
			String product = rs.getString("PRODUCT_NAME");
			String order_count = rs.getString("ORDER_COUNT");
			String order_price = rs.getString("ORDER_PRICE");
			
			String log = orderer+"님이 "+product+" 상품 "+order_count+"개를 "+order_price+"원에 구매하셨습니다.";
			String insert_query = "INSERT INTO PURCHASE_LOG(ID,LOG) VALUES(" + ID + ", \'" + log + "\') ";
			System.out.println(String.format(insert_query, ID));

			insert_stmt.executeQuery(String.format(insert_query, ID));
		}
		con.commit();
		con.close(); 
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
</body>
</html>