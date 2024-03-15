import 'package:flutter/material.dart';
import 'package:flutter_konekseed/common/widget/skelton.dart';

class LoadBusinessScreen extends StatelessWidget {
  const LoadBusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
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
                    size: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skelton(
                        height: 18,
                        width: 200,
                      ),
                      SizedBox(height: 15),
                      Skelton(
                        height: 18,
                        width: 60,
                      ),
                    ],
                  ),
                  Skelton(
                    height: 50,
                    width: 20,
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Skelton(height: 25, width: 250),
                    SizedBox(height: 15),
                    Skelton(height: 25, width: 250),
                    SizedBox(height: 15),
                    Skelton(height: 25, width: 250),
                    SizedBox(height: 15),
                    Skelton(height: 25, width: 250),
                    SizedBox(height: 15),
                    Skelton(height: 25, width: 250),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Skelton(height: 25, width: 50),
              SizedBox(height: 20),
              Skelton(height: 50, width: 320),
            ],
          ),
        );
      },
    );
  }
}
