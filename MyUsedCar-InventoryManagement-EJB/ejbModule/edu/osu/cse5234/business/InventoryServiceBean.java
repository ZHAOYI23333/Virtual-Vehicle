package edu.osu.cse5234.business;

import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.model.Item;

import java.util.List;

import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Session Bean implementation class InventoryServiceBean
 */
@Stateless
@Remote(InventoryService.class)
public class InventoryServiceBean implements InventoryService {
	String MY_QUERY = "Select i from Item i";
		
	@PersistenceContext
    EntityManager entityManager;
    /**
     * Default constructor. 
     */
    public InventoryServiceBean() {
        // TODO Auto-generated constructor stub
    }

    
    public EntityManager getEntityManager() {
		return entityManager;
	}


	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}


	public Inventory getAvailableInventory() {
		
    	Inventory order = new Inventory();
		order.setItems(entityManager.createQuery(MY_QUERY, Item.class).getResultList());
		return order;
    }
    
    
    public boolean validateQuantity(List<Item> items) {
    	List<Item> inventory = this.getAvailableInventory().getItems();

    	for (int i = 0; i < inventory.size(); i++) {
    		
    		if (inventory.get(i).getAvailableQuantity() <
    				items.get(i).getQuantity()) {
    			return false;
    		}
    	}
    	return true;
    }
    
    public boolean updateInventory(List<Item> items) {return true;}

}
