import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:faker/faker.dart';
import 'package:khanagi_app/call_screen.dart';
import 'package:khanagi_app/chat_screen.dart';
import 'Widgets/Avatar.dart';
import 'helpers.dart';
import 'message_data.dart';
// ignore: depend_on_referenced_packages

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Messsage"),
        ),
        body: SingleChildScrollView(
          child: DefaultTabController(
            length: 2,
            child: Column(children: [
              const TabBar(
                indicatorWeight: 3,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('Chats')),
                  Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Text('Calls')),
                ],
              ),
              SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: TabBarView(children: [
                  CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            final Faker faker = Faker();
                            final date = Helpers.randomDate();
                            return MessageTitle(
                                messageData: MessageData(
                                    senderName: faker.person.name(),
                                    message: faker.lorem.sentence(),
                                    messageDate: date,
                                    // dateMessage: Jiffy.parseFromDateTime(date).fromNow(),
                                    profilePicture:
                                        Helpers.randomPictureUrl()));
                          },
                          childCount:
                              20, // Replace 20 with the actual number of messages
                        ),
                      ),
                    ],
                  ),
                  const CallScreen()
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class MessageTitle extends StatelessWidget {
  const MessageTitle({super.key, required this.messageData});
  final MessageData messageData;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(ChatScreen.route(messageData));
        },
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.all(0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 8.0, left: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Avatar.medium(
                      url: messageData.profilePicture,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          messageData.senderName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 18,
                              wordSpacing: 1.5,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                          height: 15,
                          child: Text(messageData.message,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12))),
                    ],
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 22,
                          width: 22,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          messageData.messageDate.toUpperCase(),
                          style: const TextStyle(
                              letterSpacing: -0.2,
                              fontSize: 11,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
