import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/about.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('header'),
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
            ),
            ListTile(
                title: Text('About'),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    )),
          ],
        ),
      );
}
