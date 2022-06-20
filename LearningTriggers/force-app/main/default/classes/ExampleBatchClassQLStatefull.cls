global class ExampleBatchClassQLStatefull implements Database.Batchable<sObject>, Database.Stateful{
    //un metodo de ejecucion necesita datos de un metodo de ejecucion anterior
    //el metodo finish necesita datos de algun metodo de ejecucion anterior
    //Si para ambas ideas la respueta es NO--> no usar este codigo stateful

    global Integer totalCuentasInsertadas=0;
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT ID, Name FROM Account';
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Account> scope){
        list<Account> lstAccountsToInsert = new List<Account>();
        for (Account objAccount: scope) {
            String removeLocator=objAccount.Name.replace('queryLocator', '98');
            objAccount.Name = 'Cuenta creada en batch '+removeLocator;
            objAccount.Industry='Finance';
            objAccount.ID=NULL;
            lstAccountsToInsert.add(objAccount);
            totalCuentasInsertadas++;
        }
        insert lstAccountsToInsert;

    }

    global void finish(Database.BatchableContext BC){
        //detalles del proceso de ejecucion
        AsyncApexJob apxJob = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,TotalJobItems
                                FROM AsyncApexJob
                                WHERE Id=:BC.getJobId()];
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{'acostamichael80@gmail.com'};
        mail.setToAddresses(toAddresses);
        mail.setSenderDisplayName('Hello Micke Job results');
        mail.setSubject('Email de prueba - Job '+apxJob.Status+' se insertaron '+TotalCuentasInsertadas+ ' registros.');
        mail.setHtmlBody('Se ejecutaron '+apxJob.TotalJobItems+ ' y hubo '+apxJob.NumberOfErrors+ ' errores.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});

    }
}
