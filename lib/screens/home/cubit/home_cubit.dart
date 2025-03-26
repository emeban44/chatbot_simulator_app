import 'package:chatbot_simulator_app/models/conversation/conversation.dart';
import 'package:chatbot_simulator_app/repositories/chat_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoadingState());

  final ChatRepository _chatRepository = ChatRepository();

  List<Conversation> _conversations = <Conversation>[];

  Future<void> init() async {
    try {
      final List<Conversation> conversations = await _chatRepository.fetchConversations();
      _conversations = [...conversations];
      emit(HomeLoadedState(conversations: _conversations));
    } catch (error) {
      emit(HomeErrorState(errorMessage: error.toString()));
    }
  }
}
