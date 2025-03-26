part of 'chat_cubit.dart';

@immutable
sealed class ChatState extends Equatable {
  const ChatState();
}

final class ChatLoadingState extends ChatState {
  @override
  List<Object?> get props => [];
}

final class ChatLoadedState extends ChatState {
  const ChatLoadedState({
    required this.chatMessages,
  });

  final List<ChatMessage> chatMessages;

  @override
  List<Object?> get props => [chatMessages];
}

final class ChatErrorState extends ChatState {
  const ChatErrorState({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
