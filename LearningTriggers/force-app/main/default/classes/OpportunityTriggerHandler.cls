public with sharing class OpportunityTriggerHandler extends TriggerHandler{
    public override void beforeUpdate(){
        MarcarRevisionEnOportunidad((Map<ID,Opportunity>)Trigger.oldMap);

        // Map<ID,Opportunity>oldMap=(Map<ID,Opportunity>)Trigger.oldMap;
        // for(Opportunity currentOpportunity: (List<Opportunity>)Trigger.new){
        //     if(oldMap.get(currentOpportunity.Id).Type!=currentOpportunity.Type &&
        //        oldMap.get(currentOpportunity.Id).StageName!=currentOpportunity.StageName &&
        //        oldMap.get(currentOpportunity.Id).Amount!=currentOpportunity.Amount){
        //            currentOpportunity.Necesita_revision__c = true;
        //        }
        // }

    }
    public override void afterUpdate(){
    ActualizarMontosparaCuenta((List<Opportunity>)Trigger.new,(Map<ID, Opportunity>)Trigger.oldMap);
    }
    public override void beforeInsert(){
        marcarOportunidadesPreferentes((List<Opportunity>)Trigger.new);
    }
    public override void afterInsert(){
        crearContactoPredeterminado((List<Opportunity>)Trigger.new);
    }

    //before update
    private void MarcarRevisionEnOportunidad(Map <ID, Opportunity> mapOldOppRecords){
        for(Opportunity currentOpportunity: (List<Opportunity>)Trigger.new){
            Opportunity oldOppRecord = mapOldOppRecords.get(currentOpportunity.Id);
            if( oldOppRecord.Type!=currentOpportunity.Type &&
                oldOppRecord.StageName<>currentOpportunity.StageName &&
                oldOppRecord.Amount!=currentOpportunity.Amount){
                    currentOpportunity.Necesita_revision__c = true;
                }
            }
        }

    //after update
    private void ActualizarMontosparaCuenta(List <Opportunity> lstNewOppRecord, Map <ID, Opportunity> mapOldOppRecords){
        Set<ID> setAccIds=new Set<ID>();
            for(Opportunity currentOpportunity: lstNewOppRecord){
                Opportunity oldOppRecord=mapOldOppRecords.get(currentOpportunity.Id);
                if(currentOpportunity.AccountId!=NULL && oldOppRecord.Amount!=currentOpportunity.Amount){
                    setAccIds.add(currentOpportunity.AccountId);
                }
            }

            Map<Id,Decimal>mapAccWithSumAmounts=new Map<Id,Decimal>();
            for (Opportunity opportunityToSum :[SELECT Amount,AccountId FROM Opportunity WHERE AccountId IN: setAccIds AND Amount!=NULL]) {
                if (mapAccWithSumAmounts.containsKey(opportunityToSum.AccountId)) {
                    Decimal finalAcmount = mapAccWithSumAmounts.get(OpportunityToSum.AccountId)+opportunityToSum.Amount;
                    mapAccWithSumAmounts.put(opportunityToSum.AccountId,finalAcmount);
                } else {
                    mapAccWithSumAmounts.put(OpportunityToSum.AccountId,opportunityToSum.Amount);
                }
            List<Account>listAccToUpdate=new List<Account>();
            for (Id objAccount : mapAccWithSumAmounts.keySet()) {
                listAccToUpdate.add(new Account(Id=objAccount,
                                Monto_de_oportunidades__c=mapAccWithSumAmounts.get(objAccount)) );
            }
            update listAccToUpdate;
            }
            }
    //before insert
    private void marcarOportunidadesPreferentes(List<Opportunity>lstNewOppoRecords) {
        for (Opportunity currentOpportunity : lstNewOppoRecords) {
            if(currentOpportunity.Amount>1000000){
                currentOpportunity.Type='Preferente';
            }
        }
        }
    private void crearContactoPredeterminado(List<Opportunity>lstNewOppoRecords) {
        List<Contact>lstContactToInsert=new List<Contact>();
        for (Opportunity currentOpportunity : lstNewOppoRecords) {
            if(currentOpportunity.AccountId==NULL){
                Contact objContact=new Contact();
                objContact.LastName='Contacto de la oportunidad' +currentOpportunity.Name;
                lstContactToInsert.add(objContact);
            }
        }
        insert lstContactToInsert;
    }
    }
