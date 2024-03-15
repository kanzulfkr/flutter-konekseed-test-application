import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/constant/utils.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../common/widget/dashboard_card_menu.dart';
import '../business/business_screen.dart';
import '../notification/notification_screen.dart';
import '../products/products_screen.dart';
import '../targets/targets_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    // if (context.mounted) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const CheckRole()),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
      resizeToAvoidBottomInset: false,
      body: LiquidPullToRefresh(
        height: 70,
        onRefresh: _handleRefresh,
        color: KonekSeed.primaryColor,
        animSpeedFactor: 4,
        springAnimationDurationInMilliseconds: 800,
        showChildOpacityTransition: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Business Management Aps',
                    style: TextStyle(
                      color: KonekSeed.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: '',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.notifications_rounded,
                      color: KonekSeed.primaryColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search here',
                  hintStyle:
                      TextStyle(color: KonekSeed.grey, letterSpacing: 0.4),
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
              const SizedBox(height: 30),
              CardMenu(
                image: 'matkul',
                firstTitle: 'See Your',
                secondTitle: 'Business',
                color: KonekSeed.dashboard1,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BusinessScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              CardMenu(
                image: 'jadwal',
                firstTitle: 'See Your',
                secondTitle: 'Business Targets',
                color: KonekSeed.dashboard2,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TargetsScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              CardMenu(
                image: 'khs',
                firstTitle: 'See Your',
                secondTitle: 'Products',
                color: KonekSeed.dashboard3,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
