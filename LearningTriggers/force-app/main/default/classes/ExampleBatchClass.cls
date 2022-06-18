global class ExampleBatchClass implements Database.Batchable<sObject>{

    global List<Account> start(Database.BatchableContext BC){
        List<Account> lstAccounts =[SELECT ID, Industry
                                    FROM Account] ;
                                    //SELECT ID, Name, Industry FROM Account
        return lstAccounts;
    }

    global void execute(Database.BatchableContext BC, List<Account> scope){
        list<Account> lstAccountsToUpdate = new List<Account>();
        for (Account objAccount: scope) {
            objAccount.Industry='Energy';
            lstAccountsToUpdate.add(objAccount);
        }
        update lstAccountsToUpdate;

    }

    global void finish(Database.BatchableContext BC){
    }
}
