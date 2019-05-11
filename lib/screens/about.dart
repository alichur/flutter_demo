import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/details.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("About")),
        body: Center(
          child: RaisedButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Details()),
                ),
            child: Text('Go deeper'),
          ),
        ));
  }
}
