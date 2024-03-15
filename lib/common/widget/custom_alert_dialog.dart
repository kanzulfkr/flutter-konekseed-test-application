import 'package:flutter/material.dart';

import 'btn_primary.dart';
import 'btn_secondary.dart';
import 'custom_scaffold_messager.dart';

Future<dynamic> customAlertDialog(
  BuildContext context,
  String texttitle,
  String textParagraph,
  String textSuccess,
  bool isScaffold,
  Function onPressSubmit,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(texttitle),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              Text(
                textParagraph,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: SecondaryButton(
                      name: 'No',
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: PrimaryButton(
                      name: 'Yes',
                      onPress: () {
                        onPressSubmit();
                        isScaffold
                            ? customScaffoldMessager(context, textSuccess)
                            : null;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
