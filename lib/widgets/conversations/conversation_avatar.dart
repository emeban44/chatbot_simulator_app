import 'package:chatbot_simulator_app/models/conversation/conversation.dart';
import 'package:flutter/material.dart';

class ConversationAvatar extends StatelessWidget {
  const ConversationAvatar({
    super.key,
    required this.conversation,
  });

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.0,
      backgroundColor: Colors.blueGrey,
      child: Icon(
        conversation.isGroupConversation ? Icons.people : Icons.person,
      ),
    );
  }
}
