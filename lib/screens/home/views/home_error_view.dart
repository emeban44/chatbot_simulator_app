import 'package:flutter/material.dart';

class HomeErrorView extends StatelessWidget {
  const HomeErrorView({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage);
  }
}
