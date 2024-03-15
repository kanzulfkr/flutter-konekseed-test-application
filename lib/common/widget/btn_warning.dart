import 'package:flutter/material.dart';

import '../constant/utils.dart';

class WarningButton extends StatefulWidget {
  const WarningButton({
    super.key,
    required this.name,
    required this.onPress,
  });
  final String name;
  final Function onPress;

  @override
  State<WarningButton> createState() => _WarningButtonState();
}

class _WarningButtonState extends State<WarningButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 173, 22, 11),
        foregroundColor: KonekSeed.black,
        minimumSize: const Size(400, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: const BorderSide(color: Color.fromARGB(255, 143, 133, 133)),
      ),
      onPressed: () {
        widget.onPress(); // Call the onPress function provided in the widget
      },
      child: Text(
        widget.name,
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Poppins',
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
