import 'dart:io';

import 'package:flutter/material.dart';
import 'package:it_hub/Pages/homepage.dart';
import 'package:it_hub/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:it_hub/book.dart';
import 'package:it_hub/sidebar/sidebar_layout.dart';

class Bsc extends StatefulWidget with NavigationStates {
  @override
  _BscState createState() => _BscState();
}

class _BscState extends State<Bsc> {
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.cyanAccent, Colors.white],
    ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));
    final Shader bg = LinearGradient(
      colors: <Color>[Colors.black, Colors.black],
    ).createShader(Rect.fromLTWH(100.0, 0.0, 200.0, 70.0));
    return Scaffold(
      body: WillPopScope(
        onWillPop: onBackPress,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,

          ),
          child: Scaffold(
            backgroundColor: Colors.black87,
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
                          ),
                          width: 15.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 55.0),
                Padding(
                  padding: EdgeInsets.only(left: 100.0),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Text('B.Sc. IT HUB',
                          style: TextStyle(fontSize: 45,foreground: Paint()..shader = linearGradient,fontFamily: "Stencil",
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 2.0,
                                color: Colors.white,
                              ),
                            ],
                          ),),
                        SizedBox(width: 10.0),
                        Text('',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 45.0))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: MediaQuery.of(context).size.height - 0.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.cyanAccent, Colors.transparent]),
                    borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),),
                  ),
                  child: ListView(
                    primary: false,
                    padding: EdgeInsets.only(left: 25.0, right: 30.0,top: 30),

                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 20.0,left: 0.0,),
                          child: Container(
                              height:
                              MediaQuery.of(context).size.height - 50.0,
                              child: ListView(children: [
                                Card(
                                  color: Colors.tealAccent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(75.0),
                                        topRight: Radius.circular(75.0),
                                        bottomLeft: Radius.circular(75.0),
                                        bottomRight: Radius.circular(75.0)),
                                  ),
                                  child: InkWell(
                                    splashColor:
                                    Colors.cyanAccent.withAlpha(30),
                                    onTap: () {
                                    },
                                    child: Container(
                                      height: 60.0,
                                      width: 50.0,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                  'SEM - 1',
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    foreground: Paint()..shader = bg,
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                        offset: Offset(2.0, 2.0),
                                                        blurRadius: 3.0,
                                                        color: Colors.white,
                                                      ),
                                                      Shadow(
                                                        offset: Offset(1.0, 1.0),
                                                        blurRadius: 2.0,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),
                                Card(
                                  color: Colors.tealAccent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(75.0),
                                        topRight: Radius.circular(75.0),
                                        bottomLeft: Radius.circular(75.0),
                                        bottomRight: Radius.circular(75.0)),
                                  ),
                                  child: InkWell(
                                    splashColor:
                                    Colors.cyanAccent.withAlpha(30),
                                    onTap: () {
                                    },
                                    child: Container(
                                      height: 60.0,
                                      width: 50.0,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                  'SEM - 2',
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    foreground: Paint()..shader = bg,
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                        offset: Offset(2.0, 2.0),
                                                        blurRadius: 3.0,
                                                        color: Colors.white,
                                                      ),
                                                      Shadow(
                                                        offset: Offset(1.0, 1.0),
                                                        blurRadius: 2.0,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),
                                Card(
                                  color: Colors.tealAccent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(75.0),
                                        topRight: Radius.circular(75.0),
                                        bottomLeft: Radius.circular(75.0),
                                        bottomRight: Radius.circular(75.0)),
                                  ),
                                  child: InkWell(
                                    splashColor:
                                    Colors.cyanAccent.withAlpha(30),
                                    onTap: () {
                                    },
                                    child: Container(
                                      height: 60.0,
                                      width: 50.0,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                  'SEM - 3',
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    foreground: Paint()..shader = bg,
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                        offset: Offset(2.0, 2.0),
                                                        blurRadius: 3.0,
                                                        color: Colors.white,
                                                      ),
                                                      Shadow(
                                                        offset: Offset(1.0, 1.0),
                                                        blurRadius: 2.0,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),
                                Card(
                                  color: Colors.tealAccent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(75.0),
                                        topRight: Radius.circular(75.0),
                                        bottomLeft: Radius.circular(75.0),
                                        bottomRight: Radius.circular(75.0)),
                                  ),
                                  child: InkWell(
                                    splashColor:
                                    Colors.cyanAccent.withAlpha(30),
                                    onTap: () {
                                    },
                                    child: Container(
                                      height: 60.0,
                                      width: 50.0,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                  'SEM - 4',
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    foreground: Paint()..shader = bg,
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                        offset: Offset(2.0, 2.0),
                                                        blurRadius: 3.0,
                                                        color: Colors.white,
                                                      ),
                                                      Shadow(
                                                        offset: Offset(1.0, 1.0),
                                                        blurRadius: 2.0,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),
                                Card(
                                  color: Colors.tealAccent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(75.0),
                                        topRight: Radius.circular(75.0),
                                        bottomLeft: Radius.circular(75.0),
                                        bottomRight: Radius.circular(75.0)),
                                  ),
                                  child: InkWell(
                                    splashColor:
                                    Colors.cyanAccent.withAlpha(30),
                                    onTap: () {
                                    },
                                    child: Container(
                                      height: 60.0,
                                      width: 50.0,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                  'SEM - 5',
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    foreground: Paint()..shader = bg,
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                        offset: Offset(2.0, 2.0),
                                                        blurRadius: 3.0,
                                                        color: Colors.white,
                                                      ),
                                                      Shadow(
                                                        offset: Offset(1.0, 1.0),
                                                        blurRadius: 2.0,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),
                                Card(
                                  color: Colors.tealAccent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(75.0),
                                        topRight: Radius.circular(75.0),
                                        bottomLeft: Radius.circular(75.0),
                                        bottomRight: Radius.circular(75.0)),
                                  ),
                                  child: InkWell(
                                    splashColor:
                                    Colors.cyanAccent.withAlpha(30),
                                    onTap: () {
                                    },
                                    child: Container(
                                      height: 60.0,
                                      width: 50.0,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                  'SEM - 6',
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    foreground: Paint()..shader = bg,
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                        offset: Offset(2.0, 2.0),
                                                        blurRadius: 3.0,
                                                        color: Colors.white,
                                                      ),
                                                      Shadow(
                                                        offset: Offset(1.0, 1.0),
                                                        blurRadius: 2.0,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(),



                              ]))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<Null> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Container(
                color: Colors.transparent,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    Text(
                      'Exit app',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Are you sure to exit app?',
                      style: TextStyle(color: Colors.white70, fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                      child: Text(
                        'CANCEL',
                        style: TextStyle(
                            color: Colors.cyanAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(70, 0, 0, 0),
                      child: Text(
                        'YES',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        })) {
      case 0:
        break;
      case 1:
        exit(0);
        break;
    }
  }
}
