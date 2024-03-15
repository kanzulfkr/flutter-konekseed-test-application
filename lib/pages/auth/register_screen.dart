import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/constant/konekseed_color.dart';

import '../../common/widget/btn_primary.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            const Text(
              'Selamat Datang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const Spacer(flex: 1),
            const Text(
              'Masukkan username dan password agar bisa mengakses informasi administrasi.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlign: TextAlign.justify,
            ),
            const Spacer(flex: 6),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(color: KonekSeed.grey, letterSpacing: 0.4),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Alamat',
                hintStyle: TextStyle(color: KonekSeed.grey, letterSpacing: 0.4),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: KonekSeed.grey, letterSpacing: 0.4),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Konfirmasi Password',
                hintStyle: TextStyle(color: KonekSeed.grey, letterSpacing: 0.4),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
            PrimaryButton(name: 'Daftar', onPress: () {}),
            const Spacer(flex: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sudah Punya Akun?', style: primaryTextTheme.labelMedium),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Masuk', style: primaryTextTheme.labelSmall),
                )
              ],
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
