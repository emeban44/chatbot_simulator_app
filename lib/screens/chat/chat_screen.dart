import 'package:chatbot_simulator_app/router/custom_router.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    required this.conversationId,
  });

  static const String routeName = '/chat-screen';

  final String conversationId;

  static Route<Widget> routeDefault({
    required String conversationId,
  }) {
    return CustomRouter.cupertinoTransition(
      settings: const RouteSettings(name: routeName),
      screen: ChatScreen(conversationId: conversationId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Chat'),
      ),
    );
  }
}
