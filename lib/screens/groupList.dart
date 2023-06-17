import 'package:flutter/material.dart';

import '../constants.dart';
import 'messageScreen.dart';

List commenters = [
  CommentCard(
      comment: 'It was so exciting. I love you!',
      firstName: 'Kalkidan',
      lastName: 'Belay',
      image: 'assets/proPic1.jpg',
      sender: 'Kalkidan',
      lastSeen: '2 hrs ago'),
  CommentCard(
      comment: 'Ere man fchi :)',
      firstName: 'Kaleb',
      lastName: '',
      image: 'assets/proPic2.jpg',
      sender: 'Kaleb',
      lastSeen: '55 minutes ago'),
  CommentCard(
      comment: 'Ljun gn endet ayeshiw',
      firstName: 'Eden',
      lastName: '',
      image: 'assets/proPic3.jpg',
      sender: 'Eden',
      lastSeen: '11 minutes ago'),
  CommentCard(
      comment: 'melsun lakew',
      firstName: 'sami',
      lastName: 'class',
      image: 'assets/proPic6.jpg',
      sender: 'sami',
      lastSeen: '3 hrs ago'),
  CommentCard(
      comment: 'gidelew beka!',
      firstName: 'Ashebr',
      lastName: 'gym',
      image: 'assets/proPic5.jpg',
      sender: 'Ashebr',
      lastSeen: '20 minutes ago'),
  CommentCard(
      comment: 'man beka tewat gedel tgba.. betin tebek argek yaz',
      firstName: 'bruk',
      lastName: '',
      image: 'assets/proPic8.jpg',
      sender: 'bruk',
      lastSeen: '34 minutes ago'),
  CommentCard(
      comment: 'sma kulf alek ende',
      firstName: 'Kidus',
      lastName: 'dorm',
      image: 'assets/proPic7.jpg',
      sender: 'Kidus',
      lastSeen: '5 hrs ago'),
  CommentCard(
      comment: 'Mothern selam beyilign',
      firstName: 'Mahi',
      lastName: 'sis',
      image: 'assets/proPic4.jpg',
      sender: 'Mahi',
      lastSeen: '2 hrs ago'),
  CommentCard(
      comment: 'assets/sma kulf alek ende',
      firstName: 'Kidus',
      lastName: 'dorm',
      image: 'assets/proPic7.jpg',
      sender: 'Kidus',
      lastSeen: '5 hrs ago'),
  CommentCard(
      comment: 'gidelew beka!',
      firstName: 'Ashebr',
      lastName: 'gym',
      image: 'assets/proPic5.jpg',
      sender: 'Ashebr',
      lastSeen: '20 minutes ago'),
];

class CommentCard extends StatelessWidget {
  CommentCard({
    Key? key,
    required this.comment,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.lastSeen,
    required this.sender,
  }) : super(key: key);

  final String image;
  final String firstName;
  final String lastName;
  final String comment;
  final String lastSeen;
  final String sender;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return ListTile(
      leading: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 30,
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
      subtitle: Expanded(
        child: RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          text: TextSpan(
            style: TextStyle(
              fontSize: 16.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '$sender: ',
                style: TextStyle(
                  color: kContentColorLightTheme,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: comment,
              ),
            ],
          ),
        ),
      ),
      trailing: Text(
        lastSeen,
        style: TextStyle(
          color: kContentColorLightTheme,
          fontSize: 12,
        ),
      ),
    );
  }
}

class GroupBody extends StatefulWidget {
  const GroupBody({super.key});

  @override
  State<GroupBody> createState() => _BodyState();
}

class _BodyState extends State<GroupBody> {
  bool isCommmentThere = true;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Padding(
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
    );
  }
}
