import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_konekseed/pages/splash/splash_screen.dart';
import '../../../bloc/logout/logout_bloc.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../common/widget/btn_secondary.dart';
import '../../../data/datasources/auth_local_datasources.dart';
import '../../auth/widget/pop_up_message.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Logout'),
              titleTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Unfortunately, are you sure you want to exit?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 120,
                          child: SecondaryButton(
                            name: 'No',
                            onPress: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: PrimaryButton(
                            name: 'Yes',
                            onPress: () {
                              // AuthLocalDataSources().removeToken();
                              context
                                  .read<LogoutBloc>()
                                  .add(const LogoutEvent.logout());
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loaded: (success) async {
            await AuthLocalDataSources().removeToken();
            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
                (Route<dynamic> route) => false,
              );
            }
          },
          error: (error) async {
            await showDialog(
              context: context,
              builder: (context) => PopUpMessage(
                message: error,
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
    );
  }
}
