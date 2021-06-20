global class UpdateAccountBatch implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        
        return Database.getQueryLocator([SELECT Id, Chiffre_d_affaire__c FROM Account WHERE Id IN (SELECT AccountId FROM Order WHERE Status = 'Activated')]);
    }
    
    global void execute (Database.BatchableContext batch, List<Account> listAcc) {
        
        List <Account> accountsToUpdate = new List<Account>();
        AggregateResult [] result = [SELECT AccountId, SUM(TotalAmount) total FROM Order WHERE Status = 'Activated' AND AccountId IN :listAcc GROUP BY AccountId];
        
        for (AggregateResult agg : result) {
            
            Account acc = new Account(Id = (Id)agg.get('AccountId'), Chiffre_d_affaire__c = (Decimal)agg.get('total'));
            accountsToUpdate.add(acc);	
        }
        
        update accountsToUpdate;
    }
    
    global void finish 	(Database.BatchableContext batch) {
        
    }

}