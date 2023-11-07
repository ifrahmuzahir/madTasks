import 'package:flutter/material.dart';

class TabbedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabbed Page'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(child: Center(child: Text('Tab 1 Content'))),
            Container(child: Center(child: Text('Tab 2 Content'))),
            Container(child: Center(child: Text('Tab 3 Content'))),
          ],
        ),
      ),
    );
  }
}
