import 'package:flutter/material.dart';

class CTextFieldStoreBusiness extends StatelessWidget {
  const CTextFieldStoreBusiness({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.isProduct,
    required this.readOnly,
    required this.numberOnly,
  });

  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final bool isProduct;

  final bool readOnly;
  final bool numberOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: numberOnly ? TextInputType.number : TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          letterSpacing: 0.3,
          fontSize: 14,
        ),
        prefixIcon: icon, // ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.5),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '"Please fill in the form."';
        }
        return null;
      },
      onTap: () {
        // hintText.contains('petugas') || hintText.contains('catatan')
        //     ? null
        //     : Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const SearchProductScreen(),
        //         ),
        //       );
      },
    );
  }
}
