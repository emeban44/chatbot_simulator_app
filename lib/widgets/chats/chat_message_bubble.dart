import 'package:chatbot_simulator_app/models/chat_message/chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: message.isCurrentUserSender ? Colors.blueGrey : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Text(
        message.lastMessage,
        style: TextStyle(
          fontSize: 14.0,
          color: message.isCurrentUserSender ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
