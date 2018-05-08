import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MyHomePage createState() => new MyHomePage();
}

class MyHomePage extends State<MyApp> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _numberController = new TextEditingController();

  String usrName = "Suruch Boss";
  String passWord = "test01";
  String myNumber = "02-123-4567";
  var children = [];

  void initState() {
    _userController.text = usrName;
    _passwordController.text = passWord;
    _numberController.text = myNumber;

    return super.initState();
  }

  void goBack() {}

  void openConf() {}

  @override
  Widget build(BuildContext context) {
    double picSize = 150.0;
    double marginTop = 40.0;
    double marginLeft = 0.0;
    double marginRight = 0.0;
    double marginBut = 20.0;
    double blursize = 3.0;

    Widget myPhoto = new Container(
      alignment: Alignment.center,
      margin: new EdgeInsets.fromLTRB(
          marginLeft, marginTop, marginRight, marginBut),
      height: picSize,
      width: picSize,
      child: new FlatButton(
          child: new Container(
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage('images/sample.jpg')),
            ),
          ),
          onPressed: () {
             
          }),
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
        backgroundColor: Colors.grey[800],
        appBar: new AppBar(
          backgroundColor: Colors.grey[700],
          title: new Center(
              child: new Text('My Profile', textAlign: TextAlign.center)),
          leading: new IconButton(
            icon: new Icon(Icons.backspace),
            onPressed: () {
              goBack();
            },
          ),
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
                  decoration:
                      new BoxDecoration(color: Colors.grey[700], boxShadow: [
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
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: new Text("Left")),
          ],
        ),
      ),
    );
  }
}
