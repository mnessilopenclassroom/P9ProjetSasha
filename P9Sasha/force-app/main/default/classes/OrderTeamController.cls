public class OrderTeamController {

    public List <AggregateResult> aggregateResultList {get; set;}

    public OrderTeamController () {

        aggregateResultList = new List <AggregateResult>();
        aggregateResultList = [SELECT COUNT(id) ordCount, SUM(TotalAmount) ordAmount, owner.Name ordName FROM Order WHERE Status = 'Activated' GROUP BY owner.Name];
  
}  }