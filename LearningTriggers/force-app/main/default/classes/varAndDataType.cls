public class varAndDataType {
    public static void testTiposVariables(){
        String text='Variable de texto';
        System.debug('Text es: '+ text);
        
        Boolean bandera=true;
        System.debug('Bolean value is: '+ bandera);
        
        DateTime dt=DateTime.now();
        Time myTime=Time.newInstance(dt.hour(), dt.minute(), dt.second(), dt.millisecond());
        Time myTimeManual=Time.newInstance(8,10, 52,145);
        System.debug('myTime is: '+myTime);
        System.debug('mymanual time is: '+myTimeManual);
        
		Date toDate=date.today();
        System.debug('toDate is: '+toDate);
        Date myDate=date.newInstance(1990,9,18);
        System.debug('myDate is: '+myDate);
        
        Datetime fixDateTime=datetime.now();
        System.debug('fixDatetIME IS: '+fixDateTime);
        Datetime myDateTime=Datetime.newInstance(1990,1,31,1,8,16);
        System.debug('my date es: '+myDateTime);
        
        String tStr='textBlob';
        Blob myBlob=blob.valueOf(tStr);
        String dStr=myBlob.toString();
        System.debug('El valor en string de la variable blob es: '+dStr);
        System.debug('El valor de myBlob sin convertir es: '+myBlob);
        
        Decimal amount =152.36;
        System.debug('La variable decimal es: '+amount);
        
        Double dNum=155.47;
        System.debug('Una variable double es: '+dNum);
        
        Integer inNum=95;
        System.debug('Una variable integer es: '+inNum);
        
        Long lNum=545458963L;
        System.debug('Una varaible long es: '+lNum);
        
        ID recordId='00000020232GBGT';
        System.debug('Una variable id es: '+ recordId);
        
        
        
        
        
        
    }
}