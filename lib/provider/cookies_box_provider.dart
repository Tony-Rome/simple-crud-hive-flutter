import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';


class CookiesBoxProvider{
  Box box;


  Future<bool> initBox() async {

    final directory = await getApplicationSupportDirectory();
    Hive.init(directory.path);
    box = await Hive.openBox('cookiesBox');

    print('box abierto');
    print('largo:${box.length}');

    return (box.isOpen) ?  true : false;

  }

  Future<bool> addCookiesBox(var cookiesBoxAdapter) async {
    
    await box.add(cookiesBoxAdapter);

    print(cookiesBoxAdapter);

    print('Length: ${box.length}');
    print('keys: ${box.keys}');

    return true;
  }

  Future<bool> createCookiesBox(var cookiesBoxAdapter) async {
    
    await box.addAll(cookiesBoxAdapter);
    
    print(cookiesBoxAdapter);

    print('Length: ${box.length}');
    print('keys: ${box.keys}');

    return true;
  }

  Map<dynamic,dynamic> readCookiesBox(){
    
   Map<dynamic,dynamic> cookiesBoxMap = box.toMap();

    cookiesBoxMap.forEach((key, value) {
      print('LLave: $key - caja galleta: precio: ${value.price} color: ${value.color}');
      print('Galletas:');
      for(var cookie in value.cookiesList){
        print('chispas: ${cookie.chips} - sabor: ${cookie.flavour}');
      }
    }); 

   return cookiesBoxMap;

  }

  Future<bool> deleteCookiesBox(int index) async {

    await box.deleteAt(index);

    print('Borrado $index');
    print('keys: ${box.keys}');
    print('Length: ${box.length}');

    return true;
  }

  Future<bool> updateCookiesBox(int index, var cookieBox) async {

    await box.putAt(index, cookieBox);

    print('actualizado');
    print(box.get(index));

    return true;
  }

  dispose(){
    box.close();
  }

}
