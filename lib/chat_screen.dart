import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khanagi_app/Widgets/icon_buttons.dart';
import 'package:khanagi_app/message_data.dart';
import 'package:khanagi_app/message_page.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageData data) => MaterialPageRoute(
      builder: ((context) => ChatScreen(
            messageData: data,
          )));

  const ChatScreen({
    Key? key,
    required this.messageData,
  }) : super(key: key);
  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 40,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconButtons(
            icon: CupertinoIcons.arrow_left,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          messageData.senderName,
          style: TextStyle(color: Colors.black54),
        ),
        //const _AppBarTitle(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: IconButtons(
                icon: Icons.call_outlined,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: IconButtons(
                icon: Icons.video_call_outlined,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
      body: Text("tesr"),
    );
  }
}

class DemoMessageList extends StatelessWidget {
  const DemoMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DateLable(label: 'Yesterday'),
        MessageTile(message: 'Hi Lucy', messagedate: '12:01 PM'),
        MessageOwnTile(message: 'Hey', messagedate: '12:05 PM'),
        MessageTile(message: 'Do you want starbucks', messagedate: '12:05 PM'),
        MessageOwnTile(message: 'Would be awesome', messagedate: '12:06 PM'),
      ],
    );
  }
}

class DateLable extends StatelessWidget {
  const DateLable({Key? key, required this.label}) : super(key: key);

  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
