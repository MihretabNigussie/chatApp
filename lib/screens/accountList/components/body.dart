import 'package:flutter/material.dart';
import '../../messageScreen.dart';
import 'commentCard.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
