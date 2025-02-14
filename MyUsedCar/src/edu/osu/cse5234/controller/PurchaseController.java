package edu.osu.cse5234.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import edu.osu.cse5234.business.OrderProcessingServiceBean;
import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.model.*;
import edu.osu.cse5234.util.ServiceLocator;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InventoryService service = ServiceLocator.getInventoryService();
		Inventory invent = service.getAvailableInventory();
		List<Item> items = (List<Item>) invent.getItems();
		
		Order form = new Order();
		
		List<LineItem> lineitems = new ArrayList<>();

		for (Item i:items) {
			LineItem it = new LineItem();
			it.setId(i.getId());
			it.setItemName(i.getName());
			it.setItemNumber(i.getItemNumber());
			it.setPrice(i.getUnitPrice());
			lineitems.add(it);
		}
		
		form.setItems(lineitems);
		request.setAttribute("order", form);
		
		return "OrderEntryForm";
	}

	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) {
		
		OrderProcessingServiceBean service = ServiceLocator.getOrderProcessingService();

		if (service.validateItemAvailability(order)) {
			
			request.getSession().setAttribute("order", order);
			return "redirect:/purchase/paymentEntry";
			
		}else {
			
			String message = "Please resubmit item quantities.";
			request.getSession().setAttribute("message", message);
			return "redirect:/purchase";
		}
		
	}
	
	@RequestMapping(path = "/paymentEntry", method = RequestMethod.GET)
	public String viewPaymentEntryForm(HttpServletRequest request, HttpServletResponse response) {
		
		PaymentInfo paymentInfo = new PaymentInfo();
		request.setAttribute("paymentInfo", paymentInfo);

		
		return "PaymentEntryForm";
	}
	
	
	@RequestMapping(path = "/submitPayment", method = RequestMethod.POST)
	public String submitShippingEntryForm(@ModelAttribute("paymentInfo") PaymentInfo paymentInfo, HttpServletRequest request) {
		
		request.getSession().setAttribute("paymentInfo", paymentInfo);	
		
		return "redirect:/purchase/shippingEntry";
	}

	@RequestMapping(path = "/shippingEntry", method = RequestMethod.GET)
	public String viewShippingEntryForm(HttpServletRequest request, HttpServletResponse response) {
		
		ShippingInfo shipping = new ShippingInfo();
		request.setAttribute("shipping", shipping);
		
		
		return "ShippingEntryForm";
	}
	
	@RequestMapping(path = "/submitShipping", method = RequestMethod.POST)
	public String submitShippingEntryForm(@ModelAttribute("paymentInfo") ShippingInfo shipping, HttpServletRequest request) {
		Order order = (Order) request.getSession().getAttribute("order");
		request.getSession().setAttribute("shipping", shipping);	
		
		return "redirect:/purchase/viewOrder";
	}
	

	@RequestMapping(path = "/viewOrder", method = RequestMethod.GET)
	public String viewOrder(HttpServletRequest request, HttpServletResponse response) {

		return "ViewOrder";
	}
	
	@RequestMapping(path = "/comfirmOrder", method = RequestMethod.POST)
	public String submitOrderEntryForm(boolean confirm, HttpServletRequest request) {
	
		Order order = (Order) request.getSession().getAttribute("order");

		System.out.println("Submit order entry: "+order.getItems().get(0).getItemName());

		request.getSession().setAttribute("order", order);	
		
		return "redirect:/purchase/viewConfirmation";
	}
	
	@RequestMapping(path = "/viewConfirmation", method = RequestMethod.GET)
	public String viewConfirmation(HttpServletRequest request, HttpServletResponse response) {
		
		Order order = (Order) request.getSession().getAttribute("order");
		PaymentInfo paymentInfo = (PaymentInfo) request.getSession().getAttribute("paymentInfo");
		ShippingInfo shipping = (ShippingInfo) request.getSession().getAttribute("shipping");
		
		// update attributes in Order object
		order.setPayment(paymentInfo);
		order.setShipping(shipping);
		order.setEmailAddress(shipping.getEmail());
		order.setCustomerName(shipping.getName());
		
		
		request.setAttribute("order", order);
		
		OrderProcessingServiceBean service = ServiceLocator.getOrderProcessingService();
		// The information of order is saved in database
		String confirmcode = service.processOrder(order);
		
		request.setAttribute("payment", paymentInfo);
		request.setAttribute("shipping", shipping);
		request.setAttribute("confirmcode", confirmcode);
		return "Confirmation";
	}
	
}