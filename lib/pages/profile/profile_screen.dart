import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/card_user.dart';
import 'widgets/list_menu.dart';
import 'widgets/logout_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const CardUser(),
              Text(
                'Menu',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                margin: const EdgeInsets.only(bottom: 40, top: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListMenu(
                      iconName: Icons.person_2_outlined,
                      name: 'Ubah Profile',
                      description: 'Ubah profile Anda',
                      onTap: () {},
                    ),
                    ListMenu(
                      iconName: Icons.lock_outline,
                      name: 'Ubah Kata Sandi',
                      description: 'Ubah kata sandi Anda',
                      onTap: () {},
                    ),
                    ListMenu(
                      iconName: Icons.question_mark_outlined,
                      name: 'Pusat Bantuan',
                      description: 'Temukan jawaban terbaik Anda',
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const LanguageScreen(
                        //     title: 'Bahasa',
                        //   ),
                        // ));
                      },
                    ),
                  ],
                ),
              ),
              Text(
                'Lainnya',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                margin: const EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: ListMenu(
                  iconName: Icons.logout_outlined,
                  name: 'Keluar',
                  description: 'Keluar dari akun Anda',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const LogoutDialog();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
