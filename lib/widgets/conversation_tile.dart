import 'package:chatbot_simulator_app/models/conversation/conversation.dart';
import 'package:chatbot_simulator_app/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class ConversationTile extends StatelessWidget {
  const ConversationTile({
    super.key,
    required this.conversation,
  });

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          ConversationContentRow(
            conversation: conversation,
          ),
          const SizedBox(height: 10.0),
          const Divider(height: 1.0),
        ],
      ),
    );
  }
}
