//Parameterized Typing

//Lists, maps and sets are parameterized in Apex: they take any data type Apex supports for them as an argument. That data type must be replaced with an actual data type upon construction of the list, map or set. For example:

List<Object> objList = new List<Object>();

objList.add(2);
objList.add('3');
objList.add(true);
objList.add(Date.today());


System.debug(objList);