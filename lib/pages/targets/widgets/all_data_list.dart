import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/constant/konekseed_color.dart';
import 'package:provider/provider.dart';

import '../../../provider/target_provider.dart';

class AllDataList extends StatelessWidget {
  const AllDataList({
    super.key,
    required this.allProducts,
  });

  final List allProducts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: allProducts.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: KonekSeed.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(index == 0 ? 12 : 0),
                bottom:
                    Radius.circular(index == allProducts.length - 1 ? 12 : 0),
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
                    allProducts[index]['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    final x =
                        Provider.of<TargetProvider>(context, listen: false);
                    x.setProductId(allProducts[index]['id']);
                    x.setProductNameController(allProducts[index]['name']);
                    Navigator.pop(context);
                  },
                ),
                index == allProducts.length - 1
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
