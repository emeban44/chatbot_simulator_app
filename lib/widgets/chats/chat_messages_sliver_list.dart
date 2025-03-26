import 'package:chatbot_simulator_app/models/chat_message/chat_message.dart';
import 'package:flutter/material.dart';

import 'chat_message_tile.dart';

class ChatMessagesSliverList extends StatelessWidget {
  const ChatMessagesSliverList({
    super.key,
    required this.chatMessages,
  });

  final List<ChatMessage> chatMessages;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: chatMessages.length,
        (context, index) {
          final ChatMessage message = chatMessages[index];

          return ChatMessageTile(message: message);
        },
      ),
    );
  }
}
