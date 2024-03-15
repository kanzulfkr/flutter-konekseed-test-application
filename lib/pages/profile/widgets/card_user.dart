import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/getUser/get_user_bloc.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Text('Load data..'),
          loaded: (data) {
            return Container(
              margin: const EdgeInsets.only(bottom: 40, top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 29,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      )),
                  Container(
                    margin: const EdgeInsets.only(left: 14, right: 26),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.data!.name!,
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          data.data!.email!,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (message) => const Text('Load data..'),
          orElse: () => const Center(child: Text("User Not Found")),
        );
      },
    );
  }
}
