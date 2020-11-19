<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		<%=price1 != null ? price1 : "none"%><br> 
		이하:
		<%=price2 != null ? price2 : "none"%><br>
	</div>
	<p>Enter the Stock</p>
	<input type="text" id="stock1" placeholder="이상">
	<input type="text" id="stock1" placeholder="이하">
	<div>
		이상:
		<%=stock1 != null ? stock1 : "none"%><br> 
		이하:
		<%=stock2 != null ? stock2 : "none"%><br>
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
			String query = "SELECT * " + " FROM PRODUCT ";
			
			if (price1==null) {
				if (stock1==null) query += "WHERE PRODUCT.PRICE ";
				else if (stock2==null) {
				  query += "WHERE PRODUCT.PRICE ";
			 	} else if (stock1!=null && stock2!=null) {
				  query += "WHERE PRODUCT.PRICE ";
				} else query += "WHERE PRODUCT.PRICE ";
			}

			if (price2==null) {
				if (stock1==null) query += "WHERE PRODUCT.PRICE ";
				else if (stock2==null) {
				  query += "WHERE PRODUCT.PRICE ";
				} else if (stock1!=null && stock2!=null) {
				  query += "WHERE PRODUCT.PRICE ";
				} else query += "WHERE PRODUCT.PRICE ";
			}
			if (price1==null && price2==null && stock1==null && stock2==null) query += "WHERE PRODUCT.PRICE ";
			else query += "WHERE PRODUCT.PRICE >= "+price1+"AND PRODUCT.PRICE <= "+price2+"AND PRODUCT.STOCK >= "+stock1+"AND PRODUCT.STOCK <= ";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
		%><tr>
			<%
				
			%><td><%=rs.getString("PHONE")%></td>
			<%
				
			%><td><%=rs.getString("EMAIL")%></td>
			<%
				
			%><td><%=rs.getString("NAME")%></td>
			<%
				
			%><td><%=rs.getInt("ORDER_PRICE")%></td>
			<%
				
			%><td><%=rs.getInt("PRODUCT_ID")%></td>
			<%
				
			%><td><%=rs.getInt("ORDER_COUNT")%></td>
			<%
				
			%>
		
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
			  window.location.href =
			    'parameter_query4.jsp?price1=' + price1 ??
			    'none' + '&price2=' + price2 ??
			    'none' + '&stock1=' + stock1 ??
			    'none' + '&stock2=' + stock2 ??
			    'none';
			}
	</script>
</body>
</html>