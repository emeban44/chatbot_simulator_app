part of 'home_cubit.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required this.conversations,
  });

  final List<Conversation> conversations;

  @override
  List<Object?> get props => [conversations];
}

final class HomeErrorState extends HomeState {
  const HomeErrorState({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
