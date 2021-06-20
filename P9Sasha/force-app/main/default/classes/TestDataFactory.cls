public abstract class TestDataFactory {

        // create ordersd for one account

        public static Account createOrdersForOneAccount(Integer num){

           

            // create an  account

            Account acc = new Account (Name = 'name', Description = 'test', Chiffre_d_affaire__c = 0);
            insert acc;

            //create a contract
            Contract cont = new Contract (AccountId = acc.Id, Status = 'Draft', StartDate = Date.today(), ContractTerm= 1);
            insert cont;
            cont.Status = 'Activated';
            update cont;

            //create a pricebook

           Id priceBookId = Test.getStandardPricebookId();

          

            //product creation 

            Product2 prod = new Product2(name = 'prod', IsActive=true);
            insert prod;

              // create a pricebook entry


              PricebookEntry pbe = new PricebookEntry(Pricebook2Id = priceBookId, Product2Id = prod.id, UseStandardPrice = false, UnitPrice= 100.00, IsActive= true);
              insert pbe;

             // create orders
             List<Order>  orderList = new List<Order>();

             for (Integer i=0; i<num ; i++){
                Order ord = new Order(AccountId = acc.Id, ContractId = cont.Id, EffectiveDate = System.today(), Status = 'Draft', Pricebook2Id = priceBookId , ShipmentCost__c= 10);
                orderList.add(ord);    
            }
            insert orderList;
          


            // create order item

            List<OrderItem> orderItems = new List<OrderItem>();

            for(integer j = 0 ; j<num; j++){

                OrderItem ordIt1 = new OrderItem(OrderId = orderList[j].Id , PriceBookEntryId = pbe.id, UnitPrice = 100,Quantity = 1 );
                orderItems.add(ordIt1);
            }
            insert orderItems;


            for(order o : orderList){
                o.Status = 'Activated';
            }
            

            update orderList;

            update orderItems;

            return acc;

        }

        public static User createUser(String name){

            Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];

            User newUser = new User(Username = 'test12478'+ name +'@mani.com', Email = 'test12478@mani.com', Alias = name,  IsActive = true, LastName= 'bani', TimeZoneSidKey = 'America/Los_Angeles' , LocaleSidKey= 'en_US', EmailEncodingKey= 'ISO-8859-1' , ProfileId= profileId.id , LanguageLocaleKey=  'en_US');

            insert newUser;

            return newUser;
        }


        

        

     
      }
