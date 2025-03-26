import 'package:chatbot_simulator_app/models/chat_message/chat_message.dart';
import 'package:chatbot_simulator_app/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class ChatMessageTile extends StatelessWidget {
  const ChatMessageTile({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isCurrentUserSender ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            crossAxisAlignment: message.isCurrentUserSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message.sender,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              ChatMessageBubble(
                message: message,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
