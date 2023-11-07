import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  final List<String> items = List.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              _showItemDialog(context, items[index]);
            },
          );
        },
      ),
    );
  }

  void _showItemDialog(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selected Item'),
          content: Text('You tapped: $item'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}