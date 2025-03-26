import 'package:flutter/material.dart';

class ChatWriteNewMessageField extends StatelessWidget {
  const ChatWriteNewMessageField({
    super.key,
    required this.focusNode,
    required this.textEditingController,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        autocorrect: false,
        focusNode: focusNode,
        controller: textEditingController,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: TextInputAction.send,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
          hintText: 'Write a message...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
