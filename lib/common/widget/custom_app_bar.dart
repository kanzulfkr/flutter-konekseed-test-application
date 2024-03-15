import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/constant/konekseed_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: KonekSeed.white,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      iconTheme: const IconThemeData(
        color: KonekSeed.white,
      ),
      centerTitle: true,
      backgroundColor: KonekSeed.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
