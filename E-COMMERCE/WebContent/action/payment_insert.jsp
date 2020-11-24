<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
	Calendar cal = Calendar.getInstance();
	
	String order_date = sdf.format(cal.getTime());
	int product_id = Integer.parseInt(request.getParameter("product_id"));
	int member_id = Integer.parseInt(request.getParameter("member_id"));
	int order_count = Integer.parseInt(request.getParameter("order_count"));
	String address = request.getParameter("address");
	
	String product_select_query = "SELECT PRICE FROM PRODUCT WHERE ID="+product_id;
	String insert_query = "INSERT INTO PAYMENT_HISTORY(ID, ORDER_DATE, ORDER_STATUS, ORDER_COUNT, ORDER_PRICE, PRODUCT_ID, MEMBER_ID, ADDRESS) "
			+ "VALUES(SEQ_PAYMENT_HISTORY.NEXTVAL, '%s', '%s', %d, %d, %d, %d, '%s')";
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SMC_USER", "SMC_USER");
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(product_select_query);
		int price;
		rs.next();
		price = rs.getInt("PRICE");
		stmt.executeQuery(String.format(insert_query, order_date, "PAYMENT_WAITING", order_count, order_count*price, product_id, member_id, address));
		con.commit();
		con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
%>