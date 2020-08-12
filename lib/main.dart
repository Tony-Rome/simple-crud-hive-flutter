import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medium_hive_crud/hive_model/cookies.dart';
import 'package:medium_hive_crud/hive_model/cookies_box.dart';
import 'package:medium_hive_crud/pages/create_update.dart';
import 'package:medium_hive_crud/pages/read_delete.dart';
import 'package:medium_hive_crud/provider/cookies_box_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(CookiesBoxAdapter());
  Hive.registerAdapter(CookiesAdapter());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

/*   var cookiesBox1 = CookiesBox(1.0, 'red',[]);
  print(cookiesBox1.cookiesList);

  cookiesBox1.cookiesList
    ..add(Cookies(flavour: 'orange', chips: 'chocolate'))
    ..add(Cookies(flavour: 'chocolate', chips: 'coconut'))
    ..add(Cookies(flavour: 'vanilla', chips: 'blueberry'));

  print(cookiesBox1.cookiesList);

  var cookiesBox2 = CookiesBox(1.5, 'blue',[]);

  cookiesBox2.cookiesList
    ..add(Cookies(flavour: 'blueberry', chips: 'chocolate'))
    ..add(Cookies(flavour: 'chocolate', chips: 'coconut'))
    ..add(Cookies(flavour: 'coconut', chips: 'blueberry')); */

    /*  List<CookiesBox> cookiesBoxList = [];
  cookiesBoxList..add(cookiesBox1)..add(cookiesBox2); */
  //var cookiesBoxProvider = CookiesBoxProvider();
    //cookiesBoxProvider.initBox().then((_) => cookiesBoxProvider.box.deleteFromDisk()); 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: ReadDelete.routeName,
      routes: {
        ReadDelete.routeName : (context) => ReadDelete(),
      },
    );
  }
}

