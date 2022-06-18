public class ExampleFutureClass {
    @future
    public static void crearContacto(Id accountId){
        Contact objContactInsert = new Contact();
        objContactInsert.AccountId = accountId;
        objContactInsert.LastName = 'Contact created for future method';
        System.debug('Future method in course');
        insert objContactInsert;
    }
    @future(callout=true)
    public static void llamarServicioWeb(){
        //codigo
    }
}
//SELECT id, Name, LastName, CreatedDate FROM Contact ORDER BY CreatedDate DESC
//0018a00001ohTQyAAM ----cuenta q se va a ocupar
