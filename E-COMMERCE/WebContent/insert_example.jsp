<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Example</title>
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
%>
	<form action="action/action_insert.jsp">
		<p>카테고리 ID</p>
		<select name="category_id" id="select">
<%		String query = "SELECT ID, NAME FROM CATEGORY";
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
		%><option value="<%=rs.getInt("ID")%>"><%=rs.getString("NAME")%></option><%
		}%>
		</select>
		<p>이름</p>
		<input type="text" name="name"></input>
		<p>가격</p>
		<input type="number" name="price"></input>
		<p>재고</p>
		<input type="number" name="stock"></input>
		<p>설명</p>
		<input type="text" name="description"></input>
		<p>원산지</p>
		<input type="text" name="origin"></input> <input type="submit"
			value="Submit"><input type="button" value="Reset">
	</form>
	<%		con.commit();
		//step5 close the connection object  
		con.close();

	} catch (Exception e) {
		System.out.println(e);
	}
	%>
</body>
</html>