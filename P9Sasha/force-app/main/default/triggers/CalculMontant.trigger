trigger CalculMontant on Order (before update) {

  

    for (Order o : trigger.new) {
	
	
	o.Net_Amount__c = o.TotalAmount - o.ShipmentCost__c;

    

    }
    
}