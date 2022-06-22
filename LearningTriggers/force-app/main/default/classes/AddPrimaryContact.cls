public class AddPrimaryContact implements Queueable {
    //Variables
    private String state;
    private Contact ctac;
    //contructor
    public AddPrimaryContact(Contact ctac, String state) {
        this.ctac = ctac;
        this.state = state;
    }
    //method
    public void execute (QueueableContext context ){
        List<Contact> contacts= new List<Contact>();
        for (Account objAccount : [SELECT Id FROM Account WHERE BillingState =:state LIMIT 200]) {
            Contact objContactClone =ctac.clone();
            objContactClone.AccountId = objAccount.Id;
            contacts.add(objContactClone);
        }
        insert contacts;
    }
}
