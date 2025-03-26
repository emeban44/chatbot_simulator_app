import 'package:flutter/material.dart';

class ChatErrorView extends StatelessWidget {
  const ChatErrorView({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage);
  }
}
