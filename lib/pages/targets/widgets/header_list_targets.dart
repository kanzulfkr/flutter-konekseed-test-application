import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/target_provider.dart';
import 'bottom_sheet.dart';

class HeaderListTargets extends StatelessWidget {
  const HeaderListTargets({
    super.key,
    required this.id,
    required this.name,
    required this.businessId,
    required this.businessName,
    required this.productId,
    required this.productName,
    required this.category,
    required this.weight,
    required this.status,
    required this.startDate,
    required this.endDate,
  });
  final int id;
  final String name;
  final int businessId;
  final String businessName;
  final int productId;
  final String productName;
  final String category;
  final int weight;
  final String status;
  final String startDate;
  final String endDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            child: Text(
              name.substring(0, 1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 240,
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
              GestureDetector(
                onTap: () {
                  var x = Provider.of<TargetProvider>(context, listen: false);
                  x.setTargetsId(id);
                  x.setNameController(name);
                  x.setProductId(productId);
                  x.setProductNameController(productName);
                  x.setBusinessId(businessId);
                  x.setCategoryController(category);
                  x.setWeightController(weight.toString());
                  x.setStatusController(status);
                  x.setStartDateController(startDate.substring(0, 10));
                  x.setEndDateController(endDate.substring(0, 10));

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetTargets(id: id);
                    },
                  );
                },
                child: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
