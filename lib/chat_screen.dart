import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khanagi_app/Widgets/camera.dart';
import 'package:khanagi_app/Widgets/icon_buttons.dart';
import 'package:khanagi_app/Widgets/ownMessageCard.dart';
import 'package:khanagi_app/Widgets/replyCard.dart';
import 'package:khanagi_app/message_data.dart';
// ignore: depend_on_referenced_packages
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'Widgets/Attachment_Pop_Up.dart';

class ChatScreen extends StatefulWidget {
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
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

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
            widget.messageData.senderName,
            style: const TextStyle(color: Colors.black54),
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
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 140,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    OwnMessageCard(),
                    ReplyMessageCard(),
                    OwnMessageCard(),
                    ReplyMessageCard(),
                    OwnMessageCard(),
                    ReplyMessageCard(),
                    OwnMessageCard(),
                    ReplyMessageCard(),
                    OwnMessageCard()
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 70,
                          child: Card(
                            margin: const EdgeInsets.only(
                                left: 20, right: 10, bottom: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              textAlignVertical: TextAlignVertical.center,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type an message",
                                  prefixIcon: IconButton(
                                    icon: const Icon(Icons.emoji_emotions),
                                    onPressed: () {
                                      setState(() {
                                        emojiShowing = !emojiShowing;
                                      });
                                    },
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showAttachmentPopUp(context);
                                          },
                                          icon: const Icon(Icons.attach_file)),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CameraScreen()));
                                        },
                                        icon: const Icon(Icons.camera_alt),
                                      )
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.all(5)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, right: 10, left: 5),
                          child: CircleAvatar(
                            radius: 25,
                            child: IconButton(
                              icon: const Icon(
                                Icons.mic,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                    Offstage(
                      offstage: !emojiShowing,
                      child: SizedBox(
                          height: 250,
                          child: EmojiPicker(
                            textEditingController: _controller,
                            onBackspacePressed: _onBackspacePressed,
                            config: Config(
                              columns: 7,
                              // Issue: https://github.com/flutter/flutter/issues/28894
                              emojiSizeMax: 32 *
                                  (foundation.defaultTargetPlatform ==
                                          TargetPlatform.iOS
                                      ? 1.30
                                      : 1.0),
                              verticalSpacing: 0,
                              horizontalSpacing: 0,
                              gridPadding: EdgeInsets.zero,
                              initCategory: Category.RECENT,
                              bgColor: const Color(0xFFF2F2F2),
                              indicatorColor: Colors.blue,
                              iconColor: Colors.grey,
                              iconColorSelected: Colors.blue,
                              backspaceColor: Colors.blue,
                              skinToneDialogBgColor: Colors.white,
                              skinToneIndicatorColor: Colors.grey,
                              enableSkinTones: true,
                              recentTabBehavior: RecentTabBehavior.RECENT,
                              recentsLimit: 28,
                              replaceEmojiOnLimitExceed: false,
                              noRecents: const Text(
                                'No Recents',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black26),
                                textAlign: TextAlign.center,
                              ),
                              loadingIndicator: const SizedBox.shrink(),
                              tabIndicatorAnimDuration: kTabScrollDuration,
                              categoryIcons: const CategoryIcons(),
                              buttonMode: ButtonMode.MATERIAL,
                              checkPlatformCompatibility: true,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

void showAttachmentPopUp(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const AttachmentPopUp();
    },
  ).then((value) {
    // Do something with the selected attachment option
    if (value != null) {
      print('Selected attachment: $value');
    }
  });
}
