import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/constant/konekseed_color.dart';

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({
    super.key,
    required this.name,
    required this.onPress,
  });
  final String name;
  final Function onPress;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: KonekSeed.white,
        foregroundColor: KonekSeed.black,
        minimumSize: const Size(400, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: const BorderSide(
          color: Colors.black54,
          width: 0.5,
        ),
      ),
      onPressed: () {
        widget.onPress();
      },
      child: Text(
        widget.name,
        style: const TextStyle(
          fontSize: 16.0,
          fontFamily: 'Poppins',
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
