import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ConfigView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ConfigView();
  }
}

class _ConfigView extends State<ConfigView> {
  List<String> country = <String>[
    'Select language',
    'Thai',
    'English',
    'Japan'
  ];
  String _selectedList = "";

  void initState() {
    _selectedList = country[0];

    return super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color grey700 = Colors.grey[700];
    Color grey800 = Colors.grey[800];

    Widget config_lang = new Container(
      width: double.INFINITY,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text(
                'Select Langugae',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              new DropdownButton<String>(
                value: _selectedList,
                onChanged: (String newValue) {
                  setState(() {
                    _selectedList = newValue;
                  });
                },
                items: country.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(
                      value,
                      textAlign: TextAlign.center,
                      style: new TextStyle(color: Colors.black87),
                    ),
                  );
                }).toList(),
              ),
            ],
          )
        ],
      ),
    );

    var val = 5;

    Widget config_sound = new Container(
      width: double.INFINITY,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text(
                'Volumn: ',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              new CupertinoSlider(
                value: val.toDouble(),
                min: 1.0,
                max: 50.0,
                divisions: 5,
                onChanged: (double newValue) {
                  setState(() {
                    val = newValue.round();
                  });
                },
              ),
            ],
          )
        ],
      ),
    );

    return new Scaffold(
      backgroundColor: grey800,
      appBar: new AppBar(
        backgroundColor: grey700,
        title: new Center(
            child: new Text('My Profile', textAlign: TextAlign.center)),
        leading: new IconButton(
          icon: new Icon(Icons.backspace),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ),
      body: new Center(
        child: new Container(
          width: double.INFINITY,
          padding: const EdgeInsets.all(30.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Container(
                  decoration: new BoxDecoration(color: grey700, boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                    ),
                  ]),
                  child: config_lang),
                    new Container(
                  decoration: new BoxDecoration(color: grey700, boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      blurRadius: 2.0,
                    ),
                  ]),
                  child: config_sound),
            ],
          ),
        ),
      ),
    );
  }
}
