import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/constant/konekseed_color.dart';
import '../../../provider/target_provider.dart';

class BottomSheetStatus extends StatefulWidget {
  const BottomSheetStatus({
    super.key,
  });

  @override
  State<BottomSheetStatus> createState() => _BottomSheetStatusState();
}

class _BottomSheetStatusState extends State<BottomSheetStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: KonekSeed.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
      height: 200,
      child: Column(
        children: [
          const SizedBox(height: 5),
          const Divider(
            color: Colors.grey,
            endIndent: 175,
            indent: 175,
            thickness: 5,
          ),
          const SizedBox(height: 10),
          const Text(
            'Choose Status',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  color: KonekSeed.backgroundColorScreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<TargetProvider>(context, listen: false)
                          .setStatusController('To do');
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    'To do',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                decoration: const BoxDecoration(
                  color: KonekSeed.backgroundColorScreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<TargetProvider>(context, listen: false)
                          .setStatusController('In progress');
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    'In Progress',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  color: KonekSeed.backgroundColorScreen,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Provider.of<TargetProvider>(context, listen: false)
                          .setStatusController('Done');
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
