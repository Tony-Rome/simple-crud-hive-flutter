import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medium_hive_crud/hive_model/cookies.dart';
import 'package:medium_hive_crud/hive_model/cookies_box.dart';
import 'package:medium_hive_crud/pages/read_delete.dart';
import 'package:medium_hive_crud/provider/cookies_box_provider.dart';


class CreateUpdate extends StatefulWidget {

  static const routeName= 'create_update';
  final cookiesBox;
  final int indexBox;
  final bool save;

  CreateUpdate([ this.cookiesBox, this.indexBox, this.save]);

  @override
  _CreateUpdateState createState() => _CreateUpdateState();
}

class _CreateUpdateState extends State<CreateUpdate> {

  final _controller = ScrollController();
  var cookiesBoxProvider = CookiesBoxProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cookiesBoxProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    cookiesBoxProvider.initBox();
 
    return Scaffold(
      appBar: AppBar(
        title: Text('Caja de galletas ${widget.indexBox}'),
      ),
      body: Form(
        key: formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal:20.0),
                child: Column(
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Precio:'
                ),
                initialValue: '${widget.cookiesBox.price}',
                 onSaved: (newPrice) => widget.cookiesBox.price = double.parse(newPrice),
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Color: '
                ),
                initialValue: widget.cookiesBox.color,
                onSaved: (newColor) => widget.cookiesBox.color = newColor,
            ),
            SizedBox(
                height: 200.0,
                            child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    controller: _controller,
                    itemBuilder: (context, index){

                        var cookie = widget.cookiesBox.cookiesList[index];
                      return Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 60.0,
                            width: 160.0,
                            child: TextFormField(
                               decoration: InputDecoration(
                                 labelText: 'Chispas:',
                                ),
                              initialValue: cookie.chips ,
                              onSaved: (newChips) => cookie.chips = newChips,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: 60.0,
                            width: 160.0,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Sabor:'),
                              initialValue: cookie.flavour,
                              onSaved: (newFlavour) => cookie.flavour = newFlavour,
                            ),
                          ),
                        ],
                      );
                    }),
            ),   
          ],
        ),
              ),
      ),
      floatingActionButton: IconButton(
        icon:Icon(Icons.save),
        onPressed: (){
          formKey.currentState.save();
          (widget.save) ? _addNewCookieBox(widget.cookiesBox) :_updateEdit(widget.indexBox,widget.cookiesBox);

        },
        iconSize: 80.0,
        ),
    );
  }


  
  _addNewCookieBox(var cookieBox) {

    cookiesBoxProvider.addCookiesBox(cookieBox);
    Navigator.pushNamed(context, ReadDelete.routeName);

  }
  

  _updateEdit(int indexBox, var cookiesBox) {

    cookiesBoxProvider.updateCookiesBox(indexBox, cookiesBox);

    Navigator.pushNamed(context, ReadDelete.routeName);

  }


 

 
}
