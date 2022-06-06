public with sharing class ExampleCollection {
public static void testEjemploListas(){
    //para inicializar en vacio
    List<String> listNull;
    String[] anotherListNull;
    system.debug('Valor de listNull es: '+listNull);
    system.debug('Valor de anotherListNull: '+anotherListNull);

    //otra forma de inicializar
    List<String> listInicializada = new List<String>();
    String[]anotherListInicializada = new List<String>();
    system.debug('Valor de lista inicializada es: '+listInicializada);
    system.debug('Valor de anotherListaInicializada es: '+anotherListInicializada);

    //para inicializar con valores ingresados manualmente
    List<String> listOfNames = new List<String>{'Michael','Teresa','uLISES'};
    system.debug('Valor de listOfNames: '+listOfNames);
    listOfNames.add('Maria');//para colocar un elemento
    system.debug('Valor de listOfNames: '+listOfNames);
    system.debug('El tamanio de la lista: '+listOfNames.size());//para hallar el tamanio de la lista

    //para retornar un elemento por su posicion
    system.debug('Valor de listOfNames en 0: '+listOfNames[0]);
    system.debug('Valor de listOfNames en 1: '+listOfNames[2]);
    system.debug('Valor de ERROR: '+listOfNames[10]);

    //otra forma para retornar un elemento por su posicion
    system.debug('Valor de listOfNames en 0: '+listOfNames.get(1));
    system.debug('Valor de listOfNames en 1: '+listOfNames.get(2));

    //para colocar un valor en una posicion
    listOfNames.set(0,'Karen');
    system.debug('Valor de listOfNames: '+listOfNames);

    //para clonar listas
    List<String> listOfNamesCloned = new List<String>(listOfNames);
    system.debug('Valor de listOfNamesCloned: '+listOfNamesCloned);
    listOfNamesCloned.clear();//para limpiar listas
    system.debug('Valor de listOfNamesCloned despues de clear: '+listOfNamesCloned);

    //para ordenar listas
    listOfNames.sort();
    system.debug('Valor de listOfNames ordenada: '+listOfNames);

    //para anadir una lista en otra
    listOfNames.addAll(new List<String>{'sandy','kiamer','omehert'});
    system.debug('Valor de listOfNames agregamos mas: '+listOfNames);

    listOfNames.isEmpty();//nos dice si esta o no vacia una lista.(valor booleno)

    listOfNames.contains('Teresa');//nos dice si su argumento esta o no en la lista(valor booleano)

    listOfNames.indexOf('Teresa');//nos devuelve la posicion del argumento., si no encuentra devuelve -1

    listOfNames.remove(2);//retira el elemento de la posicion 2.
}

public static void testEjemploSet(){
    //no contiene valores repetidos
    //iniciando en nulo
    Set<String> setNull;
    system.debug('Valor de setNull:' +setNull);
    //inicializado
    Set<String> setInicializado = new Set<String>();
    system.debug('Valor setInicializado:' +setInicializado);
    //con elementos
    Set<String> setOfCountry = new Set<String>{'eCUADOR','mexico','peru'};
    system.debug('Valor de setOfCountry: '+setOfCountry);
    //para anadir
    setOfCountry.add('Canada');
    system.debug('Valor de setOfCountry:' +setOfCountry);
    //tamanio de listas
    system.debug('Tamanio de setOfCountry:' +setOfCountry.size());
    //.clone
    Set<String> setOfCountryCloned=setOfCountry.clone();
    system.debug('Valor de setOfCountry:' +setOfCountryCloned);
    //clear-limpiar
    setOfCountryCloned.clear();
    system.debug('Valor de setOfCountry:' +setOfCountryCloned);
    //isEmpty, evalua si el set esta vacio o no
    setOfCountry.isEmpty();//entrega false
    setOfCountryCloned.isEmpty();//en este caso entrega true, porque en la linea 78 se borro
    //contains('elemento')
    setOfCountry.contains('Espana');//devuelve false
    //remove('elmento'), si no existe elemento no devuelve ningun error.
    setOfCountry.remove('mexico');//elimina el elemento mexico
}

public static void testEjemploMap(){
    //tienen una llave y un valor
    Map<String,String> mapNull;
    system.debug('Valor de mapNull:' +mapNull);
    //map Inicializado
    Map<String,String> mapInicializado = new Map<String,String>();
    system.debug('Valor de mapInicializado:' +mapInicializado);
    //con valores
    Map<String,String> mapOfCurrency=new Map<String,String>{
        'EURO'=>'euro','MXN'=>'peso','EC'=>'dolar'};
    system.debug('Valor de mapOfCurrency:' +mapOfCurrency);
    //.put para anadir
    mapOfCurrency.put('JPY','yen');
    system.debug('Valor de mapOfCurrency:' +mapOfCurrency);
    //size()
    mapOfCurrency.size();//entrga el tamano del map
    //clone, clonar
    Map<String,String> mapOfCurrencyCloned=mapOfCurrency.clone();
    system.debug('Valor de mapOfCurrencyCloned:' +mapOfCurrencyCloned);
    //clear, para limpiar
    mapOfCurrencyCloned.clear();
    //keySet(), recupera las llaves del mapa
    mapOfCurrency.keySet();//entrega todas las llaves.
    //.values, recupera los valores
    mapOfCurrency.values();
    //.get('llave'), entrega el valor dado la llave
    //si no encuentra la llave entrega un valor de null
    mapOfCurrency.get('EUR'); //entrega el valor de euro
    //.toString(), retorna el valor del mapa en string
    String mapTexto=mapOfCurrency.toString();
    //.isEmpty();
    mapOfCurrency.isEmpty();//entrega false
    mapOfCurrencyCloned.isEmpty();//entrega true
    //.containsKey(); valida si encuentra el valor de llave (v o F)
    mapOfCurrency.containsKey('EUR');//entrega true
    //.remove('LLAVE'), para eliminar los elementos
    mapOfCurrency.remove('EUR');
}

public static void testColeccionesSOQL(){
    //LISTA REGISTRO CUENTAS
    List<Account> listaDeCuentas = new List<Account>();
    listaDeCuentas=[SELECT id, Name, Type
                FROM Account WHERE Type!=''
                ORDER BY Name ASC LIMIT 5 ];
    System.debug('Lista de cuentas: '+listaDeCuentas);
    System.debug('Lista de cuentas en position cero: '+listaDeCuentas.get(0));
    Account objCuenta = listaDeCuentas.get(0);
    System.debug('objCuenta su nombre: '+objCuenta.Name);
    System.debug('objCuenta su id: '+objCuenta.Id);
    System.debug('objCuenta su tipo: '+objCuenta.Type);
    System.debug('Valor de Name en position cero para listaCuentas: '+listaDeCuentas.get(0).Name);
    //Para colocar una nueva cuenta a listaDeCuentas
    Account nuevaCuenta = new Account();
    nuevaCuenta.Name ='Cuenta nueva para la lista ';
    nuevaCuenta.Type ='Prospect';
    listaDeCuentas.add(nuevaCuenta);
    //para validar si la cuenta esta anadida o no.
    System.debug('Validar :' +listaDeCuentas.contains(nuevaCuenta));
    //para tener el ultimo elemento de la lista
    System.debug('Ultimo elemento de la lista: '+listaDeCuentas.get(listaDeCuentas.size()-1));
    //ir por la nueva cuenta usando indexOf
    System.debug('New accout by indexOf: '+listaDeCuentas.get(listaDeCuentas.indexOf(nuevaCuenta)));


    //SET REGISTRO DE CUENTAS
    Set<Account> setDeCuentas=new Set<Account>([SELECT id, Name, Type
    FROM Account WHERE Type!=''
    ORDER BY Name ASC LIMIT 5 ]);
    System.debug('Set de cuentas: '+setDeCuentas);
    System.debug('Tamano del Set de cuentas: '+setDeCuentas.size());
    setDeCuentas.remove(listaDeCuentas.get(0));
    System.debug('Tamano del Set de cuentas: '+setDeCuentas.size());


    //MAP REGISTRO DE CUENTAS
    Map<ID, Account> mapaCuentas=new Map<ID, Account>([SELECT id, Name, Type
                                                    FROM Account
                                                    WHERE Type != ''
                                                    ORDER BY Name ASC LIMIT 3]);
System.debug('Map: '+mapaCuentas);
System.debug('Map size: '+mapaCuentas.size());
System.debug('Map llaves: '+mapaCuentas.keySet());
System.debug('Map valores: '+mapaCuentas.values());


//EJERCIO GENERAL DE MAPAS
Account cuentaParaMapa =new Account();
cuentaParaMapa.Name='Cuenta de mapa';
cuentaParaMapa.Type='Prospect';
cuentaParaMapa.ID='0014X000015XLIIAAW';
system.debug('MAPA DE CUENTAS antes del put: '+mapaCuentas.containsKey(cuentaParaMapa.ID));
mapaCuentas.put(cuentaParaMapa.ID, cuentaParaMapa);
system.debug('MAPA DE CUENTAS despues del put: '+mapaCuentas.containsKey(cuentaParaMapa.ID));


//otro ejercicio
List<Account> nuevaLista=new List<Account>();
nuevaLista=[SELECT id, Name, Type FROM Account WHERE Type !='' 
            ORDER BY Name ASC LIMIT 5];
System.debug('Tamano mapa de cuentas: '+mapaCuentas.size());
mapaCuentas.put(nuevaLista.get(4).ID, nuevaLista.get(4));
System.debug('Nuevo tamano mapa de cuentas: '+mapaCuentas.size());

//otro ejercicio
Set<Id> idsCuentas=new Map<Id, sObject>([SELECT ID
                                        FROM Account
                                        WHERE Type!=''
                                        ORDER BY Name ASC LIMIT 3]).keySet();
System.debug('idsCuentas: '+idsCuentas);




                                                }
}
