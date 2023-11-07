import 'dart:ui';

import 'package:flutter/material.dart';

import 'MyPasswordResetScreen.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String selectedEmail = "";

  List<AccountItem> accountItems = [
    AccountItem(name: 'John Doe', email: 'john@example.com'),
    AccountItem(name: 'Jane Doe', email: 'jane@example.com'),
    AccountItem(name: 'Bob Smith', email: 'bob@example.com'),
    AccountItem(name: 'Alice Johnson', email: 'alice@example.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 32,
                    color: Colors.black,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Switch between your existing account and manage your account.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  color: Colors.black.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: accountItems.length,
                itemBuilder: (context, index) {
                  AccountItem item = accountItems[index];
                  bool isSelected = item.email == selectedEmail;
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.email),
                    leading: CircleAvatar(
                      backgroundColor: isSelected ? Colors.blue : Colors.grey,
                      child: Text(item.name[0], style: TextStyle(fontSize: 24)),
                    ),
                    onTap: () {
                      setState(() {
                        selectedEmail = item.email;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(selectedEmail),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to add another account
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Add Another Account',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountItem {
  final String name;
  final String email;

  AccountItem({required this.name, required this.email});
}