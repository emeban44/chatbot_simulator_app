import 'package:chatbot_simulator_app/router/custom_router.dart';
import 'package:chatbot_simulator_app/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/chat_cubit.dart';
import 'views/_views.dart';

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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: 'Chat'),
        body: BlocProvider(
          create: (context) => ChatCubit()..init(conversationId),
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              switch (state) {
                case ChatLoadedState():
                  return ChatLoadedView(
                    chatMessages: state.chatMessages,
                  );
                case ChatLoadingState():
                  return const CommonLoadingView();
                case ChatErrorState():
                  return CommonErrorView(
                    errorMessage: state.errorMessage,
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
