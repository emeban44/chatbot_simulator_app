import 'package:chatbot_simulator_app/models/chat_message/chat_message.dart';
import 'package:chatbot_simulator_app/screens/chat/cubit/chat_cubit.dart';
import 'package:chatbot_simulator_app/widgets/chats/chat_messages_sliver_list.dart';
import 'package:chatbot_simulator_app/widgets/chats/chat_write_new_message_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatLoadedView extends StatefulWidget {
  const ChatLoadedView({
    super.key,
    required this.chatMessages,
  });

  final List<ChatMessage> chatMessages;

  @override
  State<ChatLoadedView> createState() => _ChatLoadedViewState();
}

class _ChatLoadedViewState extends State<ChatLoadedView> {
  final TextEditingController _newMessageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 300)).then(
          (_) => _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 20.0,
            duration: const Duration(milliseconds: 350),
            curve: Curves.ease,
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scrollController.dispose();
    _newMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listenWhen: (previous, current) => current is ChatLoadedState,
      listener: (context, state) => _scrollToMaxExtent(),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
                ChatMessagesSliverList(chatMessages: widget.chatMessages),
                const SliverToBoxAdapter(child: SizedBox(height: 80.0)),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: ChatWriteNewMessageField(
              focusNode: _focusNode,
              onFieldSubmitted: _onMessageSent,
              textEditingController: _newMessageController,
            ),
          ),
        ],
      ),
    );
  }

  void _onMessageSent(String message) {
    if (message.isNotEmpty) {
      context.read<ChatCubit>().writeNewChatMessage(message);
      _newMessageController.clear();
    }
  }

  void _scrollToMaxExtent() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
