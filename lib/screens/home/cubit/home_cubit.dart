import 'dart:convert';
import 'dart:io';

import 'package:chatbot_simulator_app/models/conversation/conversation.dart';
import 'package:chatbot_simulator_app/network/endpoints.dart';
import 'package:chatbot_simulator_app/utils/json_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState());

  Future<void> init() async {
    try {
      final response = await http.get(
        Uri.parse(Endpoints.inbox),
      );

      if (response.statusCode == 200) {
        final String cleanedJson = JsonHelper.cleanJson(response.body);
        final List<dynamic> data = json.decode(cleanedJson);
        final List<Conversation> conversations = data.map((json) => Conversation.fromJson(json)).toList();
        emit(HomeLoadedState(conversations: conversations));
      } else {
        throw HttpException(
          'fetchConversations failed with status code ${response.statusCode}!',
        );
      }
    } catch (error) {
      emit(HomeErrorState(errorMessage: error.toString()));
    }
  }
}
