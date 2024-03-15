// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../bloc/storeBusiness/store_business_bloc.dart';
import '../../../common/constant/konekseed_color.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../common/widget/custom_alert_dialog.dart';
import '../../../data/models/request/store_business_request_models.dart';
import '../../../provider/user_provider.dart';
import '../../auth/widget/pop_up_message.dart';
import '../../home/home_screen.dart';

class ButtonStoreBusiness extends StatelessWidget {
  const ButtonStoreBusiness({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.userIdController,
    required this.logoController,
    required this.sectorController,
    required this.statusController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController userIdController;
  final TextEditingController logoController;
  final TextEditingController sectorController;
  final TextEditingController statusController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreBusinessBloc, StoreBusinessState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () {
            return PrimaryButton(
              name: 'Add New Business',
              onPress: () {
                customAlertDialog(
                  context,
                  'Add Business',
                  'Are you sure to input your data?',
                  'Business added successfully',
                  false,
                  () {
                    if (formKey.currentState!.validate()) {
                      final x =
                          Provider.of<UserProvider>(context, listen: false);
                      final storeModel = StoreBusinessRequestModel(
                        name: nameController.text,
                        userId: x.getUserId.toString(),
                        logo: logoController.text,
                        sector: sectorController.text,
                        status: statusController.text,
                      );
                      print(nameController.text);
                      print(userIdController.text);
                      print(logoController.text);
                      print(sectorController.text);
                      print(statusController.text);
                      context
                          .read<StoreBusinessBloc>()
                          .add(StoreBusinessEvent.storeBusiness(storeModel));
                    }
                  },
                );
              },
            );
          },
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (success) async {
            log('success store data');
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Center(
                    child: Text(
                      'Business ${nameController.text} telah berhasil ditambahkan',
                    ),
                  ),
                  backgroundColor: KonekSeed.primaryColor,
                  showCloseIcon: true,
                  closeIconColor: Colors.white,
                ),
              );
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              }
            }
          },
          error: (error) async {
            await showDialog(
              context: context,
              builder: (context) => PopUpMessage(
                message: error,
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
    );
  }
}
