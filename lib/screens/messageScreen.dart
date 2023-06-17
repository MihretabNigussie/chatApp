import 'package:flutter/material.dart';
import 'package:welcome/screens/chatMessages.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import '../constants.dart';
import 'imageScreen.dart';
import 'package:image_picker/image_picker.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final String _avatarTag = 'avatar';

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
            backgroundColor: kContentColorLightTheme,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileScreen(
                          avatarTag: _avatarTag,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: screen.width * 0.05,
                    backgroundImage: AssetImage('assets/birke.jpg'),
                  ),
                ),
                SizedBox(
                  width: screen.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Birke gorebet',
                      style: TextStyle(fontSize: screen.width * 0.04),
                    ),
                    SizedBox(
                      height: screen.height * 0.01,
                    ),
                    Text(
                      'Active 16m ago',
                      style: TextStyle(fontSize: screen.width * 0.03),
                    )
                  ],
                )
              ],
            ),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(
                        Icons.delete_outline,
                      ),
                      title: Text('Clear Text'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirm Action'),
                              content: Text(
                                  'Are you sure you want to delete all the text?'),
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
                                    'Delete',
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
                  ),
                  // PopupMenuItem(
                  //   child: ListTile(
                  //     leading: Icon(
                  //       Icons.block_outlined,
                  //     ),
                  //     title: Text('Block user'),
                  //     onTap: () {
                  //       showDialog(
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return AlertDialog(
                  //             title: Text('Confirm Action'),
                  //             content: Text(
                  //                 'Are you sure you want to block this user?'),
                  //             actions: <Widget>[
                  //               TextButton(
                  //                 child: Text('Cancel'),
                  //                 onPressed: () {
                  //                   // Close the dialog box
                  //                   Navigator.of(context).pop();
                  //                 },
                  //               ),
                  //               TextButton(
                  //                 child: Text(
                  //                   'Block',
                  //                   style: TextStyle(color: Colors.red),
                  //                 ),
                  //                 onPressed: () {},
                  //               ),
                  //             ],
                  //           );
                  //         },
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
                icon: Icon(Icons.more_vert),
              )
            ]),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Body(),
            ),
            SizedBox(height: screen.height * 0.02),
            Container(
              color: kContentColorLightTheme,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(screen.width * 0.015),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              hintText: 'Send a message',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: screen.width * 0.01,
                            child: IconButton(
                              icon: Icon(Icons.photo_library_outlined),
                              onPressed: () async {
                                final pickedFile = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (pickedFile != null) {
                                  // Do something with the selected file, such as display it in your app.
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screen.width * 0.02),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showEmojiPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: 300,
          ),
          child: EmojiPicker(
            onEmojiSelected: (emoji, category) {
              setState(() {
                var text = category.toString();

                String myEmoji = '';

                for (var cha
                    in text.runes.map((rune) => String.fromCharCode(rune))) {
                  if (!RegExp(r'[a-zA-Z\p{P}:,\-]').hasMatch(cha)) {
                    myEmoji += cha;
                  }
                }
                myEmoji = myEmoji.replaceAll(RegExp(r'\s+'), '');
                _textEditingController.text += myEmoji;
              });
            },
          ),
        );
      },
    );
  }
}
