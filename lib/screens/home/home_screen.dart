import 'package:chatbot_simulator_app/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_cubit.dart';
import 'views/_views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Conversations'),
      body: BlocProvider(
        create: (context) => HomeCubit()..init(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            switch (state) {
              case HomeLoadedState():
                return HomeLoadedView(
                  conversations: state.conversations,
                );
              case HomeLoadingState():
                return const CommonLoadingView();
              case HomeErrorState():
                return CommonErrorView(
                  errorMessage: state.errorMessage,
                );
            }
          },
        ),
      ),
    );
  }
}
