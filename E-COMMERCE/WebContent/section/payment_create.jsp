<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<h3>판매 등록</h3>
<table>
	<form action="action/payment_insert.jsp">
		<tr>
			<td>
				<p>상품명</p>
			</td>
			<td><select name="product_id">
					<%
						try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");
						Statement stmt = con.createStatement();

						String query = "SELECT ID, NAME FROM PRODUCT";

						ResultSet rs = stmt.executeQuery(query);
						while (rs.next()) {
					%><option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
					<%
						}
					con.close();
					} catch (Exception e) {
						System.out.println(e);
					}
					%>
			</select></td>
		</tr>
		<tr>
			<td>
				<p>유저명</p>
			</td>
			<td><select name="member_id">
					<%
						try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");
						Statement stmt = con.createStatement();

						String query = "SELECT ID, NAME FROM MEMBER";

						ResultSet rs = stmt.executeQuery(query);
						while (rs.next()) {
					%><option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
					<%
						}
					con.close();
					} catch (Exception e) {
						System.out.println(e);
					}
					%>
			</select></td>
		</tr>
	<tr>
		<td><p>개수</p></td>
		<td><input type="number" name="order_count" /></td>
	</tr>
	<tr>
		<td><p>주소</p></td>
		<td><input type="text" name="address" /></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="제출" /> <input
			type="button" value="다시쓰기" /></td>
	</tr>
	</form>
</table>