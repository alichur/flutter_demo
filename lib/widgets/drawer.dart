import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) =>
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
            ),
            ListTile(
                title: Text('About'), onTap: () => Navigator.pop(context)),
          ],
        ),
      );
}