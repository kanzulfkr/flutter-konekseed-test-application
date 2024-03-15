import 'package:flutter/material.dart';

class NotFoundDataList extends StatelessWidget {
  const NotFoundDataList({
    super.key,
    required this.value,
  });
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Image.asset(
                  'assets/images/not-found.png',
                  height: 200,
                ),
              ),
              Text(
                "Tidak ditemukan hasil ‘$value,",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 2, bottom: 30),
                child: Text(
                  'mohon memperbaiki kata kunci anda.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
