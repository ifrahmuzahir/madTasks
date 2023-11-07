import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Replace this with your navigation logic for the Home section.
                // For example, Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                // Replace this with your navigation logic for the Search section.
                // For example, Navigator.pushNamed(context, '/search');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Replace this with your navigation logic for the Settings section.
                // For example, Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the Home section'),
      ),
    );
  }
}