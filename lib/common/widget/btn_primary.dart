import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/constant/konekseed_color.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.name,
    required this.onPress,
  });
  final String name;
  final Function onPress;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: KonekSeed.primaryColor,
        foregroundColor: KonekSeed.white,
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
