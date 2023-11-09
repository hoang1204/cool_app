import 'package:brandshop/utils/text-widget.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/images/offers3.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/offers1.png",
                      ),
                      Positioned(
                          top: 80,
                          left: 20,
                          child: TextWidget(
                            text: "MOOD BOSSTER",
                            size: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/images/offers2.png",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/images/offers4.png",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
