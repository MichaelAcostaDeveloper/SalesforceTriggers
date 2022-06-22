@isTest
public class DailyLeadProcessorTest {

        private static String CRON_EXP='0 0 0 ? * * * ';
        @isTest
        private static void testSchedulableClass(){
            //load data
            List<Lead> leads = new List<Lead>();
            for (Integer i = 0; i < 500; i++) {
                if(i<250){
                    leads.add(new Lead(LastName='Acosta', Company='NextClass'));
                }else{
                    leads.add(new Lead(LastName='Acosta', Company='NextClass', LeadSource='Other'));
                }
            }
            insert leads;

            //performs the test
            Test.startTest();
            String jobId=System.schedule('Process Leads',CRON_EXP,new DailyLeadProcessor());
            Test.stopTest();

            //check the result
            List<Lead>updateLeads=[SELECT Id, LeadSource FROM Lead WHERE LeadSource='Dreamforce'];
            System.assertEquals(200,updateLeads.size(),'ERROR: At least 1 recod not updated correctly');
        
            //check the sceduled time
            List<CronTrigger>cts=[SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id=:jobid];
            System.debug('Next Fire Time: '+ cts[0].NextFireTime);

            //not sure this works for all timezones
            Datetime midnight =Datetime.newInstance(Date.today(),Time.newInstance(0,0,0,0));
            System.assertEquals(midnight.addHours(24),cts[0].NextFireTime,'ERROR: Not schedue for midnight');
        }

}
