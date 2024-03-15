import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/widget/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Notification Screen'),
      body: Center(
        child: Text('Notification Screen'),
      ),
    );
  }
}
