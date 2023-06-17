import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/colorUtils.dart';

enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  late final String text;
  final Image? image;
  final MessageStatus messageStatus;
  final bool isSender;
  final bool isText;

  ChatMessage({
    this.text = '',
    this.image,
    required this.messageStatus,
    required this.isSender,
    required this.isText,
  });
}

List chatMessage = [
  ChatMessage(
    text: 'Hi Birke',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
    text: 'Hi Gete',
    messageStatus: MessageStatus.viewed,
    isSender: false,
    isText: true,
  ),
  ChatMessage(
    text: 'Endet nesh baksh',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
    text: 'Kibru yisfa.. anchis',
    messageStatus: MessageStatus.viewed,
    isSender: false,
    isText: true,
  ),
  ChatMessage(
    text: 'Alehulish birke.. balsh endet new',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
    text: 'dena new.. yanchis derbew',
    messageStatus: MessageStatus.viewed,
    isSender: false,
    isText: true,
  ),
  ChatMessage(
    text: 'Minabatu yihonal blesh new ene eyalehulet',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
    text: 'hahaha.. ay gete',
    messageStatus: MessageStatus.viewed,
    isSender: false,
    isText: true,
  ),
  ChatMessage(
    text: 'hahaha.. ay birke',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
    text: 'anchi meches ayalkbshm',
    messageStatus: MessageStatus.viewed,
    isSender: false,
    isText: true,
  ),
  ChatMessage(
    text: 'weregna eyalshign new??',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
    text: 'ere anchi setiyo ende endeza alalkum',
    messageStatus: MessageStatus.viewed,
    isSender: false,
    isText: true,
  ),
  ChatMessage(
    text: 'alsh enji..bey chaw enjeraye arere',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
    text: 'ere anchi setiyo ende endeza alalkum',
    messageStatus: MessageStatus.viewed,
    isSender: false,
    isText: true,
  ),
  ChatMessage(
    text: 'weregna eyalshign new??',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
    text: 'anchi meches ayalkbshm',
    messageStatus: MessageStatus.viewed,
    isSender: false,
    isText: true,
  ),
  ChatMessage(
    text: 'hahaha.. ay birke',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
    text: 'hahaha.. ay gete',
    messageStatus: MessageStatus.viewed,
    isSender: false,
    isText: true,
  ),
  ChatMessage(
    isText: false,
    messageStatus: MessageStatus.viewed,
    isSender: true,
    image: Image(image: AssetImage('assets/proPic3.jpg')),
  ),
  ChatMessage(
    text: 'hahaha.. ay birke',
    messageStatus: MessageStatus.viewed,
    isSender: true,
    isText: true,
  ),
  ChatMessage(
      messageStatus: MessageStatus.viewed, isSender: true, isText: false)
];

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: chatMessage.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 8.0);
        },
        itemBuilder: (BuildContext context, int index) {
          final message = chatMessage[index];
          return Messages(message: message);
        },
      ),
    );
  }
}

class Messages extends StatefulWidget {
  const Messages({Key? key, required this.message}) : super(key: key);

  final ChatMessage message;

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String _editedText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: widget.message.isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTapDown: (details) {
                _showPopupMenu(context, details.globalPosition);
              },
              onLongPress: () {
                _showEditDialog(context);
              },
              child: widget.message.isText
                  ? Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: widget.message.isSender
                            ? hexStringToColor('CB2B93')
                            : hexStringToColor('5E61F4'),
                        borderRadius: widget.message.isSender
                            ? BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(3),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(3),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                      ),
                      child: Text(
                        _editedText.isNotEmpty
                            ? _editedText
                            : widget.message.text,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: AspectRatio(
                        aspectRatio: 1.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: widget.message.image,
                        ),
                      ),
                    )),
        ],
      ),
    );
  }

  void _showPopupMenu(BuildContext context, Offset position) async {
    final selectedValue = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(position.dx, position.dy, 0, 0),
      items: [
        PopupMenuItem(
          value: 'Copy',
          child: Text('Copy text'),
        ),
        PopupMenuItem(
          value: 'Edit',
          child: Text('Edit text'),
        ),
        PopupMenuItem(
          value: 'Delete',
          child: Text('Delete text'),
        ),
      ],
    );

    if (selectedValue != null) {
      switch (selectedValue) {
        case 'Copy':
          // handle copy action
          _copyToClipboard(widget.message.text);
          break;
        case 'Edit':
          _showEditDialog(context);
          break;
        case 'Delete':
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirm Action'),
                content: Text('Are you sure you want to delete this text?'),
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
          break;
        default:
          // handle unknown action
          break;
      }
    }
  }

  void _showEditDialog(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: widget.message.text);
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.message.text.length));
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit message'),
          content: TextField(
            controller: controller,
            onChanged: (value) {
              setState(() {
                _editedText = value;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                widget.message.text = _editedText;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((_) {
      // After dialog is closed, set the cursor position to the end of the edited text.
      controller.selection =
          TextSelection.fromPosition(TextPosition(offset: _editedText.length));
    });
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
