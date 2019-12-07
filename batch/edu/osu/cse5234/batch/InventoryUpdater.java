package edu.osu.cse5234.batch;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class InventoryUpdater {
	
	public InventoryUpdater() {
		
	}
	
	private static Connection createConnection() throws SQLException, ClassNotFoundException {
		Class.forName("org.h2.Driver");
		Connection conn = DriverManager.getConnection("jdbc:h2:/Users/zhaoyi23333/myusedcar", "sa", "");
		return conn;
	}
	
	private static Collection<Integer> getNewOrders(Connection conn) throws SQLException {
		Collection<Integer> orderIds = new ArrayList<Integer>();
		ResultSet rset = conn.createStatement().executeQuery("select ID from CUSTOMER_ORDER where STATUS = 'NEW' ");
		while (rset.next()) {
			orderIds.add(rset.getInt("ID"));
		}
		return orderIds;
	}
	
	private static Map<Integer, Integer> getOrderedLineItems(Collection<Integer> newOrderIds,
			Connection conn) throws SQLException {
		Map<Integer, Integer> res = new HashMap<>();
		Iterator<Integer> it = newOrderIds.iterator();
		while (it.hasNext()) {
			int orderId = it.next();
			ResultSet rs = conn.createStatement().executeQuery(
					"SELECT ITEM_NUMBER, QUANTITY FROM CUSTOMER_ORDER_LINE_ITEM WHERE CUSTOMER_ORDER_ID_FK =" + orderId);
			while (rs.next()) {
				Integer item = rs.getInt("ITEM_NUMBER");
				Integer quant = rs.getInt("QUANTITY");
				if (res.containsKey(item)) {
					res.replace(item, res.get(item) + quant);
				} else {
					res.put(item, quant);
				}
				res.put(rs.getInt("ITEM_NUMBER"), rs.getInt("QUANTITY"));
			}
		}
		return res;
	}
	
	private static void udpateInventory(Map<Integer, Integer> orderedItems, 
			Connection conn) throws SQLException {
		Iterator<Integer> it = orderedItems.keySet().iterator();
		while (it.hasNext()) {
			Integer item = it.next();
			Integer quant = orderedItems.get(item);
			conn.createStatement().executeQuery(
					"UPDATE ITEM SET AVAILABLE_QUANTITY = AVAILABLE_QUANTITY - " + quant + " WHERE ITEM_NUMBER =" + item);
		}
		System.out.println("Item number in storage has been updated. ");
	}
	
	private static void udpateOrderStatus(Collection<Integer> newOrderIds, 
			Connection conn) throws SQLException {
		Iterator<Integer> it = newOrderIds.iterator();
		while (it.hasNext()) {
			Integer id = it.next();
			conn.createStatement().executeQuery(
					"UPDATE CUSTOMER_ORDER SET STATUS = 'Old' WHERE ID = " + id);
		}
		System.out.println("Order has been processed. ");
	}
	
	public static void main(String[] args) {
		
		System.out.println("Starting Inventory Update ...");
		try {
			Connection conn = createConnection();
			Collection<Integer> newOrderIds = getNewOrders(conn);
			Map<Integer, Integer> orderedItems = getOrderedLineItems(newOrderIds, conn); udpateInventory(orderedItems, conn);
			udpateOrderStatus(newOrderIds, conn);
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
