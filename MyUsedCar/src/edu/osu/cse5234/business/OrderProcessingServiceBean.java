package edu.osu.cse5234.business;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.jms.ConnectionFactory;
import javax.jms.JMSConnectionFactory;
import javax.jms.JMSContext;
import javax.jms.Queue;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.web.bind.annotation.ModelAttribute;

import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.model.Item;
import edu.osu.cse5234.model.LineItem;
import edu.osu.cse5234.model.Order;
import edu.osu.cse5234.util.ServiceLocator;

/**
 * Session Bean implementation class OrderProcessingServiceBean
 */
@Resource(name="jms/emailQCF", lookup="jms/emailQCF", type=ConnectionFactory.class)

@Stateless
@LocalBean
public class OrderProcessingServiceBean {

    /**
     * Default constructor. 
     */
	
	@PersistenceContext
    EntityManager entityManager;
	
	@Inject
	@JMSConnectionFactory("java:comp/env/jms/emailQCF")
	private JMSContext jmsContext;
	
	@Resource(lookup = "jms/emailQ")
	private Queue queue;

	private void notifyUser(String customerEmail) {
		String message = customerEmail + ":"  +
				"Your order was sucessfully submitted. " +
				"You will hear from us when items are shipped. " +
				new Date();
		System.out.println("Sending message: " + message); 
		jmsContext.createProducer().send(queue, message); 
		System.out.println("Message Sent!");
	}
	 
    
    public EntityManager getEntityManager() {
		return entityManager;
	}


	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

    public OrderProcessingServiceBean() {
        // TODO Auto-generated constructor stub
    }
    
    
    public String processOrder (Order order){
//    	InventoryService service = ServiceLocator.getInventoryService();
    	
    	int min = 10000000;
    	int max = 99999999;
    	int code = min + (int)(Math.random() * (max-min+1));
    	System.out.println("Order Processing: "+order.getItems().get(0).getItemName());
    	entityManager.persist(order);
    	entityManager.flush();
    	this.notifyUser(order.getEmailAddress());
    	return String.valueOf(code);
    	
    }
    
    public boolean validateItemAvailability(Order order) {
    	InventoryService service = ServiceLocator.getInventoryService();
    	List<LineItem> lineitem = order.getItems();
    	List<Item> item = new ArrayList<>();
    	for (LineItem it:lineitem) {
    		Item temp = new Item();
    		temp.setQuantity(it.getQuantity());
    		temp.setItemNumber(it.getItemNumber());
    		temp.setItemNumber(it.getItemNumber());
    		item.add(temp);
    	}
    	return service.validateQuantity(item);
    }

}
