import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:faker/faker.dart';
import 'package:khanagi_app/Widgets/Avatar.dart';
import 'package:khanagi_app/helpers.dart';
import 'package:khanagi_app/message_data.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    final Faker faker = Faker();
    final date = Helpers.randomDate();
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final Faker faker = Faker();
            final date = Helpers.randomDate();
            return CallCard(
                messageData: MessageData(
                    senderName: faker.person.name(),
                    message: faker.lorem.sentence(),
                    messageDate: date,
                    // dateMessage: Jiffy.parseFromDateTime(date).fromNow(),
                    profilePicture: Helpers.randomPictureUrl()));
          },
          childCount: 20, // Replace 20 with the actual number of messages
        ),
      )
    ]));
  }
}

class CallCard extends StatelessWidget {
  const CallCard({super.key, required this.messageData});
  final MessageData messageData;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.all(0),
          child: ListTile(
            leading: Avatar.medium(
              url: messageData.profilePicture,
            ),
            title: Text(
              messageData.senderName,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Row(children: [
              const Icon(
                Icons.call_made,
                size: 20,
                color: Colors.green,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                messageData.messageDate,
                style: const TextStyle(fontSize: 13),
              )
            ]),
            trailing: const Icon(
              Icons.call,
              size: 26,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
