import 'package:flutter/material.dart';

import '../constant/konekseed_color.dart';

void customScaffoldMessager(BuildContext context, String textSuccess) {
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            textSuccess,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: KonekSeed.primaryColor,
        showCloseIcon: true,
        closeIconColor: Colors.white,
      ),
    );
  }
}
