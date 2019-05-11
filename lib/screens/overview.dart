import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My App Bar")),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: 100,
            title: Text(
                'Sliver App Bar - hides on scroll'),
            floating: true,
            pinned: false,
            snap: true,
          ),
          SliverFillRemaining(
            child: Container(height: 600, child: Text('page contents')),
          )
        ]));
  }
}
