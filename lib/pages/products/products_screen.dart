import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_konekseed/bloc/product/product_bloc.dart';
import 'package:flutter_konekseed/common/widget/custom_app_bar.dart';

import '../../common/constant/utils.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Product Screen'),
      backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextFormField(
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
            ),
            SizedBox(
              width: double.infinity,
              height: 600,
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const Text('Load data..'),
                    loaded: (data) {
                      return ListView.builder(
                        itemCount: data.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  margin: const EdgeInsets.only(
                                      right: 20, left: 10),
                                  child: Image.asset(
                                    index.isOdd
                                        ? 'assets/images/jeruk.png'
                                        : 'assets/images/jeruk2.jpg',
                                    scale: 2.2,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.data[index].name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Price :',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 111, 110, 110),
                                              ),
                                            ),
                                            Text(
                                              'Quantity :',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 111, 110, 110),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 100),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.data[index].price.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 111, 110, 110),
                                              ),
                                            ),
                                            Text(
                                              data.data[index].quantity
                                                  .toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 111, 110, 110),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    error: (message) => const Text('Load data..'),
                    orElse: () =>
                        const Center(child: Text("Product Not Found")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
