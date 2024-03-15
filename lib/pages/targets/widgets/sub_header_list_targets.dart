import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/constant/utils.dart';

class SubHeaderListTargets extends StatelessWidget {
  const SubHeaderListTargets({
    super.key,
    required this.daysDifference,
    required this.status,
  });

  final String status;
  final int daysDifference;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 73, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            status,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: KonekSeed.primaryColor),
          ),
          Text(
            '$daysDifference days left',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: KonekSeed.red,
            ),
          ),
        ],
      ),
    );
  }
}
