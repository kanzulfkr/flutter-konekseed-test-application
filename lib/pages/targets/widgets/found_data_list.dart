import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/constant/konekseed_color.dart';
import 'package:provider/provider.dart';

import '../../../provider/target_provider.dart';

class FoundDataList extends StatelessWidget {
  const FoundDataList({
    super.key,
    required this.foundProducts,
  });

  final List foundProducts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: foundProducts.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: KonekSeed.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(index == 0 ? 12 : 0),
                bottom:
                    Radius.circular(index == foundProducts.length - 1 ? 12 : 0),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    index.isOdd
                        ? 'assets/images/jeruk.png'
                        : 'assets/images/jeruk2.jpg',
                    scale: 2.2,
                  ),
                  title: Text(
                    foundProducts[index]['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    final x =
                        Provider.of<TargetProvider>(context, listen: false);
                    x.setProductId(foundProducts[index]['id']);
                    x.setProductNameController(foundProducts[index]['name']);
                    Navigator.pop(context);
                  },
                ),
                index == foundProducts.length - 1
                    ? const SizedBox()
                    : const Divider(thickness: 0.5),
              ],
            ),
          );
        },
      ),
    );
  }
}
