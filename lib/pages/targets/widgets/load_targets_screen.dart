import 'package:flutter/material.dart';

import '../../../common/widget/skelton.dart';

class LoadTargetsScreen extends StatelessWidget {
  const LoadTargetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.white),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleSkelton(
                    size: 45,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(
                        height: 18,
                        width: 230,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Skelton(
                            height: 18,
                            width: 60,
                          ),
                          SizedBox(width: 100),
                          Skelton(
                            height: 18,
                            width: 60,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Skelton(
                    height: 50,
                    width: 20,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: Row(
                  children: [
                    Skelton(height: 20, width: 110),
                    SizedBox(width: 70),
                    Skelton(height: 20, width: 110),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Row(
                  children: [
                    Skelton(height: 20, width: 110),
                    SizedBox(width: 70),
                    Skelton(height: 20, width: 110),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Row(
                  children: [
                    Skelton(height: 20, width: 110),
                    SizedBox(width: 70),
                    Skelton(height: 20, width: 110),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Row(
                  children: [
                    Skelton(height: 20, width: 110),
                    SizedBox(width: 70),
                    Skelton(height: 20, width: 110),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
