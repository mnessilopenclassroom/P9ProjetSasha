@isTest
public class CalculMontantTest {
    
    @TestSetup
    Static void testData(){

        Account acc = TestDataFactory.createOrdersForOneAccount(5);

        Test.startTest();

        update acc;

        Test.stopTest();
        
        System.assert(true);

       
    }
	
    @isTest
    static void calculNetAmountTestMinusShipmentCost() {
   
        List<Order> orders = [SELECT Id,ShipmentCost__c,TotalAmount,Net_Amount__c FROM Order LIMIT 5];
        for(Order order : orders) {
            order.ShipmentCost__c = 100;

        }
        Test.startTest();
        update orders;
        Test.stopTest();
        orders = [SELECT Id,ShipmentCost__c,TotalAmount,Net_Amount__c FROM Order LIMIT 5];

   
        for(Order order : orders){
            double netAmount = order.Net_Amount__c;
            double expected = order.TotalAmount - order.ShipmentCost__c;
            System.assertEquals(expected,netAmount);
        }
    }
}
