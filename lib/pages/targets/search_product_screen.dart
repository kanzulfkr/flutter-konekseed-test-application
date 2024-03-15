import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/widget/custom_app_bar.dart';
import 'package:flutter_konekseed/pages/targets/widgets/all_data_list.dart';
import 'package:provider/provider.dart';

import '../../common/constant/konekseed_color.dart';
import '../../common/widget/not_found_data_search.dart';
import '../../provider/target_provider.dart';
import 'widgets/found_data_list.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({super.key});

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  List<dynamic> allProducts = [];
  List<dynamic> foundProducts = [];
  bool isTextFieldActive = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    final x = Provider.of<TargetProvider>(context, listen: false);
    allProducts = x.allProduct;
    super.initState();
  }

  void _productsFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      results = allProducts;
    } else {
      results = allProducts
          .where((productName) => productName["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Choose Product'),
      resizeToAvoidBottomInset: false,
      backgroundColor: KonekSeed.backgroundColorScreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search product here',
                hintStyle: TextStyle(color: KonekSeed.grey, letterSpacing: 0.4),
                filled: true,
                fillColor: KonekSeed.secondaryColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                prefixIcon: Icon(Icons.search_sharp),
                prefixIconColor: KonekSeed.grey,
              ),
              onChanged: (value) {
                _productsFilter(value);
                setState(() {
                  isTextFieldActive = true;
                });
              },
            ),
            const SizedBox(height: 20),
            isTextFieldActive
                ? foundProducts.isNotEmpty
                    ? FoundDataList(foundProducts: foundProducts)
                    : NotFoundDataList(value: _searchController.text)
                : allProducts.isEmpty
                    ? const Text('data kosong')
                    : AllDataList(
                        allProducts: allProducts,
                      ),
          ],
        ),
      ),
    );
  }
}
