import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: ListView(
        children: <Widget>[
          ProfileCard(
            name: 'John Doe',
            description: 'Software Developer',
            image: 'assets/image1.jpg',
          ),
          ProfileCard(
            name: 'Jane Smith',
            description: 'Graphic Designer',
            image: 'assets/image2.jpg',
          ),
          ProfileCard(
            name: 'Alice Johnson',
            description: 'Marketing Specialist',
            image: 'assets/image3.jpeg',
          ),
          // Add more ProfileCard widgets as needed
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  ProfileCard({
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 30,
        ),
        title: Text(name),
        subtitle: Text(description),
      ),
    );
  }
}