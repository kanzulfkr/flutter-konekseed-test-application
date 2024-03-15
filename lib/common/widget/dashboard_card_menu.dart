import 'package:flutter/material.dart';

import '../constant/konekseed_color.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.image,
    required this.color,
    required this.onTap,
  });

  final String firstTitle;
  final String secondTitle;
  final String image;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: KonekSeed.white,
                ),
              ),
              Text(
                secondTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: KonekSeed.white,
                ),
              ),
              GestureDetector(
                onTap: () => onTap(),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: Colors.grey.shade100,
                  ),
                  child: const Text(
                    'Lihat',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 0.5,
                      color: KonekSeed.primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              const SizedBox(
                width: 110,
              ),
              Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(90),
                  ),
                  color: Colors.white.withOpacity(0.25),
                ),
              ),
              Positioned(
                top: 15,
                left: 30,
                child: Image.asset(
                  'assets/images/$image.png',
                  scale: 2.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
