import 'package:flutter/material.dart';

import '../../../constants.dart';

List commenters = [
  CommentCard(
      comment: 'It was so exciting. I love you!',
      firstName: 'Kalkidan',
      lastName: 'Belay',
      image: 'assets/proPic1.jpg',
      lastSeen: '2 hrs ago'),
  CommentCard(
      comment: 'Ere man fchi :)',
      firstName: 'Kaleb',
      lastName: '',
      image: 'assets/proPic2.jpg',
      lastSeen: '55 minutes ago'),
  CommentCard(
      comment: 'Ljun gn endet ayeshiw',
      firstName: 'Eden',
      lastName: '',
      image: 'assets/proPic3.jpg',
      lastSeen: '11 minutes ago'),
  CommentCard(
      comment: 'melsun lakew',
      firstName: 'sami',
      lastName: 'class',
      image: 'assets/proPic6.jpg',
      lastSeen: '3 hrs ago'),
  CommentCard(
      comment: 'gidelew beka!',
      firstName: 'Ashebr',
      lastName: 'gym',
      image: 'assets/proPic5.jpg',
      lastSeen: '20 minutes ago'),
  CommentCard(
      comment: 'man beka tewat gedel tgba.. betin tebek argek yaz',
      firstName: 'bruk',
      lastName: '',
      image: 'assets/proPic8.jpg',
      lastSeen: '34 minutes ago'),
  CommentCard(
      comment: 'sma kulf alek ende',
      firstName: 'Kidus',
      lastName: 'dorm',
      image: 'assets/proPic7.jpg',
      lastSeen: '5 hrs ago'),
  CommentCard(
      comment: 'Mothern selam beyilign',
      firstName: 'Mahi',
      lastName: 'sis',
      image: 'assets/proPic4.jpg',
      lastSeen: '2 hrs ago'),
  CommentCard(
      comment: 'assets/sma kulf alek ende',
      firstName: 'Kidus',
      lastName: 'dorm',
      image: 'assets/proPic7.jpg',
      lastSeen: '5 hrs ago'),
  CommentCard(
      comment: 'gidelew beka!',
      firstName: 'Ashebr',
      lastName: 'gym',
      image: 'assets/proPic5.jpg',
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
  }) : super(key: key);

  final String image;
  final String firstName;
  final String lastName;
  final String comment;
  final String lastSeen;

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
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 13,
                width: 13,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
              ),
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
        child: Text(
          comment,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
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
