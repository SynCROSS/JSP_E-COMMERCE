<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>query avg</title>
</head>
<body>

	<%
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");
		
		Statement insert_stmt = con.createStatement();
		Statement select_stmt = con.createStatement();
		Statement update_stmt = con.createStatement();
		
		int col1;
		int col2;
		int col3;
		int col4;
		
		for (int i = 1; i <= 100; i++) {
			col1 = (int) (Math.random() * 100);
			col2 = (int) (Math.random() * 100);
			col3 = (int) (Math.random() * 100);
			col4 = (int) (Math.random() * 100);
			
			String insert_query = "INSERT INTO MORUGATSUYO(ID, COL1, COL2, COL3, COL4) VALUES(" + i + "," + col1 + ","+ col2 + "," + col3 + "," + col4 + ") ";
			System.out.println(insert_query);
			insert_stmt.executeQuery(insert_query);
		}
		
		String select_query = "SELECT ID, COL1, COL2, COL3, COL4 FROM MORUGATSUYO WHERE AVG_COL IS NULL";
		ResultSet rs = select_stmt.executeQuery(select_query);
		
		while (rs.next()) {
			int COL1 = rs.getInt("COL1");
			int COL2 = rs.getInt("COL2");
			int COL3 = rs.getInt("COL3");
			int COL4 = rs.getInt("COL4");
			int ID = rs.getInt("ID");

			String update_query = "UPDATE MORUGATSUYO SET AVG_COL = (COL1 + COL2 + COL3 + COL4)/4 WHERE ID = %d";
			System.out.println(String.format(update_query, ID));

			update_stmt.executeQuery(String.format(update_query, ID));
		}
		con.commit();
		con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	%>

</body>
</html>