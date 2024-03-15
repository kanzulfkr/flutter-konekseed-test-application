import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_konekseed/common/constant/konekseed_color.dart';
import 'package:flutter_konekseed/common/constant/konekseed_provider.dart';
import 'package:flutter_konekseed/pages/splash/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KonekSeedProvider(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: KonekSeed.primaryColor,
          statusBarColor: KonekSeed.primaryColor,
        ),
        child: MaterialApp(
          title: 'Business Management',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: KonekSeed.primaryColor,
            ),
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
