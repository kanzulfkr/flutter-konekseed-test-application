import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../bloc/target/target_bloc.dart';
import '../../common/constant/utils.dart';
import '../../common/widget/custom_app_bar.dart';
import 'package:intl/intl.dart';
import '../../provider/target_provider.dart';
import 'add_targets_screen.dart';
import 'widgets/header_list_targets.dart';
import 'widgets/load_targets_screen.dart';
import 'widgets/sub_header_list_targets.dart';

class TargetsScreen extends StatefulWidget {
  const TargetsScreen({super.key});

  @override
  State<TargetsScreen> createState() => _TargetsScreenState();
}

class _TargetsScreenState extends State<TargetsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TargetBloc>().add(const TargetEvent.getTarget());
    log("Get Targets Api..");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Your Targets'),
      backgroundColor: KonekSeed.backgroundColorScreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 800,
              child: BlocBuilder<TargetBloc, TargetState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const LoadTargetsScreen(),
                    loaded: (data) {
                      return ListView.builder(
                        itemCount: data.data.length,
                        itemBuilder: (context, index) {
                          DateTime currentDate = DateTime.now();
                          Duration difference =
                              data.data[index].endDate.difference(currentDate);
                          int daysDifference = difference.inDays;
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            margin: EdgeInsets.only(
                              top: 20,
                              bottom: index == data.data.length - 1 ? 150 : 0,
                            ),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeaderListTargets(
                                  id: data.data[index].id,
                                  name: data.data[index].name,
                                  businessId: data.data[index].businessId,
                                  businessName: data.data[index].businessName,
                                  productId: data.data[index].productId,
                                  productName: data.data[index].productName,
                                  category: data.data[index].category,
                                  weight: data.data[index].weight,
                                  status: data.data[index].status,
                                  startDate:
                                      data.data[index].startDate.toString(),
                                  endDate: data.data[index].endDate.toString(),
                                ),
                                SubHeaderListTargets(
                                  status: data.data[index].status,
                                  daysDifference: daysDifference,
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.data[index].productName,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text('Weight'),
                                          const Text('Category'),
                                          const Text('Start Date'),
                                          const Text('End Date'),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(''),
                                          Text(
                                            data.data[index].weight.toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            data.data[index].category,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            DateFormat('EEE, dd MMMM yyyy')
                                                .format(
                                              data.data[index].startDate,
                                            ),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            DateFormat('EEE, dd MMMM yyyy')
                                                .format(
                                                    data.data[index].endDate),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: KonekSeed.primaryColor,
        tooltip: 'Add Targets',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          var x = Provider.of<TargetProvider>(context, listen: false);
          x.setProductId(null);
          x.setProductNameController('');
          x.setCategoryController('');
          x.setStatusController('');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTargetsScreen(),
            ),
          );
        },
      ),
    );
  }
}
