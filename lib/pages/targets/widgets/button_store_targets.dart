// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../bloc/storeTargets/store_targets_bloc.dart';
import '../../../common/constant/konekseed_color.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../common/widget/custom_alert_dialog.dart';
import '../../../data/models/request/store_target_request_models.dart';
import '../../../provider/target_provider.dart';
import '../../auth/widget/pop_up_message.dart';
import '../../main_screen.dart';

class ButtonStoreTargets extends StatelessWidget {
  const ButtonStoreTargets({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.productController,
    required this.categoryController,
    required this.weightController,
    required this.statusController,
    required this.startDateController,
    required this.endDateController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController productController;
  final TextEditingController categoryController;
  final TextEditingController weightController;
  final TextEditingController statusController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreTargetBloc, StoreTargetState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () {
            return PrimaryButton(
              name: 'Tambah Data',
              onPress: () {
                customAlertDialog(
                  context,
                  'Tambah Data',
                  'Apakah anda yakin untuk menambahkan data tersebut?',
                  'Data telah berhasil ditambahkan',
                  false,
                  () {
                    final x =
                        Provider.of<TargetProvider>(context, listen: false);
                    if (formKey.currentState!.validate()) {
                      final storeModel = StoreTargetRequestModel(
                        businessId: '1',
                        productId: '${x.getProductId}',
                        name: nameController.text,
                        category: categoryController.text,
                        weight: weightController.text,
                        startDate: '2024-04-12',
                        endDate: '2024-04-17',
                        status: statusController.text,
                      );
                      context
                          .read<StoreTargetBloc>()
                          .add(StoreTargetEvent.storeTarget(storeModel));
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
                      'Targets ${nameController.text} telah berhasil ditambahkan',
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
                    builder: (context) => const MainScreen(),
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
