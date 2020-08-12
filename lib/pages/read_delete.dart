

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medium_hive_crud/hive_model/cookies.dart';
import 'package:medium_hive_crud/hive_model/cookies_box.dart';
import 'package:medium_hive_crud/pages/create_update.dart';
import 'package:medium_hive_crud/provider/cookies_box_provider.dart';


class ReadDelete extends StatefulWidget {
    static const routeName= 'read_delete';


  @override
  _ReadDeleteState createState() => _ReadDeleteState();
}

class _ReadDeleteState extends State<ReadDelete> {


  var cookiesBoxProvider = CookiesBoxProvider();

  @override
  void dispose() {
    super.dispose();
    cookiesBoxProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD con HIVE en flutter'),
      ),
      body: FutureBuilder(
        future: cookiesBoxProvider.initBox(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return (cookiesBoxProvider.box.length < 1) ? Container() :  _allCookiesBox(context);
          }
          return Container();
        },
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add_box),
        onPressed: (){

          //Sobreescribe si agrego una sola instancia a la lista
          var cookie1 = Cookies(chips: '',flavour: '');
          var cookie2 = Cookies(chips: '',flavour: '');
          var cookie3 = Cookies(chips: '',flavour: '');
          var cookiesBox = CookiesBox(0.0, '', []);
          cookiesBox.cookiesList
            ..add(cookie1)
            ..add(cookie2)
            ..add(cookie3);

          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateUpdate(
                      cookiesBox,
                      null,
                      true
                    )
                  )
                );
        },
        iconSize: 80.0,
        ),
    );
  }

  ListView _allCookiesBox(BuildContext context) {
    var cookiesBoxMap = cookiesBoxProvider.readCookiesBox();
    var keysCookisBoxDB = cookiesBoxMap.keys;

    return ListView.builder(
      itemCount: cookiesBoxMap.length,
      itemBuilder: (context, indexBox) {

        var keyCookiesBox = keysCookisBoxDB.elementAt(indexBox);
        var cookiesBox = cookiesBoxMap[keyCookiesBox];
        print('Esto: $cookiesBox');
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: ListTile(
            leading: IconButton(
                icon: Icon(Icons.open_in_new),
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateUpdate(
                      cookiesBox,
                      indexBox,
                      false
                    )
                  )
                );

                }),
            trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed:(){
                _deleteCookiesBox(indexBox);
                setState(() {});
                }),
            title: Text(
                  'Cookie box ID: $keyCookiesBox Color: ${cookiesBox.color} Price: ${cookiesBox.price}' , // 
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
            
         ),
        );
      },
    );
  }




   _deleteCookiesBox(int index) {
    cookiesBoxProvider.deleteCookiesBox(index);
    print('Largo: ${cookiesBoxProvider.box.length}');
  }

}
