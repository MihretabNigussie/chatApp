import 'package:flutter/material.dart';

import '../components/myDrawer.dart';
import '../constants.dart';

import 'accountList/eventComment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.person_add_alt_1),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Display the drawer when the icon is pressed
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: kContentColorLightTheme,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Chats')),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: const EventComment(),
      ),
      drawer: MyDrawer(),
    );
  }
}
