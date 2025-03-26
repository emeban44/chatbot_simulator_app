import 'dart:convert';
import 'dart:io';

import 'package:chatbot_simulator_app/models/chat_message/chat_message.dart';
import 'package:chatbot_simulator_app/network/endpoints.dart';
import 'package:chatbot_simulator_app/utils/json_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatLoadingState());

  List<ChatMessage> _chatMessages = <ChatMessage>[];

  Future<void> init(String conversationId) async {
    try {
      final response = await http.get(
        Uri.parse(Endpoints.conversationDetails(conversationId)),
      );

      if (response.statusCode == 200) {
        final String cleanedJson = JsonHelper.cleanJson(response.body);
        final List<dynamic> data = json.decode(cleanedJson);
        final List<ChatMessage> chatMessages = data.map((json) => ChatMessage.fromJson(json)).toList();
        _chatMessages = [...chatMessages];
        emit(ChatLoadedState(chatMessages: _chatMessages));
      } else {
        throw HttpException(
          'fetchChatMessages failed with status code ${response.statusCode}!',
        );
      }
    } catch (error) {
      emit(ChatErrorState(errorMessage: error.toString()));
    }
  }

  void writeNewChatMessage(String message) async {
    _chatMessages = List<ChatMessage>.from(_chatMessages)
      ..add(
        ChatMessage(
          id: 'id',
          lastMessage: message,
          sender: 'You',
          modifiedAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );

    emit(ChatLoadedState(chatMessages: _chatMessages));

    await Future.delayed(
      const Duration(seconds: 2),
      () => _addBotResponse(),
    );
  }

  void _addBotResponse() {
    _chatMessages = List<ChatMessage>.from(_chatMessages)
      ..add(
        ChatMessage(
          id: 'bot_response',
          sender: 'Bot',
          lastMessage: _generateRandomResponse(),
          modifiedAt: DateTime.now().millisecondsSinceEpoch,
        ),
      );

    emit(ChatLoadedState(chatMessages: _chatMessages));
  }

  String _generateRandomResponse() {
    List<String> responses = [
      "I loved that movie too, that's cool!",
      "Can you be more specific?",
      "I would always advise you to follow your dreams!",
      "I'm not sure I understand.",
      "Let's talk about this tomorrow."
    ];
    responses.shuffle();
    return responses.first;
  }
}
