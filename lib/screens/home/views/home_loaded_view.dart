import 'package:chatbot_simulator_app/models/conversation/conversation.dart';
import 'package:chatbot_simulator_app/router/custom_router.dart';
import 'package:chatbot_simulator_app/screens/chat/chat_screen.dart';
import 'package:chatbot_simulator_app/widgets/conversation_tile.dart';
import 'package:flutter/material.dart';

class HomeLoadedView extends StatelessWidget {
  const HomeLoadedView({
    super.key,
    required this.conversations,
  });

  final List<Conversation> conversations;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: conversations.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _navigateToChatScreen(index),
              child: ConversationTile(
                conversation: conversations[index],
              ),
            );
          },
        ),
      ],
    );
  }

  void _navigateToChatScreen(int index) {
    CustomRouter.push(
      ChatScreen.routeDefault(
        conversationId: conversations[index].id,
      ),
    );
  }
}
