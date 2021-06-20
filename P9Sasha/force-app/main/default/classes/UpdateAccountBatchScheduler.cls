global class UpdateAccountBatchScheduler implements Schedulable {
    
    global void execute (SchedulableContext sc) {
        
        UpdateAccountBatch uab = new UpdateAccountbatch();
        Id batchId = Database.executeBatch(uab);
        
    }

}
