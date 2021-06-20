trigger NewUpdateAccountCA on Account (before insert, before update) {
    //For all account the sales revenue is set to 0
    for(Account acc: Trigger.new) {
        acc.Chiffre_d_affaire__c = 0;

    }
    //Aggregate function to calculate the sum of all the order for an account where the status is activated       
    

    

    for(AggregateResult agg :  [SELECT SUM(TotalAmount) Amt, AccountId Id FROM Order WHERE AccountId IN :Trigger.new AND Status ='Activated'GROUP BY AccountId] ) {
        Trigger.newMap.get((Id)agg.get('Id')).Chiffre_d_affaire__c = (Decimal)agg.get('Amt');
    }
}   