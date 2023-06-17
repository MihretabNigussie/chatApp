import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/profileScreen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          color: kContentColorLightTheme,
          width: double.infinity,
          height: 150,
          padding: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/proPic7.jpg'),
                radius: 30,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Kidus',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '@kidu7',
                style: TextStyle(fontSize: 14, color: Colors.white),
              )
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text("Profile"),
          onTap: () {
             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => UserProfile()),
  );
            // Navigate to home screen
          },
        ),
        ListTile(
          leading: Icon(Icons.logout_outlined),
          title: Text("Logout"),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Confirm Action'),
                  content: Text('Are you sure you want to logout?'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        // Close the dialog box
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {},
                    ),
                  ],
                );
              },
            );
          },
        ),
      ]),
    );
  }
}
