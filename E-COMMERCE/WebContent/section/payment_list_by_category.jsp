<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<h3>카테고리별 판매 목록</h3>
<table border="1">
	<tr>
		<td>카테고리명</td>
		<td>주문 가격</td>
		<td>주문 개수</td>
	</tr>
	<%
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");
		Statement stmt = con.createStatement();
		String query = "SELECT " + " CATEGORY.NAME, " + " SUM(PAYMENT_HISTORY.ORDER_PRICE) AS ORDERED_PRICE, "
		+ " COUNT(PAYMENT_HISTORY.ORDER_PRICE) AS ORDERED_COUNT " + " FROM "
		+ " PAYMENT_HISTORY, CATEGORY, PRODUCT " + "WHERE " + "CATEGORY.ID " + "PRODUCT.CATEGORY_ID "
		+ "AND PRODUCT.ID = PAYMENT_HISTORY.PRODUCT_ID " + "GROUP BY " + "CATEGORY.NAME ";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getString("NAME")%></td>
		<td><%=rs.getInt("ORDERED_PRICE")%></td>
		<td><%=rs.getInt("ORDERED_COUNT")%></td>
	</tr>
	<%
		}
	con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
</table>
