import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyHomePage();
  }
}

class _MyHomePage extends State<MyHomePage> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _numberController = new TextEditingController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  File _image;

  Color grey700 = Colors.grey[700];
  Color grey800 = Colors.grey[800];
  Color grey = Colors.grey;

  String usrName = 'Suruch Boss';
  String passWord = "test01";
  String myNumber = "02-123-4567";

  int _index = 0;

  VoidCallback _showPersBottomSheetCallBack;

  void initState() {
    _userController.text = usrName;
    _passwordController.text = passWord;
    _numberController.text = myNumber;
    _showPersBottomSheetCallBack = _showBottomSheet;

    return super.initState();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void _showBottomSheet() {
    setState(() {
      _showPersBottomSheetCallBack = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return new Container(
            height: 100.0,
            width: 800.0,
            color: grey,
            child: new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Container(
                    width: 500.0,
                    height: 50.0,
                    decoration: new BoxDecoration(color: grey, boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                      ),
                    ]),
                    child: new FlatButton(
                        child: const Text('Take Photo'), onPressed: getImage),
                  ),
                  new Container(
                    width: 500.0,
                    height: 50.0,
                    decoration: new BoxDecoration(color: grey, boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                      ),
                    ]),
                    child: new FlatButton(
                        child: const Text('Select From Album '),
                        onPressed: pickImage),
                  ),
                ],
              ),
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersBottomSheetCallBack = _showBottomSheet;
            });
          }
        });
  }

  Future<Null> _neverSatisfied() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Logout'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Logout Application ? '),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Yes'),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/screen1');
              },
            ),
            new FlatButton(
              child: new Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void openConf() {
    //print("Button 1");
    Navigator.of(context).pushNamed('/screen3');
  }

  void closeApp() {
    _neverSatisfied();
  }

  @override
  Widget build(BuildContext context) {
    double picSize = 150.0;
    double marginTop = 30.0;
    double marginLeft = 0.0;
    double marginRight = 0.0;
    double marginBut = 20.0;
    double blursize = 3.0;

    Widget myPhoto = new Container(
      alignment: Alignment.center,
      margin: new EdgeInsets.fromLTRB(
          marginLeft, marginTop, marginRight, marginBut),
      height: picSize,
      width: picSize + 30.0,
      child: _image == null
          ? new FlatButton(
              child: new Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new AssetImage('images/sample.jpg')),
                ),
              ),
              onPressed: _showPersBottomSheetCallBack,
            )
          : new FlatButton(
              child: new Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover, image: new FileImage(_image)),
                ),
              ),
              onPressed: _showPersBottomSheetCallBack,
            ),
    );

    Widget userName = new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new TextField(
            controller: _userController,
            autocorrect: false,
            decoration: new InputDecoration(
                hintText: 'User Name',
                icon: new Icon(Icons.person),
                labelText: 'Username'),
          ),
          new TextField(
            controller: _passwordController,
            obscureText: true,
            autocorrect: false,
            decoration: new InputDecoration(
              hintText: 'Password',
              icon: new Icon(Icons.lock),
              labelText: 'Password',
            ),
            onChanged: (String value) {
              usrName = value;
            },
          ),
          new TextField(
            controller: _numberController,
            autocorrect: false,
            decoration: new InputDecoration(
                hintText: 'Phone Number',
                icon: new Icon(Icons.phone),
                labelText: 'Phone Number'),
          ),
        ],
      ),
    );

    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: grey800,
        key: _scaffoldKey,
        appBar: new AppBar(
          backgroundColor: grey700,
          title: new Center(
              child: new Text('My Profile', textAlign: TextAlign.center)),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.settings),
              onPressed: () {
                openConf();
              },
            ),
          ],
        ),
        body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Container(child: myPhoto),
              new Container(
                  decoration: new BoxDecoration(color: grey700, boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      blurRadius: blursize,
                    ),
                  ]),
                  child: userName),
            ],
          ),
        ),
        bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _index,
          onTap: (int index) {
            closeApp();
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: new Icon(Icons.vpn_key), title: new Text("Logout")),
          ],
        ),
      ),
    );
  }
}
