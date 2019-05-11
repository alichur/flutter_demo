import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/drawer.dart';

//overlapping text issue
//https://github.com/flutter/flutter/issues/14227

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: 100,
            title: Text('Sliver App Bar'),
            flexibleSpace: FlexibleSpaceBar(title: Text('hides on scroll')),
            floating: true,
            pinned: true,
            snap: true,
          ),
          SliverFillRemaining(
            child: Container(height: 600, child: Text('page contents')),
          )
        ]));
  }
}
