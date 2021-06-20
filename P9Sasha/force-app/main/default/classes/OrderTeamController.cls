public class OrderTeamController {

    public List <AggregateResult> aggregateResultList {get; set;}

    public  static void <AggregateResult> OrderTeam () {

        aggregateResultList = new List <AggregateResult>();
        aggregateResultList = [SELECT COUNT(id) ordCount, SUM(TotalAmount) ordAmount, owner.Name ordName FROM Order GROUP BY owner.Name];

        return aggregateResultList;
    }

}