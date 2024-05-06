import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(
      //   vertical: 10,
      // ),
      height: 50,
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text(
        "Made by Edward with Flutter 3.16",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: CustomColor.secondary,
        ),
      ),
    );
  }
}
