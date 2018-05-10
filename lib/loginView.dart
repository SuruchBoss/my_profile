import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  Color grey700 = Colors.grey[700];
  Color grey800 = Colors.grey[800];

  String usrName = "";
  String passWord = "";

  double picSize = 200.0;
  double marginTop = 20.0;
  double marginLeft = 0.0;
  double marginRight = 0.0;
  double marginBut = 30.0;

  @override
  Widget build(BuildContext context) {
    Widget myPhoto = new Container(
      alignment: Alignment.center,
      margin: new EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBut),
      height: picSize,
      width: picSize,
      child: new Container(
        child: new Image(
            fit: BoxFit.cover, image: new AssetImage('images/BNK48.png')),
      ),
    );

    Widget userName = new Container(
      alignment: Alignment.center,
      margin: new EdgeInsets.fromLTRB(
          marginLeft, marginTop, marginRight, marginBut),
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
        ],
      ),
    );

    return new Scaffold(
      backgroundColor: grey800,
      appBar: new AppBar(
        backgroundColor: grey700,
        title:
            new Center(child: new Text('Login', textAlign: TextAlign.center)),
      ),
      body: new Container(
        padding: new EdgeInsets.all(40.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Container(child: myPhoto),
            new Container(
                padding: new EdgeInsets.all(5.0),
                decoration: new BoxDecoration(color: grey700, boxShadow: [
                  new BoxShadow(
                    color: Colors.black,
                    blurRadius: 2.0,
                  ),
                ]),
                child: userName),
            new Container(
              margin: new EdgeInsets.all(60.0),
              child: new RaisedButton(
                child: const Text('Login'),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/screen2');
                },
              ),
              // new Expanded(
              //   child: ,
              // )
            )
          ],
        ),
      ),
    );
  }
}
