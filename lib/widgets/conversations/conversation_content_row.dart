import 'package:chatbot_simulator_app/models/conversation/conversation.dart';
import 'package:chatbot_simulator_app/utils/time_helper.dart';
import 'package:chatbot_simulator_app/widgets/_widgets.dart';
import 'package:flutter/material.dart';

class ConversationContentRow extends StatelessWidget {
  const ConversationContentRow({
    super.key,
    required this.conversation,
  });

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          ConversationAvatar(
            conversation: conversation,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: ConversationHighlights(conversation: conversation),
          ),
          const SizedBox(width: 10.0),
          Text(
            TimeHelper.timeAgo(
              DateTime.fromMillisecondsSinceEpoch(conversation.modifiedAt),
            ),
          ),
        ],
      ),
    );
  }
}
