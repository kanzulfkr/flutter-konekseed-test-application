import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_konekseed/pages/main_screen.dart';
import 'package:provider/provider.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../data/datasources/auth_local_datasources.dart';
import '../../../data/models/request/auth_request_models.dart';
import '../../../provider/user_provider.dart';
import 'pop_up_message.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => PrimaryButton(
            name: 'Login',
            onPress: () {
              if (formKey.currentState!.validate()) {
                final loginModel = AuthRequestModels(
                  email: emailController.text,
                  password: passwordController.text,
                );
                context.read<LoginBloc>().add(LoginEvent.login(loginModel));
              }
            },
          ),
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (data) async {
            AuthLocalDataSources().saveAuthData(data);
            final x = Provider.of<UserProvider>(context, listen: false);
            x.setUserId(data.data.id);
            x.setUserName(data.data.name);

            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            }
          },
          error: (message) async {
            await showDialog(
              context: context,
              builder: (context) => PopUpMessage(
                message: message,
                backgroundColor: const Color.fromARGB(255, 178, 9, 9),
              ),
            );
          },
          orElse: () => const Center(child: Text('Lemot')),
        );
      },
    );
  }
}
