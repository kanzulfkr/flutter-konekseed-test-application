import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_konekseed/pages/business/widgets/deactive_dialog.dart';
import 'package:flutter_konekseed/pages/business/widgets/load_business_screen.dart';
import '../../bloc/business/business_bloc.dart';
import '../../common/constant/konekseed_color.dart';
import '../../common/widget/btn_primary.dart';
import '../../common/widget/btn_warning.dart';
import '../../common/widget/custom_app_bar.dart';
import 'add_business_screen.dart';
import 'widgets/activate_dialog.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BusinessBloc>().add(const BusinessEvent.getBusiness());
    log("Get Business Api..");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Your Business'),
      backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 700,
              child: BlocBuilder<BusinessBloc, BusinessState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const LoadBusinessScreen(),
                    loaded: (data) {
                      return ListView.builder(
                        itemCount: data.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            margin: const EdgeInsets.only(top: 20),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        child: Text(
                                          data.data[index].name.substring(0, 1),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.data[index].name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              data.data[index].status,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    data.data[index].status ==
                                                            'Active'
                                                        ? KonekSeed.primaryColor
                                                        : const Color.fromARGB(
                                                            255, 206, 11, 11),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(
                                        Icons.more_vert,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                // Image.asset(
                                //   'assets/images/media.png',
                                //   // scale: 1,
                                // ),
                                Image.network(data.data[index].logo),
                                const SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Text(
                                    data.data[index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    data.data[index].sector,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                data.data[index].status == 'Active'
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: WarningButton(
                                          name: 'Deactive your business',
                                          onPress: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DeactiveDialog(
                                                  id: data.data[index].id,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: PrimaryButton(
                                          name: 'Activate Your Business!',
                                          onPress: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return ActivateDialog(
                                                  id: data.data[index].id,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    error: (message) => const LoadBusinessScreen(),
                    orElse: () => const LoadBusinessScreen(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: KonekSeed.primaryColor,
        tooltip: 'Add Business',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddBusinessScreen(),
            ),
          );
        },
      ),
    );
  }
}
