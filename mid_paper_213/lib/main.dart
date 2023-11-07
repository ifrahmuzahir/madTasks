import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friend Profile App',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Set the primary color to purple
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAuthenticated = false;

  void authenticateUser() {
    // For simplicity, just set isAuthenticated to true.
    setState(() {
      isAuthenticated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.orange],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Login Page',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.blue),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.blue),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigate to the FriendsPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FriendsPage()),
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FriendsPage extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: 'John Smith', email: 'JohnSmith@gmail.com', description: 'Charles Otto Puth Jr. is an American singer, songwriter, and record producer. His initial exposure came through the viral success of his song covers uploaded to YouTube.', imageUrl: 'assets/images/friend.jpeg'),
    Friend(name: 'abc', email: 'abc@gmail.com', description: 'Shawn Peter Raul Mendes is a Canadian singer-songwriter. He gained a following in 2013, when he posted song covers on the video sharing platform Vine.', imageUrl: 'assets/images/friend2.jpeg'),
    Friend(name: 'xyz', email: 'xyz@gmail.com', description: 'Selena Marie Gomez is an American singer, actress, businesswoman and producer. She has won numerous accolades, including an American Music Award, two MTV Video Music Awards, broke 16 Guinness World Records, and received nominations for two Grammy Awards, a Golden Globe Award, and four Emmy Awards.', imageUrl: 'assets/images/friend3.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Navigate back to the login page and remove all previous routes
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AuthenticationPage()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(friends[index].imageUrl),
            ),
            title: Text(friends[index].name),
            subtitle: Text('Email: ${friends[index].email}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(friends[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Friend friend;

  ProfilePage(this.friend);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile: ${friend.name}'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Portfolio'),
              Tab(text: 'Skills'),
              Tab(text: 'Achievements'),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.orange],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(friend.imageUrl),
                  radius: 80,
                ),
              ),
              // Display Followers and Following
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Followers',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '500', // Replace with actual number of followers
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '200', // Replace with actual number of following
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Buttons to Follow and Hire
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement follow functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.orange,
                    ),
                    child: Text('Follow'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Implement hire functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.orange,
                    ),
                    child: Text('Hire'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Description
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  friend.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              // Tab Bar for Portfolio, Skills, and Achievements
              Expanded(
                child: TabBarView(
                  children: [
                    // Portfolio Tab
                    Center(
                      child: Text('Portfolio content goes here'),
                    ),
                    // Skills Tab
                    Center(
                      child: Text('Skills content goes here'),
                    ),
                    // Achievements Tab
                    Center(
                      child: Text('Achievements content goes here'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Friend {
  final String name;
  final String email;
  final String description;
  final String imageUrl;

  Friend({required this.name, required this.email, required this.description, required this.imageUrl});
}