import 'package:flutter/material.dart';
import '../data/datasources/auth_local_datasources.dart';
import 'auth/login_screen.dart';
import 'main_screen.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthLocalDataSources().isLogin(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          return const MainScreen();
        } else {
          return const Login();
        }
      },
    );
  }
}
