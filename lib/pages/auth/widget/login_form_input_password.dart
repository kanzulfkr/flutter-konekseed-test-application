import 'package:flutter/material.dart';

import '../../../common/constant/konekseed_color.dart';

class FormInputPassword extends StatefulWidget {
  const FormInputPassword({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<FormInputPassword> createState() => _FormInputPasswordState();
}

class _FormInputPasswordState extends State<FormInputPassword> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 12 * 4),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.passwordController,
      obscureText: !_isVisible,
      decoration: InputDecoration(
        hintText: 'Masukkan kata sandi anda',
        hintStyle: const TextStyle(
          color: KonekSeed.grey,
          letterSpacing: 0.2,
          fontSize: 14,
        ),
        prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Icon(
                _isVisible ? Icons.lock_open_outlined : Icons.lock_outline)),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          icon: _isVisible
              ? const Icon(
                  Icons.visibility,
                  color: Colors.grey,
                )
              : const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong.';
        }
        return null;
      },
    );
  }
}
