@isTest
private class OrderTeamControllerTest  {

	@TestSetup
                      static  void testData( )  {
	   User user1= TestDataFactory.createUser('User1') ; 
	     					System.runAs(user1)  {
	           TestDataFactory.createOrdersForOneAccount(4) ; 
}

	   User user2 = TestDataFactory.createUser('User2') ;
                           System.runAs(user2)  {
	            TestDataFactory.createOrdersForOneAccount(3) ; 
	}
	
	   User user3 = TestDataFactory.createUser('User3') ;
                           System.runAs(user3)  {
	            TestDataFactory.createOrdersForOneAccount(5) ; 
	}
}

@isTest
static void TestAggregateResultList( ) {


Test.startTest( ) ;
OrderTeamController controller = new OrderTeamController();
List<AggregateResult> totalOrdersByOwner= controller.aggregateResultList;
Test.stopTest( );



	System.assert(totalOrdersByOwner.size( ) >0); // Assert that the list is not empty

}}
