import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../bloc/business/business_bloc.dart';
import '../../../bloc/logout/logout_bloc.dart';
import '../../../common/widget/btn_primary.dart';
import '../../../common/widget/btn_secondary.dart';
import '../../../provider/business_provider.dart';
import '../../auth/widget/pop_up_message.dart';

class ActivateDialog extends StatelessWidget {
  const ActivateDialog({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Activate'),
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
                      'Are you sure to activate your business?',
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
                              Provider.of<BusinessProvider>(context,
                                      listen: false)
                                  .updateStatusBusiness(id, 'Active');
                              Navigator.of(context).pop();
                              context
                                  .read<BusinessBloc>()
                                  .add(const BusinessEvent.getBusiness());
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
            // await AuthLocalDataSources().removeToken();
            // if (context.mounted) {
            //   Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const SplashScreen(),
            //     ),
            //     (Route<dynamic> route) => false,
            //   );
            // }
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
