import 'package:flutter/material.dart';

import '../../../common/constant/konekseed_color.dart';

class FormInputEmail extends StatelessWidget {
  const FormInputEmail({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        hintText: 'your.name@email.com',
        hintStyle: TextStyle(
          color: KonekSeed.grey,
          letterSpacing: 0.2,
          fontSize: 14,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: Icon(Icons.mail_outline),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email tidak boleh kosong.';
        }
        return null;
      },
    );
  }
}
