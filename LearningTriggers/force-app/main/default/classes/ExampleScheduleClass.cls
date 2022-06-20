public class ExampleScheduleClass implements Schedulable {
public void execute(SchedulableContext ctx){
    ExampleBatchClass updateAccBatch = new ExampleBatchClass();
    Database.executeBatch(updateAccBatch);
}
}
