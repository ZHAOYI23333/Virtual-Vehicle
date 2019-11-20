package edu.osu.cse5234.business.view;

import java.util.List;

import edu.osu.cse5234.model.Item;

public class Inventory implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4741276659145606965L;
	public List<Item> items;
	public Inventory() {}
	
	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
}
