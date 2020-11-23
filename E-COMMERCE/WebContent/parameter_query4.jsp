<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parameter example</title>
</head>
<body>
	<%
		String price1 = request.getParameter("price1");
	String price2 = request.getParameter("price2");
	String stock1 = request.getParameter("stock1");
	String stock2 = request.getParameter("stock2");
	%>
	<p>Enter the Price</p>
	<input type="text" id="price1" placeholder="이상">
	<input type="text" id="price2" placeholder="이하">
	<div>
		이상:
		<%=price1 != null && price1.length() != 0 ? price1 : "none"%><br> 이하:
		<%=price2 != null && price2.length() != 0 ? price2 : "none"%><br>
	</div>
	<p>Enter the Stock</p>
	<input type="text" id="stock1" placeholder="이상">
	<input type="text" id="stock2" placeholder="이하">
	<div>
		이상:
		<%=stock1 != null && stock1.length() != 0 ? stock1 : "none"%><br> 이하:
		<%=stock2 != null && stock2.length() != 0 ? stock2 : "none"%><br>
	</div>
	<input type="button" onclick="click_search()" value="submit">
	<table border="1">
		<tr>
			<td>NAME</td>
			<td>PRICE</td>
			<td>STOCK</td>
			<td>DESCRIPTION</td>
			<td>ORIGIN</td>
		</tr>
		<%
			try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");
			Statement stmt = con.createStatement();
			String query = "SELECT " + " NAME, PRICE, STOCK, " + " DESCRIPTION, ORIGIN " + " FROM " + " PRODUCT " + " WHERE "
			+ " 1 = 1";

			/* if (price1 != null) {
				if (stock1 != null)
			query += "WHERE PRODUCT.PRICE <=";
				else if (stock2 != null) {
			query += "WHERE PRODUCT.PRICE ";
				}
			}
			
			if (price2 != null) {
				if (stock1 != null)
			query += "WHERE PRODUCT.PRICE ";
				else if (stock2 != null) {
			query += "WHERE PRODUCT.PRICE ";
				}
			} */

			if (price1 != null && price1.length() != 0) {
				query += " AND PRODUCT.PRICE >= " + price1 + " ";
			}
			if (price2 != null && price2.length() != 0) {
				query += " AND PRODUCT.PRICE <= " + price2 + " ";
			}
			if (stock1 != null && stock1.length() != 0) {
				query += " AND PRODUCT.STOCK >= " + stock1 + " ";
			}
			if (stock2 != null && stock2.length() != 0) {
				query += " AND PRODUCT.STOCK >= " + stock2 + " ";
			}

			System.out.println(query);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
		%><tr>
			<%
				
			%><td><%=rs.getString("NAME")%></td>
			<%
				
			%><td><%=rs.getInt("PRICE")%></td>
			<%
				
			%><td><%=rs.getInt("STOCK")%></td>
			<%
				
			%><td><%=rs.getString("DESCRIPTION")%></td>
			<%
				
			%><td><%=rs.getString("ORIGIN")%></td>
			<tr>
			<%
				}

			con.commit();
			//step5 close the connection object  
			con.close();

			} catch (Exception e) {
				System.out.println(e);
			}
			%>
		
		
		
	
		
	</table>
	<script>
		function click_search() {
			const price1 = document.getElementById('price1').value;
			const price2 = document.getElementById('price2').value;

			const stock1 = document.getElementById('stock1').value;
			const stock2 = document.getElementById('stock2').value;

			redirect_with_get_params(price1, price2, stock1, stock2);
		}

		function redirect_with_get_params(price1, price2, stock1, stock2) {
			window.location.href = 'parameter_query4.jsp?price1=' + price1
					+ '&price2=' + price2 + '&stock1=' + stock1 + '&stock2='
					+ stock2;
		}
	</script>
</body>
</html>