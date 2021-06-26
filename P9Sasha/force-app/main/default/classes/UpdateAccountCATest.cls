@isTest
public class UpdateAccountCATest {
    
    @TestSetup
    Static void testData(){
        Account acc = TestDataFactory.createOrdersForOneAccount(200);

        Test.startTest();

        update acc;

        Test.stopTest();
        
        System.assert(true);

    }
	
    @isTest
    static void TestUpdateAccountWith100OrderActivated() {

        
        
        Account acc = [SELECT Id, Chiffre_d_affaire__c From Account LIMIT 1];
      
        
        // verify that the related Account has been updated
        
        List <Order> order = new List<Order>([SELECT Id, TotalAmount From Order WHERE AccountId = :acc.Id ]);
    
        acc = [SELECT Id, Chiffre_d_affaire__c From Account LIMIT 1];
        
        System.assertEquals(20000, acc.Chiffre_d_affaire__c);
        
    }
}
