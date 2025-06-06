import 'dart:convert';
import 'dart:io';

import 'package:chatbot_simulator_app/models/chat_message/chat_message.dart';
import 'package:chatbot_simulator_app/models/conversation/conversation.dart';
import 'package:chatbot_simulator_app/network/endpoints.dart';
import 'package:chatbot_simulator_app/utils/json_helper.dart';
import 'package:http/http.dart' as http;

class ChatRepository {
  // Private static instance of the repository.
  static final ChatRepository _instance = ChatRepository._internal();

  // Private constructor.
  ChatRepository._internal();

  // Factory constructor that returns the single instance, and
  // ensures that only one instance of ChatRepository is created and shared
  // throughout the app, saving memory and ensuring consistency.
  factory ChatRepository() {
    return _instance;
  }

  Future<List<Conversation>> fetchConversations() async {
    try {
      final response = await http.get(Uri.parse(Endpoints.inbox));

      if (response.statusCode == 200) {
        final String cleanedJson = JsonHelper.cleanJson(response.body);
        final List<dynamic> data = json.decode(cleanedJson);
        return data.map((json) => Conversation.fromJson(json)).toList();
      } else {
        throw HttpException('fetchConversations failed with status code ${response.statusCode}!');
      }
    } catch (error) {
      throw Exception('Error fetching conversations: $error');
    }
  }

  Future<List<ChatMessage>> fetchChatMessages(String conversationId) async {
    try {
      final response = await http.get(Uri.parse(Endpoints.conversationDetails(conversationId)));

      if (response.statusCode == 200) {
        final String cleanedJson = JsonHelper.cleanJson(response.body);
        final List<dynamic> data = json.decode(cleanedJson);
        return data.map((json) => ChatMessage.fromJson(json)).toList();
      } else {
        throw HttpException('fetchChatMessages failed with status code ${response.statusCode}!');
      }
    } catch (error) {
      throw Exception('Error fetching chat messages: $error');
    }
  }
}
