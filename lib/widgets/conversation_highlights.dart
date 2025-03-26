import 'package:chatbot_simulator_app/models/conversation/conversation.dart';
import 'package:flutter/material.dart';

class ConversationHighlights extends StatelessWidget {
  const ConversationHighlights({
    super.key,
    required this.conversation,
  });

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          conversation.topic,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          conversation.lastMessage,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
