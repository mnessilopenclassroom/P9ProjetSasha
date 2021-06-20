@isTest
private class UpdateAccountBatchTest {

@TestSetup
static void testData() {
	Account acc =TestDataFactory.createOrdersForOneAccount(100) ;

	
	Test.startTest();

	update acc;

	Test.stopTest();
	
	System.assert(true);

}

@isTest
static  void UpdateAccountBatchTest  () {



Test.startTest();
UpdateAccountBatch uab = new UpdateAccountBatch();
Id batchId  =  Database.executeBatch(uab);
Test.stopTest();

//after the testing stops, assert records updated properIy

Account a = [SELECT Id, Chiffre_d_affaire__c FROM Account ];
List<Order> orderListUpdated  = [SELECT AccountId, Status FROM Order WHERE AccountId=: a.Id];
System.assertEquals(10000, a.Chiffre_d_affaire__c) ;

}
}