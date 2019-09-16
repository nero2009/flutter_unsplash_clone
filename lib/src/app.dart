import 'package:flutter/material.dart';
import 'screens/imagelist.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'View Images',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('View Images'),
        ),
        body: ImageList(),
      ),
    );
  }
}
