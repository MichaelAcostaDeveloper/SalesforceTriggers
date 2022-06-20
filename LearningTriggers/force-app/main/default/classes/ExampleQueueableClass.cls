public class ExampleQueueableClass implements Queueable {
    //recibir una industria para gestionar CUENTAS
    //genera un contacto especifico
    public String industryToResearch='';
    public ExampleQueueableClass(String industryToResearch) {
        this.industryToResearch=industryToResearch;
    }

    public void execute(QueueableContext qContext){
        List<Contact> lstContactToInsert= new List<Contact>();
        for (Account objAccount :[SELECT Id FROM Account WHERE Industry=:industryToResearch]) {
            Contact objContact = new Contact();
            objContact.AccountId = objAccount.Id;
            objContact.LastName='Contacto creado por Queueable';
            lstContactToInsert.add(objContact);
        }
        insert lstContactToInsert;

        //2da version de encadenamiento
        System.enqueueJob(new ExampleChainingQueueableClass(lstContactToInsert));
    }
}

//Para seleccionar ultimos contactos existentes
//SELECT id, lastName, accountId FROM Contact ORDER BY CreatedDate DESC
//SELECT count() FROM Account WHERE Industry='Finance'
