import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'M PLUS 1p',
        primarySwatch: Colors.blue,
      ),
      home: TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  TopPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int userNum = 2;

  void _decrementUser() {
    final int minUserNum = 2;
    setState(() {
      if (userNum > minUserNum) {
        userNum--;
      }
    });
  }

  void _incrementUser() {
    final int maxUserNum = 9;
    setState(() {
      if (userNum < maxUserNum) {
        userNum++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Widget background = Container(
      height: double.infinity,
      width: double.infinity,
      decoration:new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('images/top.png'),
          fit: BoxFit.cover,
        ),
      ),
    );

    final Widget btnGroup = Container(child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                'アプリ名は未定',
                style: TextStyle(fontSize: 40.0, color: Colors.grey[300], fontWeight: FontWeight.bold),
              ),
            )
          ),
          Center(child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                color: Colors.grey[300],
                icon: Icon(Icons.remove),
                onPressed: _decrementUser,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '$userNum',
                  style: TextStyle(fontSize: 60.0, color: Colors.grey[300], fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, top: 22.0),
                child: Text(
                  '人',
                  style: TextStyle(fontSize: 25.0, color: Colors.grey[300]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: IconButton(
                  color: Colors.grey[300],
                  icon: Icon(Icons.add),
                  onPressed: _incrementUser,
                ),
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.0),
              child: ButtonTheme(
                minWidth: 320.0,
                height: 48.0,
                child: OutlineButton(
                  child: Text(
                    'スタート',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  shape: StadiumBorder(),
                  textColor: Colors.grey[300],
                  borderSide: BorderSide(color: Colors.grey[300]),
                  highlightedBorderColor: Colors.grey[300],
                  onPressed: () {},
                ),
              ),
            )
          ),
        ],
      ),
    );

    return Scaffold(
      body: Stack(children: <Widget>[
        background,
        btnGroup,
      ]),
    );
  }
}
