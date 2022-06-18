global class ExampleBatchClassQueryLocator implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'SELECT ID, Name FROM Account';

        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext BC, List<Account> scope){
        list<Account> lstAccountsToUpdate = new List<Account>();
        for (Account objAccount: scope) {
            objAccount.Name=objAccount.Name + 'queryLocator';
            lstAccountsToUpdate.add(objAccount);
        }
        update lstAccountsToUpdate;

    }

    global void finish(Database.BatchableContext BC){
    }
}
