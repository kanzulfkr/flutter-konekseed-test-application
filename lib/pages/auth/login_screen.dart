// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import '../../common/constant/konekseed_color.dart';
import '../../common/widget/custom_app_bar.dart';
import 'widget/login_button.dart';
import 'widget/login_form_input_email.dart';
import 'widget/login_form_input_password.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Masuk'),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                height: 200,
                child: Image.asset('assets/images/logo.png'),
              ),
              const Text(
                'Silahkan Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: '',
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Masuk sebagai pengguna dengan email dan password agar dapat mengakses aplikasi ini.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: '',
                ),
              ),
              const SizedBox(height: 5),
              FormInputEmail(emailController: emailController),
              const SizedBox(height: 10),
              const Text(
                'Kata Sandi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: '',
                ),
              ),
              const SizedBox(height: 5),
              FormInputPassword(passwordController: passwordController),
              const SizedBox(height: 20),
              LoginButton(
                emailController: emailController,
                passwordController: passwordController,
                formKey: _formKey,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum Punya Akun ?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      ' Register',
                      style: TextStyle(
                        color: KonekSeed.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
