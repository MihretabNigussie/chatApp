import 'package:flutter/material.dart';

import '../components/myDrawer.dart';
import '../constants.dart';

import 'groupList.dart';
import 'pesronList/eventComment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool index = true;
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
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        print('Icon tapped!');
                        setState(() {
                          index = true;
                        });
                      },
                      child: Icon(Icons.person))),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        print('Icon tapped 2!');
                        setState(() {
                          index = false;
                        });
                      },
                      child: Icon(Icons.people_outline))),
            ],
          ),
          index
              ? Expanded(
                  child: Container(
                    color: Colors.white,
                    child: const EventComment(),
                  ),
                )
              : Expanded(
                  child: Container(color: Colors.white, child: GroupBody()))
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
