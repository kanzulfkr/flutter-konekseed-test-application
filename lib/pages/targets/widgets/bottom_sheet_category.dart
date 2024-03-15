import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/constant/konekseed_color.dart';
import '../../../provider/target_provider.dart';

class BottomSheetCategory extends StatefulWidget {
  const BottomSheetCategory({
    super.key,
  });

  @override
  State<BottomSheetCategory> createState() => _BottomSheetCategoryState();
}

class _BottomSheetCategoryState extends State<BottomSheetCategory> {
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
            'Choose Category',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                          .setCategoryController('Qualitative');
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    'Qualitative',
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
                          .setCategoryController('Quantitative');
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    'Quantitative',
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
          // Container(
          //   margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          //   decoration: const BoxDecoration(
          //     color: KonekSeed.backgroundColorScreen,
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(12),
          //     ),
          //   ),
          //   child: ListTile(
          //     leading: const Icon(
          //       Icons.delete_outline_rounded,
          //       color: KonekSeed.red,
          //     ),
          //     title: const Text(
          //       'Hapus',
          //       style: TextStyle(
          //         color: KonekSeed.red,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //     onTap: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
