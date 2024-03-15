import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_konekseed/bloc/updateTargets/update_targets_bloc.dart';
import 'package:provider/provider.dart';
import '../../../bloc/storeTargets/store_targets_bloc.dart';
import '../../../common/constant/konekseed_color.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../common/widget/custom_alert_dialog.dart';
import '../../../data/models/request/update_target_request_models.dart';
import '../../../provider/target_provider.dart';
import '../../auth/widget/pop_up_message.dart';
import '../../main_screen.dart';

class ButtonUpdateTargets extends StatelessWidget {
  const ButtonUpdateTargets({
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
              name: 'Simpan Data',
              onPress: () {
                customAlertDialog(
                  context,
                  'Edit Data',
                  'Apakah anda yakin untuk mempebarui pada data tersebut?',
                  'Data telah berhasil diperbarui',
                  false,
                  () {
                    final x =
                        Provider.of<TargetProvider>(context, listen: false);
                    if (formKey.currentState!.validate()) {
                      final storeModel = UpdateTargetRequestModel(
                        id: x.getTargetsId.toString(),
                        businessId: '${x.getBusinessId}',
                        productId: '${x.getProductId}',
                        name: nameController.text,
                        category: categoryController.text,
                        weight: weightController.text,
                        startDate: startDateController.text,
                        endDate: endDateController.text,
                        status: statusController.text,
                      );
                      context
                          .read<UpdateTargetsBloc>()
                          .add(UpdateTargetsEvent.updateTargets(storeModel));
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
