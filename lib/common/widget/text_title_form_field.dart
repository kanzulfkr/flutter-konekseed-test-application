import 'package:flutter/material.dart';

class TitleFormField extends StatelessWidget {
  const TitleFormField({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: '',
        ),
      ),
    );
  }
}
