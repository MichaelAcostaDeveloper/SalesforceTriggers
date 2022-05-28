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

    
        private void ActualizarMontosparaCuenta(List <Opportunity> lstNewOppRecord, Map <ID, Opportunity> mapOldOppRecords){
            Set<ID> setAccIds=new Set<ID>();
            for(Opportunity currentOpportunity: lstNewOppRecord){
                Opportunity oldOppRecord=mapOldOppRecords.get(currentOpportunity.Id);
                if(currentOpportunity.AccountId!=NULL && oldOppRecord.Amount!=currentOpportunity.Amount){
                    setAccIds.add(currentOpportunity.AccountId);
                }

            }
            
        }
    }

