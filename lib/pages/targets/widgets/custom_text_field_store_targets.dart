import 'package:flutter/material.dart';

import '../search_product_screen.dart';
import 'bottom_sheet_category.dart';
import 'bottom_sheet_status.dart';

class CTextFieldStoreTargets extends StatelessWidget {
  const CTextFieldStoreTargets({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.isProduct,
    required this.isCategory,
    required this.isStatus,
    required this.readOnly,
    required this.numberOnly,
  });

  final TextEditingController controller;
  final String hintText;
  final Icon icon;
  final bool isProduct;
  final bool isCategory;
  final bool isStatus;
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
        isProduct
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchProductScreen(),
                ),
              )
            : isCategory
                ? showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const BottomSheetCategory();
                    },
                  )
                : isStatus
                    ? showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const BottomSheetStatus();
                        },
                      )
                    : null;
      },
    );
  }
}
