import 'package:flutter/material.dart';

class PopUpMessage extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  const PopUpMessage({
    Key? key,
    required this.message,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      title: const Text('Message'),
      content: Text(message),
      titleTextStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      contentTextStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
