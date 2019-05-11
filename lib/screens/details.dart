import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Center(child: Text('Whoa 2 levels deep! Use the app bar to navigate backs')),
    );
  }
}
