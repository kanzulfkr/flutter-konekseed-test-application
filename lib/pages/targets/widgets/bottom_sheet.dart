import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/target/target_bloc.dart';
import '../../../common/constant/konekseed_color.dart';
import '../../../common/widget/custom_alert_dialog.dart';
import '../../../provider/target_provider.dart';
import '../edit_targets_screen.dart';

class BottomSheetTargets extends StatelessWidget {
  const BottomSheetTargets({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: KonekSeed.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      height: 350,
      child: Column(
        children: [
          const SizedBox(height: 5),
          const Divider(
            color: Colors.grey,
            endIndent: 175,
            indent: 175,
            thickness: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: KonekSeed.backgroundColorScreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'To do',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: const BoxDecoration(
                  color: KonekSeed.backgroundColorScreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'In Progress',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: KonekSeed.backgroundColorScreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            decoration: const BoxDecoration(
              color: KonekSeed.backgroundColorScreen,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.document_scanner_outlined),
                  title: const Text(
                    'Lihat detail targets',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Divider(thickness: 0.5, height: 5),
                ListTile(
                  leading: const Icon(Icons.mode_edit_outlined),
                  title: const Text(
                    'Edit',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditTargetsScreen(),
                      ),
                    );
                  },
                ),
                const Divider(thickness: 0.5, height: 5),
                ListTile(
                  leading: const Icon(
                    Icons.delete_outline_rounded,
                    color: KonekSeed.red,
                  ),
                  title: const Text(
                    'Hapus',
                    style: TextStyle(
                      color: KonekSeed.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop;
                    customAlertDialog(
                      context,
                      'Delete Target',
                      'Are you sure to delete targets?',
                      'Targets has been deleted',
                      true,
                      () {
                        Provider.of<TargetProvider>(context, listen: false)
                            .deleteTargets(id);

                        Navigator.pop(context);
                        Navigator.pop(context);

                        context
                            .read<TargetBloc>()
                            .add(const TargetEvent.getTarget());
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
