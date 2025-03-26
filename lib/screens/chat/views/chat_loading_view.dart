import 'package:flutter/material.dart';

class ChatLoadingView extends StatelessWidget {
  const ChatLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
