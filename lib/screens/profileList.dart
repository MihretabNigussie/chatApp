import 'package:flutter/material.dart';

import '../constants.dart';

import 'home.dart';
import 'messageScreen.dart';

List commenters = [
  CommentCard(
    firstName: 'Kalkidan',
    lastName: 'Belay',
    image: 'assets/proPic1.jpg',
  ),
  CommentCard(
    firstName: 'Kaleb',
    lastName: '',
    image: 'assets/proPic2.jpg',
  ),
  CommentCard(
    firstName: 'Eden',
    lastName: '',
    image: 'assets/proPic3.jpg',
  ),
  CommentCard(
    firstName: 'sami',
    lastName: 'class',
    image: 'assets/proPic6.jpg',
  ),
  CommentCard(
    firstName: 'Ashebr',
    lastName: 'gym',
    image: 'assets/proPic5.jpg',
  ),
  CommentCard(
    firstName: 'bruk',
    lastName: '',
    image: 'assets/proPic8.jpg',
  ),
  CommentCard(
    firstName: 'Kidus',
    lastName: 'dorm',
    image: 'assets/proPic7.jpg',
  ),
  CommentCard(
    firstName: 'Mahi',
    lastName: 'sis',
    image: 'assets/proPic4.jpg',
  ),
  CommentCard(
    firstName: 'Kidus',
    lastName: 'dorm',
    image: 'assets/proPic7.jpg',
  ),
  CommentCard(
    firstName: 'Ashebr',
    lastName: 'gym',
    image: 'assets/proPic5.jpg',
  ),
];

class ProfileList extends StatefulWidget {
  const ProfileList({super.key});

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(screen.width * 0.01),
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MessageScreen()));
                    },
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: commenters.length,
                      itemBuilder: (context, index) {
                        final comment = commenters[index];
                        return comment;
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 0.5,
                          height: screen.height * 0.005,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: screen.height * 0.02),
              ],
            ),
          ),
        ));
  }
}

class CommentCard extends StatelessWidget {
  CommentCard({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.image,
  }) : super(key: key);

  final String image;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(image),
            ),
          ],
        ),
      ),
      title: Flexible(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            '$firstName $lastName',
            style: TextStyle(
              color: kContentColorLightTheme,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
