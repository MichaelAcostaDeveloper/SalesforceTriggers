public class ExampleChainingQueueableClass implements Queueable{
    public List<Contact> lstInboundContacts=new List<Contact>();
    public ExampleChainingQueueableClass(List<Contact> lstInboundContacts) {
        this.lstInboundContacts=lstInboundContacts;
    }
    public void execute(QueueableContext qContext){
        List<Case> lstCaseToInsert= new List<Case>();
        for (Contact objContact :lstInboundContacts) {
            Case objCase = new Case();
            objCase.ContactId = objContact.Id;
            objCase.Subject ='Caso creado por cadena';
            lstCaseToInsert.add(objCase);
        }
        insert lstCaseToInsert;
       
    }
}
//SELECT count() FROM Account WHERE Industry='Technology'
//SELECT ID, Subject, contactId FROM Case ORDER BY CreatedDate DESC