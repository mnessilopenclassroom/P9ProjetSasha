public with sharing class DmlOnOrder {

    



    public  void ExecuteDml(Set<ID> id) {

       

        update [SELECT Id FROM Account WHERE Id IN :id];
        
    }    
}

