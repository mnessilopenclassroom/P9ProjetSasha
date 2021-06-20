trigger CalculMontant on Order (before update) {

    List<Order> orderList = new List <Order>();

    for (Order o : trigger.new) {
	
	
	o.Net_Amount__c = o.TotalAmount - o.ShipmentCost__c;

    orderList.add(o);

    }
    
}