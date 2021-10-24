import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'apps_drawer.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviedbMain()
    );
  }

}

class MoviedbMain extends StatefulWidget{
  MoviedbMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _MoviedbMain();
  }
}

class _MoviedbMain extends State<MoviedbMain>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Home", style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      drawer: AppsDrawer(),
    );
  }

}