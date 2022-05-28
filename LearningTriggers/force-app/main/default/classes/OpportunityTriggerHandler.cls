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

    private void MarcarRevisionEnOportunidad(Map<ID, Opportunity>mapOldOppRecords){
        for(Opportunity currentOpportunity: (List<Opportunity>)Trigger.new){
            Opportunity oldOppRecord = mapOldOppRecords.get(currentOpportunity.Id);
            if( oldOppRecord.Type!=currentOpportunity.Type &&
                oldOppRecord.StageName<>currentOpportunity.StageName &&
                oldOppRecord.Amount!=currentOpportunity.Amount){
                    currentOpportunity.Necesita_revision__c = true;
                }
                    }
        }
    }